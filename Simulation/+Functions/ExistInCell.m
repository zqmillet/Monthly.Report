function Exist = ExistInCell(Array, Object)
    for i = 1:numel(Array)
        if isequal(Array{i}, Object)
            Exist = true;
            return;
        end
    end
    
    Exist = false;
end

