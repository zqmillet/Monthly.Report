Directories = {'AnnualReviewsInControl', ...
               'ProceedingsOfTheIEEE', ...
               'IEEETransactionOnIndustrialElectronics', ...
               'IEEETransactionOnIndustrialInformatics', ...
               'IEEETransactionOnInformationForensicsAndSecurity', ...
               'SafetyScience'};

for i = 1:numel(Directories)          
    Data = importdata(['./Journals/', Directories{i},'/References.dat']);

    KeyList = Data.textdata;
    ReviewTimeList = Data.data(:, 1);
    PageNumberList = Data.data(:, 2) + 1;

    Distribution = Functions.GetDensityByStepNumber(ReviewTimeList, 25);
    SavePath = ['./OutputData/', Directories{i}, 'ReviewTimeDistribution.dat'];
    save(SavePath, '-ascii', 'Distribution');
%     figure;
%     bar(Distribution(:, 1), Distribution(:, 2));
%     title(['Review Time Distribution of ', Directories{i}]);
%     xlabel('Review Time (Day)');
%     ylabel('Paper Number');
    
    Distribution = Functions.GetDensityByStepNumber(PageNumberList, 10);
    SavePath = ['./OutputData/', Directories{i}, 'PageNumberDistribution.dat'];
    save(SavePath, '-ascii', 'Distribution');
    
%     figure;
%     bar(Distribution(:, 1), Distribution(:, 2));
%     title(['Page Number Distribution of ', Directories{i}]);
%     xlabel('Page Number');
%     ylabel('Paper Number');
    
%     figure
%     scatter(ReviewTimeList, PageNumberList);
%     title(['Relationship between Page Number and Review Time of ', Directories{i}]);
%     xlabel('Review Time (Day)');
%     ylabel('Page Number');    
    
     disp(Directories{i});
%      disp(['  The maximum review Time is ', num2str(max(ReviewTimeList)), ' days,']);
%      disp(['  The average review Time is ', num2str(mean(ReviewTimeList)), ' days,']);
%      disp(['  The minimum review Time is ', num2str(min(ReviewTimeList)), ' days.']);
%      disp(['  The maximum page number is ', num2str(max(PageNumberList)), ',']);
%      disp(['  The average page number is ', num2str(mean(PageNumberList)), ',']);
%      disp(['  The minimum page number is ', num2str(min(PageNumberList)), '.']);
    
    disp(['{', num2str(numel(ReviewTimeList)), '}']);
    disp(['{', num2str(min(ReviewTimeList)), ' Days}{', ...
        num2str(mean(ReviewTimeList)), ' Days}{', ...
        num2str(max(ReviewTimeList)), ' Days}'])
    
    disp(['{', num2str(min(PageNumberList)), '}{', ...
        num2str(mean(PageNumberList)), '}{', ...
        num2str(max(PageNumberList)), '}'])
end