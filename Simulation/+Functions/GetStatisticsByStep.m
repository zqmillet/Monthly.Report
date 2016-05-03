function [xout] = GetStatisticsByStep(x, step)
    Max = max(x);
    Min = min(x);
    
    count = 0;
    for i = Min : step : Max
        count = count + 1;
    end
    
    st = zeros(1, count);
    
    for i = 1:numel(x)
        st(fix((x(i, 1) - Min)/step) + 1) = st(fix((x(i, 1) - Min)/step) + 1) + 1;        
    end
    
    xout = [(Min:step:Max)', st']; 
end

