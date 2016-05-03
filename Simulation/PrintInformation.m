clc;

SimScripts.CreateNodes;
SimScripts.SetConditionProbabilityTables;
SimScripts.CreateProcessesAndProducts;
SimScripts.CreateRiskModel;
SimScripts.SetSystemState;
SimScripts.CreateSecurityStrategies;
SimScripts.CreateRecoverStrategies;
SimScripts.CreateDecisionMaker;

for i = 1:numel(RiskModel.BayesianNetwork.Nodes)
    Line = [RiskModel.BayesianNetwork.Nodes{i}.Label, ': '];
    for j = 1:numel(RiskModel.BayesianNetwork.Nodes{i}.Parents)
        String = RiskModel.BayesianNetwork.Nodes{i}.Parents{j}.Label;
        Index = num2str(str2double(String(2:end)));
        Type = String(1);
        String = ['$', Type, '_{', Index, '}$'];
        Line = Functions.ConcatenateString(Line, String, ', ');
    end
    Line = [Line(1:end - 2), repmat(' ', 1, 50)];
    disp(Line);
end

for i = 1:numel(DecisionMaker.SecurityStrategies)
    Line = [DecisionMaker.SecurityStrategies{i}.Label, ': '];
    for j = 1:numel(DecisionMaker.SecurityStrategies{i}.Functions)
        String = DecisionMaker.SecurityStrategies{i}.Functions{j}.Label;
        Index = num2str(str2double(String(2:end)));
        Type = String(1);
        String = ['$', Type, '_{', Index, '}$'];
        Line = Functions.ConcatenateString(Line, String, ', ');        
    end
    Line = [Line(1:end - 2), repmat(' ', 1, 50)];
    disp(Line);
end

for i = 1:numel(DecisionMaker.SecurityStrategies)
    Line = [DecisionMaker.SecurityStrategies{i}.Label, ': '];
    for j = 1:numel(DecisionMaker.SecurityStrategies{i}.AttackStrategies.Keys)
        String = DecisionMaker.SecurityStrategies{i}.AttackStrategies.Keys{j}.Label;
        Index = num2str(str2double(String(2:end)));
        Type = String(1);
        String = ['$', Type, '_{', Index, '}$'];
        Line = Functions.ConcatenateString(Line, String, ', ');
    end
    Line = [Line(1:end - 2), repmat(' ', 1, 50)];
    disp(Line);
end

clc;
for i = 1:numel(DecisionMaker.RecoverStrategies)
    Line = [DecisionMaker.RecoverStrategies{i}.Label, ': '];
    for j = 1:numel(DecisionMaker.RecoverStrategies{i}.Functions)
        String = DecisionMaker.RecoverStrategies{i}.Functions{j}.Label;
        Index = num2str(str2double(String(2:end)));
        Type = String(1);
        String = ['$', Type, '_{', Index, '}$'];
        Line = Functions.ConcatenateString(Line, String, ', ');
    end
    Line = [Line(1:end - 2), repmat(' ', 1, 50)];
    disp(Line);
end








