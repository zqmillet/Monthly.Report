function xout = GetDensity(x, Number) 
    Max = max(x);
    Min = min(x);
    
    step = ((Max - Min)/Number);
    
    count = 0;
    for i = Min : step : Max
        count = count + 1;
    end
    
    st = zeros(1, count);
    
    for i = 1:size(x,2)
        st(fix((x(1, i) - Min)/step) + 1) = st(fix((x(1, i) - Min)/step) + 1) + 1;        
    end
    st = st/size(x,2);
    xout = [(Min:step:Max)', st'];    
end

