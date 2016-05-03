function [ANumber, DNumber] = GetStrategyProfileNumber(obj)
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
    ANumber = numel(PotentialAttackStrategies);
    DNumber = numel(PotentialDefenseStrategies);
end

