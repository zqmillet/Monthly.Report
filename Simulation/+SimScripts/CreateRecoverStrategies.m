n01 = Classes.Strategies.Recover('reboot PLC1' ,  9000);
n02 = Classes.Strategies.Recover('reboot PLC2' ,  9000);
n03 = Classes.Strategies.Recover('reboot PLC3' , 10000);
n04 = Classes.Strategies.Recover('reboot PLC4' , 15000);
n05 = Classes.Strategies.Recover('reboot PLC5' ,  8000);
n06 = Classes.Strategies.Recover('reboot PLC6' , 10000);
n07 = Classes.Strategies.Recover('reboot PLC7' ,  2000);
n08 = Classes.Strategies.Recover('reboot PLC8' , 13000);
n09 = Classes.Strategies.Recover('reboot PLC9' , 14000);
n10 = Classes.Strategies.Recover('reboot PLC10',  7500);
n11 = Classes.Strategies.Recover('reboot PLC11', 14000);
n12 = Classes.Strategies.Recover('reboot PLC12', 11000); 
n00 = Classes.Strategies.Recover('do nothing'  ,     0); 

% n01: reboot PLC1
% f04: the traffic control function of V1
n01.AddFunctions(f04);

% n02: reboot PLC2
% f07: the switch control function of S1
n02.AddFunctions(f07);

% n03: reboot PLC3
% f08: the temperature sensation function of distillation column
% f09: the pressure sensation function of distillation column
n03.AddFunctions(f08, f09);

% n04: reboot PLC4
% f05: the traffic control function of V2
% f06: the traffic control function of V3
n04.AddFunctions(f05, f06);

% n05: reboot PLC5
% f14: the traffic control function of V4
% f15: the traffic control function of V5
n05.AddFunctions(f14, f15);

% n06: reboot PLC6
% f18: the switch control function of S2
n06.AddFunctions(f18);

% n07: reboot PLC7
% f19: the temperature sensation function of reactor 1
% f20: the pressure sensation function of reactor 1
% f21: the level sensation function of reactor 1
n07.AddFunctions(f19, f20, f21);

% n08: reboot PLC8
% f16: the traffic control function of V7
% f17: the pressure reducing function of reactor 1
n08.AddFunctions(f16, f17);

% n09: reboot PLC9
% f30: the traffic control function of V6
n09.AddFunctions(f30);

% n10: reboot PLC10
% f25: the mixing function of reactor 2
% f33: the switch control function of S3
n10.AddFunctions(f25, f33);

% n11: reboot PLC11
% f27: the temperature sensation function of reactor 2
% f28: the pressure sensation function of reactor 2
% f29: the level sensation function of reactor 2
n11.AddFunctions(f27, f28, f29);

% n12: reboot PLC12
% f31: the traffic control function of V10
% f32: the pressure reducing function of reactor 2
n12.AddFunctions(f31, f32); 

n00.AddFunctions(f01, f02, f03, f04, f05, f06, f07, f08, f09, f10, ...
                 f11, f12, f13, f14, f15, f16, f17, f18, f19, f20, ...
                 f21, f22, f23, f24, f25, f26, f27, f28, f29, f30, ...
                 f31, f32, f33, f34, f35, f36, f37, f38, f39, f40, ...
                 f41, f42, f43);