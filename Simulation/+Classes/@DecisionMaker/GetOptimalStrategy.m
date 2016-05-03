function [AttackStrategies, AttackDistribution, DefenseStrategies, DefenseDistribution, ADPayoffMatrix] = GetOptimalStrategy(obj)
% This function is used to obtain the optimal strategy of the system.

    %% Step 1: inference the Bayesian network.
    obj.RiskModel.BayesianNetwork.Inference();
    
    %% Step 2: get optimal system state.
    % Get the current system state according to the evidences.
    OptimalSystemState = obj.GetOptimalSystemState();
    
    %% Step 3: get potential attack strategies.
    PotentialAttackStrategies = GetPotentialAttackStrategies(obj);
    
    % The following code is used for Debug.
    % Functions.PrintAttackStrategies(PotentialAttackStrategies);
    
    %% Step 4: get potential security strategies.
    % This code is to shut down the state control module. 
    % OptimalSystemState.IsRunning = [0, 0, 0, 0];
    PotentialSecurityStrategies = GetPotentialSecurityStrategies(obj, OptimalSystemState, PotentialAttackStrategies);
    
    %% Step 5: get potential recover strategies.
    PotentialRecoverStrategies = GetPotentialRecoverStrategies(obj, OptimalSystemState);
    
    %% Step 6: get potential defense strategies.
    PotentialDefenseStrategies = Functions.SetMultiply(PotentialSecurityStrategies, PotentialRecoverStrategies);
    % disp([num2str(numel(PotentialAttackStrategies)), ' * ', num2str(numel(PotentialDefenseStrategies)), ' = ', num2str(numel(PotentialAttackStrategies) * numel(PotentialDefenseStrategies))]);
    
    for i = 1:numel(PotentialDefenseStrategies)
        while true
            ExistDoNothing = false;
            for j = 1:numel(PotentialDefenseStrategies{i})
                if isequal(PotentialDefenseStrategies{i}{j}.Name, 'do nothing');
                    if numel(PotentialDefenseStrategies{i}) > 1
                        PotentialDefenseStrategies{i}(j) = [];
                        ExistDoNothing = true;
                        break;
                    end
                end
            end
            if ~ExistDoNothing
                break;
            end
        end     
    end    
    
    % The following code is used for Debug.
    % Functions.PrintDefenseStrategies(PotentialDefenseStrategies);
    
    %% Get the payoff matrix.
    % Get the payoff matrix of control system.
    PayoffMatrix = zeros(numel(PotentialAttackStrategies) * numel(PotentialDefenseStrategies), 2);
    ADPayoffMatrix = zeros(numel(PotentialAttackStrategies), numel(PotentialDefenseStrategies));
    CurrentRisk = obj.RiskModel.GetRisk();
    for i = 1:numel(PotentialAttackStrategies)
        for j = 1:numel(PotentialDefenseStrategies)
%             Functions.PrintAttackStrategies(PotentialAttackStrategies(i));
%             Functions.PrintDefenseStrategies(PotentialDefenseStrategies(j));
            DPayoff = CurrentRisk - obj.RiskModel.GetRisk(Functions.GetUnion(PotentialAttackStrategies(i), PotentialDefenseStrategies{j}));
%             disp(num2str(DPayoff));
%             disp(' ');
            PayoffMatrix((i - 1) * numel(PotentialDefenseStrategies) + j, 1) = DPayoff;
            ADPayoffMatrix(i, j) = DPayoff;
        end
    end
    
    PayoffMatrix(:, 2) = -PayoffMatrix(:, 1); 
    [ProbabilityDistribution, ~, ~, ~] = Functions.NPlayersGame([numel(PotentialAttackStrategies), numel(PotentialDefenseStrategies)], -PayoffMatrix);
    AttackDistribution = ProbabilityDistribution(1:numel(PotentialAttackStrategies), 1);
    DefenseDistribution = ProbabilityDistribution(1:numel(PotentialDefenseStrategies), 2);
    AttackStrategies = PotentialAttackStrategies;
    DefenseStrategies = PotentialDefenseStrategies;   
end