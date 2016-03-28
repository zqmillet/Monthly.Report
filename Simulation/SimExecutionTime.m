Data = load('.\ExperimentalData\ExecutionTime\2000_10_cut_reasonable.txt')';
TimeDensity = GetDensityByStep(Data(1, :), 7);

Data1 = [];
Data2 = [];

for i = 1:size(Data, 2)
    if Data(2, i) == 100
        Data1 = [Data1, Data(1, i)];
    else
        Data2 = [Data2, Data(1, i)];
    end
end

[mu1,sigma1]=normfit(Data1(1,:));
[mu2,sigma2]=normfit(Data2(1,:));

save '.\ProcessedData\ExecutionTime\Distribution.txt' TimeDensity -ascii
disp(['Convergence:     mu = ' num2str(mu2) ', sigma = ' num2str(sigma2)]);
disp(['Non-Convergence: mu = ' num2str(mu1) ', sigma = ' num2str(sigma1)]);
disp(['Convergence number    : ' num2str(numel(Data2(1,:)))]);
disp(['Non-Convergence number: ' num2str(numel(Data1(1,:)))]);
disp(['Minimum value = ' num2str(min(Data(1, :)))]);
disp(['Maximum value = ' num2str(max(Data(1, :)))]);
disp(['Average value = ' num2str(mean(Data(1, :)))]);