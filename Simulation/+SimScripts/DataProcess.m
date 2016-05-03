% Scalability Test
Data = load('./OutputData/Scalability.dat');

ProcessedData = unique(Data(:, 1:2), 'rows', 'stable');
% ANumber, DNumber, Number, Average, Maximum, Minimum
ProcessedData = [ProcessedData, ProcessedData(:, 1) .* ProcessedData(:, 2), zeros(size(ProcessedData, 1), 3)];
for i = 1:size(ProcessedData, 1)
    TempData = Data(Data(:, 1) .* Data(:, 2) == ProcessedData(i, 3), 3);
    ProcessedData(i, 4) = mean(TempData);
    ProcessedData(i, 5) = max(TempData);
    ProcessedData(i, 6) = min(TempData);
end

plot(ProcessedData(:, 3)', ProcessedData(:, 4)', '.');
hold on;
plot(ProcessedData(:, 3)', ProcessedData(:, 5)', 'r');
hold on;
plot(ProcessedData(:, 3)', ProcessedData(:, 6)', 'b');

File = fopen('./OutputData/ScalabilityStatistics.dat' ,'w+');
for i = 1:size(ProcessedData, 1)
    fprintf(File, '%d %d %d %f %f %f\n', ...
        ProcessedData(i, 1), ...
        ProcessedData(i, 2), ...
        ProcessedData(i, 3), ...
        ProcessedData(i, 4), ...
        ProcessedData(i, 5), ...
        ProcessedData(i, 6));
end
fclose(File);

[LineFittingA, LineFittingB, LineFittingR] = Functions.LineFitting(ProcessedData(:, 3)', ProcessedData(:, 4)');
LineFittingDomain = [num2str(min(ProcessedData(:, 3))), ':', num2str(max(ProcessedData(:, 3)))];
Functions.SaveVariable(Directory, LineFittingA);
Functions.SaveVariable(Directory, LineFittingB);
Functions.SaveVariable(Directory, LineFittingR);
Functions.SaveVariable(Directory, LineFittingDomain);

% Real Time Test
Data = Data(Data(:, 1) .* Data(:, 2) == 44, 3);

Statistics = Functions.GetStatisticsByStep(Data, 0.1);
save './OutputData/ComputingTimeDistribution.dat' Statistics -ascii

MaximumComputingTime = max(Data(:, 1));
Directory = './OutputData/ForLaTeX/';
Functions.SaveVariable(Directory, MaximumComputingTime);

MinimumComputingTime = min(Data(:, 1));
Functions.SaveVariable(Directory, MinimumComputingTime);

AverageComputingTime = mean(Data(:, 1));
Functions.SaveVariable(Directory, AverageComputingTime);
