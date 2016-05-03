function PrintDefenseStrategies(Strategies)
    for i = 1:numel(Strategies)
        disp(['Defense Strategy ', num2str(i), ' is:']);
        for j = 1:numel(Strategies{i})
            disp(['  ', Strategies{i}{j}.Label, ': ', Strategies{i}{j}.Name])
        end
    end
end

