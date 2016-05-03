function PrintConditionalProbabilityTable(obj, varargin)
% This function is used to print the conditional probability table of each node in the Bayesian network.
    
    for i = 1:numel(varargin)
        if ~isa(varargin{i}, Enumerations.ClassType.Char)
            error(Enumerations.ErrorType.InputParameterTypeError);
        end
        
        for j = 1:numel(obj.Nodes)
            if ~isequal(varargin{i}, obj.Nodes{j}.Label)
                continue;
            end
            
            String = [obj.Nodes{j}.Label, ':'];
            for k = 1:numel(obj.Nodes{j}.ConditionalProbabilities)
               String = Functions.ConcatenateString(String, ' ', num2str(obj.Nodes{j}.ConditionalProbabilities(k)));
            end

            disp(String);
        end        
    end
end

