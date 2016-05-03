function Parents = GetParents(FunctionNodes)
    Parents = {};
    TempParents = {};
    for i = 1:numel(FunctionNodes)
        TempParents = Functions.GetUnion(TempParents, FunctionNodes{i}.Parents);
    end
    
    for i = 1:numel(TempParents)
        if TempParents{i}.Type == Enumerations.NodeType.Function
            Parents = Functions.GetUnion(Parents, TempParents(i));
        end
    end
end

