function PotentialSecurityStrategies = GetPotentialSecurityStrategies(obj, OptimalSystemState, PotentialAttackStrategies)
% This function is use to get the potential security strategies according to the potential attack strategies.
    obj.AcceptableRiskRatio;

    ProtectedFunctions = {};
    for i = 1:numel(OptimalSystemState.IsRunning)
        if OptimalSystemState.IsRunning(i) == 1
            ProtectedFunctions = Functions.GetUnion(ProtectedFunctions, obj.RiskModel.SystemState.SubFunctions{i});
        end
    end
    
    PotentialSecurityStrategies = {};
    for i = 1:numel(PotentialAttackStrategies)    
        TempSecurityStrategies = {};
        
        for j = 1:numel(PotentialAttackStrategies{i}.SecurityStrategies)
            Available = true;
            for k = 1:numel(PotentialAttackStrategies{i}.SecurityStrategies{j}.Functions)
                if Functions.ExistInCell(ProtectedFunctions, PotentialAttackStrategies{i}.SecurityStrategies{j}.Functions{k})
                    Available = false;
                    break;
                end
            end
            
            if Available
                TempSecurityStrategies = Functions.GetUnion(TempSecurityStrategies, PotentialAttackStrategies{i}.SecurityStrategies(j));
            end
        end        
        
        PotentialSecurityStrategies = Functions.SetMultiply(PotentialSecurityStrategies, TempSecurityStrategies);
    end
end