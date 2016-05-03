function Set = SetMultiply(Set1, Set2)
% This function is used to multiply two sets.
% For example, Set1 = {1, 2, 4}, Set2 = {2, 3}, 
% then Set = {{1, 2},
%             {2   },
%             {4, 2},
%             {1, 3},
%             {2, 3},
%             {4, 3}}.
%
% Another example, Set1 = {1, 2, 4}, Set2 = {},
% then Set = {{1},
%             {2},
%             {4}}.

    if numel(Set1) == 0
        Set1 = {[]};
    end
    
    if numel(Set2) == 0
        Set2 = {[]};
    end
    
    TempSet = {};
    Set = {};
    
    for i = 1:numel(Set1)
        for j = 1:numel(Set2)
            if isa(Set1{i}, Enumerations.ClassType.Cell)
                Element1 = Set1{i};
            else
                Element1 = Set1(i);
            end
            
            if isa(Set2{j}, Enumerations.ClassType.Cell)
                Element2 = Set2{j};
            else
                Element2 = Set2(j);
            end
            
            Element = {Functions.GetUnion(Element1, Element2)};
            TempSet = Functions.GetUnion(TempSet, Element);
        end
    end
    
    for i = 1:numel(TempSet)
        Exist = false;
        for j = 1:numel(Set)
            if Functions.IsEqualCell(TempSet{i}, Set{j})
                Exist = true;
                break;
            end
        end
        
        if ~Exist
            Set = Functions.GetUnion(Set, TempSet(i));
        end
    end
end

