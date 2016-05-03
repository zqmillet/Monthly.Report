function ShowGraph(obj)
    Labels= {};
    
    for i = 1:numel(obj.Nodes)
        Labels = Functions.GetUnion(Labels, obj.Nodes{i}.Label);
    end
    
    Graph = biograph(obj.IncidenceMatrix, Labels);
    RedColor = [1, 0, 0];
    
    for i = 1:numel(obj.Nodes)
        set(Graph.nodes(i), 'Description', [obj.Nodes{i}.Name, ' | P = ', num2str(obj.Nodes{i}.Probability)]);
        UserData = cell(2^numel(obj.Nodes{i}.Parents) + 1, 1);
        
        % Generate the title line.
        TitleLine = '';
        Locations = zeros(1, numel(obj.Nodes{i}.Parents) + 1);
        for j = 1:numel(obj.Nodes{i}.Parents)
            Locations(1, j) = numel(TitleLine);           
            
            TitleLine = Functions.ConcatenateString(TitleLine, ' ', obj.Nodes{i}.Parents{j}.Label);
        end
        
        Locations(1, end) = numel(TitleLine);
        TitleLine = Functions.ConcatenateString(TitleLine, ' ', obj.Nodes{i}.Label);
        TitleLine = strtrim(TitleLine);
        
        UserData{1} = strrep(TitleLine, ' ', '_');
           
        % Generate the conditional probability table.
        for j = 1:2^numel(obj.Nodes{i}.Parents)
            StringNumber = dec2bin(j - 1, numel(obj.Nodes{i}.Parents));
            Line = '';
            for k = 1:numel(StringNumber)
                SpaceNumber = Locations(1, k) - numel(Line);
                if StringNumber(k) == '0'                    
                    Line = Functions.ConcatenateString(Line, repmat(' ', 1, SpaceNumber), 'F');
                else                    
                    Line = Functions.ConcatenateString(Line, repmat(' ', 1, SpaceNumber), 'T');
                end
            end
            
            SpaceNumber = Locations(1, end) - numel(Line);
            Line = Functions.ConcatenateString(Line, repmat(' ', 1, SpaceNumber), num2str(obj.Nodes{i}.ConditionalProbabilities(j)));
            
            UserData{j + 1} = strrep(Line, ' ', '_'); 
        end
        set(Graph.nodes(i), 'UserData', UserData);
        
        % Change the color of the nodes in the Bayesian network.
        if isequal(obj.Evidences{i}, Enumerations.EvidenceState.Happened)
            set(Graph.nodes(i), 'Color', RedColor);
        end
        
        % Set the probabilities of nodes in the Bayesian network.
        % set(Graph.nodes(i), 'Label', ['Probability = ', num2str(obj.Nodes{i}.Probability)]);
    end 
    view(Graph);    
end

