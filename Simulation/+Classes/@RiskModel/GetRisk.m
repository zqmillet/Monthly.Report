function Risk = GetRisk(obj, StrategyProfile)
% This function is used to calculate the risk of system.
    if (nargin == 1)
        % Calculate the degradation risk.
        obj.ProductionModel.Inference();
        DegradationRisk = obj.ProductionModel.GetLoss();

        % Calculate the attack risk.
        obj.BayesianNetwork.Inference();
        AttackRisk = obj.BayesianNetwork.GetLoss();    

        % Return system risk.
        Risk = AttackRisk + DegradationRisk;
        
        % The following codes are used to debug.
        % disp(['Attack Risk = ' num2str(AttackRisk) ', Degradation Risk = ' num2str(DegradationRisk)]);
    elseif (nargin == 2)
        % Intialize the sets of recover strategies, security strategies, and attack strategies.
        RecoverStrategies = cell(0, 0);
        SecurityStrategies = cell(0, 0);
        AttackStrategies = cell(0, 0);
        
        % Read the input parameters, and assign these three sets.
        for i = 1:numel(StrategyProfile)
            if (isa(StrategyProfile{i}, Enumerations.ClassType.Node))
                if (StrategyProfile{i}.Type == Enumerations.NodeType.Attack)
                    AttackStrategies = Functions.GetUnion(AttackStrategies, StrategyProfile(i));
                    continue;
                end
            end
            
            if (isa(StrategyProfile{i}, Enumerations.ClassType.RecoverStrategy))
                RecoverStrategies = Functions.GetUnion(RecoverStrategies, StrategyProfile(i));
                continue;
            end
            
            if (isa(StrategyProfile{i}, Enumerations.ClassType.SecurityStrategy))
                SecurityStrategies = Functions.GetUnion(SecurityStrategies, StrategyProfile(i));
                continue;
            end
            
            error(Enumerations.ErrorType.InputParameterTypeError);
        end
        
        % Calculate the degradation risk.
        obj.ProductionModel.Inference();
        DegradationRisk = obj.ProductionModel.GetLoss();
        
        %% Save the Bayesian network.
        % Save the conditional probability table of each node in the Bayesian network.
        ConditionalProbabilityTables = cell(size(obj.BayesianNetwork.Nodes));
        for i = 1:numel(obj.BayesianNetwork.Nodes)
            ConditionalProbabilityTables{i} = obj.BayesianNetwork.Nodes{i}.ConditionalProbabilities;
        end
        
        % Save the evidence list of the Bayesian network.
        EvidenceList = obj.BayesianNetwork.Evidences;
        
        % Save the probabilities of nodes in the Bayesian network.
        NodeProbabilities = zeros(size(obj.BayesianNetwork.Nodes));
        for i = 1:numel(obj.BayesianNetwork.Nodes)
            NodeProbabilities(1, i) = obj.BayesianNetwork.Nodes{i}.Probability;
        end
        
        %% Modify the Bayesian network.
        % Handle the potential attack strategies, add all potential attack strategies into the evidences list.
        AttackStrategies = Functions.UniqueCell(AttackStrategies);
        obj.BayesianNetwork.AddEvidences(AttackStrategies{:});
        
        % Handle the security strategies, change the conditional probabilities of the corresponding attack node.
        SecurityStrategies = Functions.UniqueCell(SecurityStrategies);
        % obj.BayesianNetwork.PrintConditionalProbabilityTable('a08', 'a13', 'a18');
        obj.BayesianNetwork.SetSecurityStrategies(SecurityStrategies{:});
        % obj.BayesianNetwork.PrintConditionalProbabilityTable('a08', 'a13', 'a18');
        
        % Handle the recover strategies, get the set of function which should be recovered by recover strategies.
        RecoverFunctions = cell(0, 0);
        RecoverStrategies = Functions.UniqueCell(RecoverStrategies);
        for i = 1:numel(RecoverStrategies)
            RecoverFunctions = Functions.GetUnion(RecoverFunctions, RecoverStrategies{i}.Functions);
        end    
        % For each function which will be recovered by recover strategies, remove it from the evidence list.
        if ~isempty(RecoverFunctions)
            obj.BayesianNetwork.RemoveEvidences(RecoverFunctions{:});
        end
        
        % Handle the security strategies, get the set of functions which should be shut down by security strategies.
        ShutDownFunctions = cell(0, 0);        
        for i = 1:numel(SecurityStrategies)
            ShutDownFunctions = Functions.GetUnion(ShutDownFunctions, SecurityStrategies{i}.Functions);
        end
        
        % For each function which will be shut down by security strategies, ...
        for i = 1:numel(ShutDownFunctions)
            % set its probability to 1,
            ShutDownFunctions{i}.Probability = 1;
            % set its conditional probability table to 0.
            ShutDownFunctions{i}.ConditionalProbabilities = zeros(1, 2^numel(ShutDownFunctions{i}.Parents));
        end        
        
        % Calculate the attack risk.
        obj.BayesianNetwork.Initialize();
        obj.BayesianNetwork.Inference();
        AttackRisk = obj.BayesianNetwork.GetLoss();
        
        RecoverStrategyCost = 0;
        % Calculate the recover strategy cost.
        for i = 1:numel(RecoverStrategies)
            RecoverStrategyCost = RecoverStrategyCost + RecoverStrategies{1, i}.Cost;
        end
        
        % Return system risk.
        % Risk = AttackRisk;
        Risk = AttackRisk + DegradationRisk + RecoverStrategyCost;
        
        % The following codes are used for Debug.
        % disp(['Attack Risk = ' num2str(AttackRisk) ', Degradation Risk = ' num2str(DegradationRisk), ', Recover Strategy Cost = ', num2str(RecoverStrategyCost)]);
        
        %% Resume the Bayesian network.
        for i = 1:numel(obj.BayesianNetwork.Nodes)
            obj.BayesianNetwork.Nodes{i}.ConditionalProbabilities = ConditionalProbabilityTables{i};
        end
        
        obj.BayesianNetwork.Evidences = EvidenceList;
        
        for i = 1:numel(obj.BayesianNetwork.Nodes)
            obj.BayesianNetwork.Nodes{i}.Probability = NodeProbabilities(1, i);
        end
    end
end

