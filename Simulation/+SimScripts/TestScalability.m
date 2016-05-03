

RepeatTime = 200;
EvidenceLists = {{a01}, ... 1 * 1 = 1
                 {f08, f07}, ... 1 * 4 = 4
                 {a01, a02}, ... 5 * 2 = 10    
                 {a01, a02, a03}, ... 7 * 2 = 14                  
                 {a01, a02, a03, a08, a09, a10, a25}, ... 11 * 2 = 18
                 {a01, a02, a03, a08, a09, a10}, ... 12 * 2 = 20                 
                 {a01, a02, a03, a08, a09, a10, a25, f08}, ... 11 * 4 = 36
                 {a01, a02, a03, a08, a09, a10, a25, f08, f07}}; % 11 * 8 = 72

FilePath = './OutputData/Scalability.dat';
File = fopen(FilePath, 'a+');
fprintf(File, '%s\n', datestr(now,'yyyy-mm-dd HH:MM:SS'));
fclose(File);
 
for i = 1:numel(EvidenceLists)
    DecisionMaker.RemoveEvidences();
    DecisionMaker.AddEvidences(EvidenceLists{i}{:});
    [ANumber, DNumber] = DecisionMaker.GetStrategyProfileNumber();    
    for j = 1:RepeatTime
        tic;
        DecisionMaker.GetOptimalStrategy();
        ComputingTime = toc;
        disp([num2str(j/RepeatTime*100), '%, ', num2str(ComputingTime)]);
        File = fopen(FilePath, 'a+');
        fprintf(File, '%d %d %f\n', ANumber, DNumber, ComputingTime);
        fclose(File);
    end
end


