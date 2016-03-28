SimulationPlan = [5, 10:10:100];

MaxExeTime = zeros(size(SimulationPlan));
MinExeTime = zeros(size(SimulationPlan));
AverExeTime = zeros(size(SimulationPlan));

Index = 1;
for i = SimulationPlan
    Data = load(['.\ExperimentalData\ExecutionTime\2000_' num2str(i) '_cut_reasonable.txt'])';
    Data = Data(1, :);
    
    MaxExeTime(1, Index) = max(Data);
    MinExeTime(1, Index) = min(Data);
    AverExeTime(1, Index) = mean(Data);
    Index = Index + 1;
end

[a, b, r] = LineFitting(SimulationPlan, AverExeTime);
disp(['Line Equation: y = ' num2str(b) 'x + ' num2str(a)]);
disp(['Correlation Coefficient r = ' num2str(r)]);

MaxExeTime = [SimulationPlan', MaxExeTime'];
MinExeTime = [SimulationPlan', MinExeTime'];
AverExeTime = [SimulationPlan', AverExeTime'];
save '.\ProcessedData\Scalability\AverExecutionTime.txt' AverExeTime -ascii
save '.\ProcessedData\Scalability\MinExecutionTime.txt' MinExeTime -ascii
save '.\ProcessedData\Scalability\MaxExecutionTime.txt' MaxExeTime -ascii
% plot(SimulationPlan, AverExeTime, SimulationPlan, MinExeTime, SimulationPlan, MaxExeTime);