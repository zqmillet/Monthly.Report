function PotentialAttackStrategies = GetPotentialAttackStrategies(obj)
% This function is used to get the potential attack strategies according to the Bayesian network the evidence list.
    PotentialAttackStrategies = {};
    for i = 1:numel(obj.RiskModel.BayesianNetwork.Nodes)
        if (obj.RiskModel.BayesianNetwork.Nodes{i}.Type == Enumerations.NodeType.Attack)
            % IF the attack strategy is in the evidences list, it is the potential attack strategy.
%             if ~isequal(obj.RiskModel.BayesianNetwork.Evidences{obj.RiskModel.BayesianNetwork.Nodes{i}.Index}, Enumerations.EvidenceState.Unknown)
%                 PotentialAttackStrategies = Functions.GetUnion(PotentialAttackStrategies, obj.RiskModel.BayesianNetwork.Nodes(i));
%                 continue;
%             end
            
            % Get the index of conditional probability, index = (b1 b2 b3 ... bn)2
            Index = 0;
            for j = 1:numel(obj.RiskModel.BayesianNetwork.Nodes{i}.Parents)
                if isequal(obj.RiskModel.BayesianNetwork.Evidences{obj.RiskModel.BayesianNetwork.Nodes{i}.Parents{j}.Index}, Enumerations.EvidenceState.Happened)
                    Index = 2 * Index + 1; 
                else
                    Index = 2 * Index;
                end
            end
            
            if obj.RiskModel.BayesianNetwork.Nodes{i}.ConditionalProbabilities(Index + 1) > 0 && ...
               isequal(obj.RiskModel.BayesianNetwork.Evidences{obj.RiskModel.BayesianNetwork.Nodes{i}.Index}, Enumerations.EvidenceState.Unknown)
                PotentialAttackStrategies = Functions.GetUnion(PotentialAttackStrategies, obj.RiskModel.BayesianNetwork.Nodes(i));
            end
            
            % PotentialAttackStrategies = {obj.RiskModel.BayesianNetwork.Nodes{i}};
        end
    end
   
end

