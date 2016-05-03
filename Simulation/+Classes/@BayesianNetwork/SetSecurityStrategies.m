function SetSecurityStrategies(obj, varargin)
    % If the number of parameters is not equal to 2, throw an error.
    if (nargin < 2)
        return;
    end
    
    % For each parameter (security strategy), ...
    for i = 1:numel(varargin)
        % if it is not a security strategy, throw an error.
        if (~isa(varargin{i}, Enumerations.ClassType.SecurityStrategy))
            error(Enumerations.ErrorType.InputParameterTypeError);
        end
        
        % For each attack strategy which will be prevented by this security strategy, ...
        for j = 1:numel(varargin{i}.AttackStrategies.Keys)
            if (varargin{i}.AttackStrategies.Values{j} == 0)
                continue;
            end
            
            % Get all its child nodes, and form them into a set.
            ChildSet = obj.GetChildSet(varargin{i}.AttackStrategies.Keys{j});
            % For each its child node, ...
            for k = 1:numel(ChildSet)
                % Get the index of the parent node.
                Index = 0;
                for l = 1:numel(ChildSet{k}.Parents)
                    Index = Index + 1;
                    if (isequal(ChildSet{k}.Parents{l}, varargin{i}.AttackStrategies.Keys{j}))
                        break;
                    end
                end
                
                for l = 1:numel(ChildSet{k}.ConditionalProbabilities)
                    BinaryString = dec2bin(l - 1, numel(ChildSet{k}.Parents));
                    if BinaryString(Index) == '1'
                        BinaryString(Index) = '0';
                        ChildSet{k}.ConditionalProbabilities(l) = ChildSet{k}.ConditionalProbabilities(bin2dec(BinaryString) + 1);
                    end
                end

%                 if (isequal(ChildSet{k}.Label, 'a08'))
%                     disp([varargin{i}.AttackStrategies.Keys{j}.Label, ': ', varargin{i}.AttackStrategies.Keys{j}.Name]);
%                     disp([ChildSet{k}.Label, ': ', ChildSet{k}.Name]);
%                     disp(num2str(ChildSet{k}.ConditionalProbabilities));
%                 end
                
                % update the conditional probability table of this child node,
                % ChildSet{k}.ConditionalProbabilities = ChildSet{k}.ConditionalProbabilities .* CoefficientVector;
                
                
                % and change its conditional probability table.
                
            end
        end
    end
end

