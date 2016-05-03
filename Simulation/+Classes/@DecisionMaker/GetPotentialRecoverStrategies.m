function PotentialRecoverStrategies = GetPotentialRecoverStrategies(obj, OptimalSystemState)
% This function is used to get the potential recover strategies.
    
    % Get the function set which will be protected.
    ProtectedFunctions = obj.RiskModel.SystemState.Bases;
    for i = 1:numel(obj.RiskModel.SystemState.Bases)
        if OptimalSystemState.IsRunning(i) == 1
            ProtectedFunctions = Functions.GetUnion(ProtectedFunctions, obj.RiskModel.SystemState.SubFunctions{i});
        end
    end
    
    % Get the function set which has been attacked.
%     FailedFunctions = {};
%     for i = 1:numel(obj.RiskModel.BayesianNetwork.Nodes)
%         if obj.RiskModel.BayesianNetwork.Nodes{i}.Type == Enumerations.NodeType.Function
%             if obj.RiskModel.BayesianNetwork.Nodes{i}.Probability == 1
%                 FailedFunctions = Functions.GetUnion(FailedFunctions, obj.RiskModel.BayesianNetwork.Nodes(i));
%             end
%         end
%     end
    
    % Get the function set which will be recovered.
    RecoveredFunctions = {};
    for i = 1:numel(ProtectedFunctions)
        if ProtectedFunctions{i}.Probability == 1
            RecoveredFunctions = Functions.GetUnion(RecoveredFunctions, ProtectedFunctions(i));
        end
    end
    
    PotentialRecoverStrategies = {};
    for i = 1:numel(RecoveredFunctions)
        PotentialRecoverStrategies = Functions.SetMultiply(PotentialRecoverStrategies, RecoveredFunctions{i}.RecoverStrategies);
    end
end

