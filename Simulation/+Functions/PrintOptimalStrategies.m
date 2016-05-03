function PrintOptimalStrategies(AttackStrategies, AttackDistribution, DefenseStrategies, DefenseDistribution)
    for i = 1:numel(AttackStrategies)
        disp(['Attack Strategy ', num2str(i), ', Probability = ', num2str(AttackDistribution(i))]);
        disp(['  ', AttackStrategies{i}.Label, ': ', AttackStrategies{i}.Name]);
    end
    
    disp(' ');
    for i = 1:numel(DefenseStrategies)
        disp(['Defense Strategy ', num2str(i), ', Probability = ', num2str(DefenseDistribution(i))]);
        for j = 1:numel(DefenseStrategies{i})
            disp(['  ', DefenseStrategies{i}{j}.Label, ': ', DefenseStrategies{i}{j}.Name]);
        end
    end
end

