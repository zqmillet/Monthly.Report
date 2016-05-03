function Bool = IsEqualCell(Cell1, Cell2)
    Bool = true;
    
    if numel(Cell1) ~= numel(Cell2)
        Bool = false;
        return;
    end
    
    for i = 1:numel(Cell1)
        Exist = false;
        for j = 1:numel(Cell2)
            if isequal(Cell1{i}, Cell2{j})
                Exist = true;
                break;
            end
        end
        
        if ~Exist
            Bool = false;
            return;
        end
    end
end

