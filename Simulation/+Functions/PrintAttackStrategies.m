function PrintAttackStrategies(Strategies)
    disp('Attack Strategies are:');
    for i = 1:numel(Strategies)
        disp(['  ', Strategies{i}.Label, ': ', Strategies{i}.Name]);
    end
end

