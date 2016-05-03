function PrintRelationship(obj)
% This function is used to print the relationship between nodes in the Bayesian network, for tikz/pgf.

    for i = 1:numel(obj.Nodes)
        for j = 1:numel(obj.Nodes{i}.Parents)
            disp([obj.Nodes{i}.Parents{j}.Label, '/', obj.Nodes{i}.Label, ',']);
        end
    end
end

