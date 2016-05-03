function Inference(obj)
    
    if (nargin ~= 1)
        error(Enumerations.ErrorType.InputParameterNumberError);
    end
    
    obj.BayesianNetwork.Initialize();
    obj.ProductionModel.Initialize();
    obj.SystemState.GetCurrentState();
    
    % Get the sub functions for the bases of the system state.
    obj.SystemState.SubFunctions = cell(1, 4);
    for i = 1:numel(obj.SystemState.Bases)
        TempFunctions = obj.SystemState.Bases{i}.Parents;
        SubFunctions = TempFunctions;
        while true
            TempFunctions = Functions.GetParents(TempFunctions);
            if numel(TempFunctions) == 0
                break;
            end
            SubFunctions = Functions.GetUnion(SubFunctions, TempFunctions);
        end
        obj.SystemState.SubFunctions{1, i} = SubFunctions;
    end
end

