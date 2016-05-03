%% Create Processes.
p01 = Classes.Process('distillation');
p02 = Classes.Process('heating');
p03 = Classes.Process('mixing & heating');


%% Set the conditional probabilities of processes.
% p01: distillation
% f01: distillation
p01.AddAllParents(f01, ...
    0,          ... F
    1);           % T

% p02: heating
% f10: heating
p02.AddAllParents(f10, ...
    0,          ... F
    1);           % T

% p03: mixing & heating
% f22: mixing & heating
p03.AddAllParents(f22, ...
    0,          ... F
    1);           % T

%% Create product.
s01 = Classes.Product('semi-product 1', 10000);
s02 = Classes.Product('semi-product 2', 20000);
s03 = Classes.Product('product 1'     , 50000);
s04 = Classes.Product('product 2'     , 70000);
 
p01.AddOutputs(s01, s02);
p02.AddOutputs(s03);
p03.AddOutputs(s04);

p02.AddInputs(s01);
p03.AddInputs(s02);