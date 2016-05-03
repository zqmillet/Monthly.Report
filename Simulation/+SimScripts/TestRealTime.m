DecisionMaker.RemoveEvidences();
DecisionMaker.AddEvidences(a01, a02, a03, a08, a09, a10, a25, f08);

File = fopen('./OutputData/ComputingTime.dat', 'a+');
fprintf(File, '%s\n', datestr(now,'yyyy-mm-dd HH:MM:SS'));
fclose(File);

RepeatTime = 5;
for i = 1:RepeatTime
    tic;
    DecisionMaker.GetOptimalStrategy();
    ComputingTime = toc;
    File = fopen('./OutputData/ComputingTime.dat', 'a+');
    fprintf(File, '%s\n', num2str(ComputingTime));
    fclose(File);
    disp([num2str(i/RepeatTime*100), '%']);
end