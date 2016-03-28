Data = load('.\ExperimentalData\DynamicRisk\Risk.with.Evidences.txt');
Size = size(Data);

if mod(size(Data, 2), 2) ~= 1
    error('column number error!');
end

Delta = 2/(size(Data, 2) - 3);
mu = 0;
Point = [0, 0, 0];

fid=fopen('.\ProcessedData\RiskCurve\FuzzyCurve.txt','w');

for i = 2:size(Data, 1) - 1
    mu = 0;
    flag = Data(i, 2:end) ~= Data(i + 1, 2:end) | Data(i, 2:end) ~= Data(i - 1, 2:end) | (i == 2) | i == size(Data, 1)-1;
    for j = 2:2:size(Data, 2)
        Point = [Data(i, 1), Data(i, j), mu];
        mu = mu + Delta;
        if (flag)
            fprintf(fid,'%f %f %f\n',Point(1), Point(2), Point(3));
        end        
    end
    
    mu = 1;
    for j = size(Data, 2):-2:2
        Point = [Data(i, 1), Data(i, j), mu];
        mu = mu - Delta;
        if (flag)
            fprintf(fid,'%f %f %f\n',Point(1), Point(2), Point(3));
        end    
    end
    if (flag)
            fprintf(fid,'\n');
    end
end

HighestPoints = [Data(:, 1), Data(:, end), ones(size(Data(:, 1)))];
save '.\ProcessedData\RiskCurve\RiskPeakCurve.txt' HighestPoints -ascii

Time = [40, 220, 350];
Points = zeros(Size(1,2), 2);
for t = 1:numel(Time)
    fid=fopen(['.\ProcessedData\RiskCurve\FuzzyRiskAt' num2str(Time(t)) '.txt'],'w');
    for i = 2:size(Data, 1) - 1
        if Data(i, 1) ~= Time(t)
            continue;
        end
        mu = 0;
        flag = 1;
        for j = 2:2:size(Data, 2)
            Point = [Data(i, 1), Data(i, j), mu];
            mu = mu + Delta;
            if (flag)
                fprintf(fid,'%f %f\n', Point(2), Point(3));
            end        
        end

        mu = 1;
        for j = size(Data, 2):-2:2
            Point = [Data(i, 1), Data(i, j), mu];
            mu = mu - Delta;
            if (flag)
                fprintf(fid,'%f %f\n', Point(2), Point(3));
            end    
        end
        if (flag)
                fprintf(fid,'\n');
        end
    end
end
fclose('all');
