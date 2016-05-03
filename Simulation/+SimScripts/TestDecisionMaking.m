%                Evidence List                             Cost   Suffix 
TestParameter = {{a01, a02},                               10000, ''; ...
                 {a01, a02, a03, a08, a09, a10, a25, f08}, 10000, 'HighCost'; ...
                 {a01, a02, a03, a08, a09, a10, a25, f08},     0, 'LowCost'};


for i = 1:size(TestParameter, 1)
    n03.Cost = TestParameter{i, 2};
    
    DecisionMaker.RemoveEvidences();
    DecisionMaker.AddEvidences(TestParameter{i, 1}{:});
    [AttackStrategies, ...
     AttackDistribution, ...
     DefenseStrategies, ...
     DefenseDistribution, ...
     PayoffMatrix] = DecisionMaker.GetOptimalStrategy();
    LaTeXCode = Functions.OptimalStrategy2LaTeX(AttackStrategies, ...
                                            AttackDistribution, ...
                                            DefenseStrategies, ...
                                            DefenseDistribution, ...
                                            PayoffMatrix);
    % Save the LaTeX code
    SavePath = '../Tables/DecisionMakingDetail';
    for j = 1:numel(DecisionMaker.RiskModel.BayesianNetwork.Evidences)
        if isequal(DecisionMaker.RiskModel.BayesianNetwork.Evidences{j}, Enumerations.EvidenceState.Happened)
            SavePath = Functions.ConcatenateString(SavePath, DecisionMaker.RiskModel.BayesianNetwork.Nodes{j}.Label);
        end
    end
    SavePath = Functions.ConcatenateString(SavePath, TestParameter{i, 3}, '.tex');
    TeXFile=fopen(SavePath, 'w+', 'n', 'UTF-8');
    fprintf(TeXFile, '%s', LaTeXCode);
    fclose(TeXFile);
end







