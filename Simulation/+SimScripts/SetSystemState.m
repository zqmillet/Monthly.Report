%% Set the definition of system state.
% f01: distillation
% f10: heating
% f22: mixing & heating
% f34: production scheduling
RiskModel.AddAllBases(f01, f10, f22, f34, ...
    1,              ... F    F    F    F
    0,              ... F    F    F    T
    0,              ... F    F    T    F
    0,              ... F    F    T    T
    0,              ... F    T    F    F
    0,              ... F    T    F    T
    0,              ... F    T    T    F
    0,              ... F    T    T    T
    0,              ... T    F    F    F
    1,              ... T    F    F    T
    0,              ... T    F    T    F
    1,              ... T    F    T    T
    0,              ... T    T    F    F
    1,              ... T    T    F    T
    0,              ... T    T    T    F
    1);               % T    T    T    T); 
