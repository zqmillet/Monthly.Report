%% Create defense strategies.
m01 = Classes.Strategies.Security('shut down the web server');
m02 = Classes.Strategies.Security('shut down the personal computer 1');
m03 = Classes.Strategies.Security('shut down the personal computer 2');
m04 = Classes.Strategies.Security('shut down the personal computer 3'); 
m05 = Classes.Strategies.Security('disconnect the security gateway 1');
m06 = Classes.Strategies.Security('shut down the data server 1');
m07 = Classes.Strategies.Security('shut down the engineer station 1');
m08 = Classes.Strategies.Security('encrypt the data amongst the PLC 1-4'); 
m09 = Classes.Strategies.Security('disconnect the security gateway 2');
m10 = Classes.Strategies.Security('shut down the data server 2');
m11 = Classes.Strategies.Security('shut down the engineer station 2');
m12 = Classes.Strategies.Security('encrypt the data amongst the PLC 5-8'); 
m13 = Classes.Strategies.Security('disconnect the security gateway 3');
m14 = Classes.Strategies.Security('shut down the data server 3');
m15 = Classes.Strategies.Security('shut down the engineer station 3');
m16 = Classes.Strategies.Security('encrypt the data amongst the PLC 9-12');
m00 = Classes.Strategies.Security('do nothing');

% m01: shut down the web server
% a03: buffer overflow attack on the web server
% a04: brute force attack on the web server
m01.AddAttackStrategies(a03, 1, ...
                        a04, 1);

% m02: shut down the personal computer 1
% a05: brute force attack on the personal computer 1
m02.AddAttackStrategies(a05, 1);

% m03: shut down the personal computer 2
% a06: brute force attack on the personal computer 2
m03.AddAttackStrategies(a06, 1);

% m04: shut down the personal computer 3
% a07: brute force attack on the personal computer 3
m04.AddAttackStrategies(a07, 1);

% m05: disconnect the security gateway 1
% a08: network scanning of the industrial Ethernet 1 in the control layer
m05.AddAttackStrategies(a08, 1);

% m06: shut down the data server 1
% a10: buffer overflow attack on the data server 1
% a11: brute force attack on the data server 1
m06.AddAttackStrategies(a10, 1, ...
                        a11, 1);

% m07: shut down the engineer station 1
% a12: brute force attack on the engineer station 1
m07.AddAttackStrategies(a12, 1);

% m08: encrypt the data amongst the PLC 1-4
% a35: man-in-the-middle attack on PLC1
% a36: man-in-the-middle attack on PLC2
% a37: man-in-the-middle attack on PLC3
% a38: man-in-the-middle attack on PLC4
m08.AddAttackStrategies(a35, 1, ...
                        a36, 1, ...
                        a37, 1, ...
                        a38, 1);

% m09: disconnect the security gateway 2
% a13: network scanning of the industrial Ethernet 2 in the control layer
m09.AddAttackStrategies(a13, 1);

% m10: shut down the data server 2
% a15: buffer overflow attack on the data server 2
% a16: brute force attack on the data server 2
m10.AddAttackStrategies(a15, 1, ...
                        a16, 1);

% m11: shut down the engineer station 2
% a17: brute force attack on the engineer station 2
m11.AddAttackStrategies(a17, 1);

% m12: encrypt the data amongst the PLC 5-8
% a39: man-in-the-middle attack on PLC5
% a40: man-in-the-middle attack on PLC6
% a41: man-in-the-middle attack on PLC7
% a42: man-in-the-middle attack on PLC8
m12.AddAttackStrategies(a39, 1, ...
                        a40, 1, ...
                        a41, 1, ...
                        a42, 1);

% m13: disconnect the security gateway 3
% a18: network scanning of the industrial Ethernet 3 in the control layer
m13.AddAttackStrategies(a18, 1);

% m14: shut down the data server 3
% a20: buffer overflow attack on the data server 3
% a21: brute force attack on the data server 3
m14.AddAttackStrategies(a20, 1, ...
                        a21, 1);

% m15: shut down the engineer station 3
% a22: brute force attack on the engineer station 3
m15.AddAttackStrategies(a22, 1);

% m16: encrypt the data amongst the PLC 9-12
% a43: man-in-the-middle attack on PLC9
% a44: man-in-the-middle attack on PLC10
% a45: man-in-the-middle attack on PLC11
% a46: man-in-the-middle attack on PLC12
m16.AddAttackStrategies(a43, 1, ...
                        a44, 1, ...
                        a45, 1, ...
                        a46, 1);

% m00: do nothing
% This list shows the attack strategies which are not necessary to be handled.
m00.AddAttackStrategies(a01, 0, a02, 0, a03, 0, a04, 0, a05, 0, ...
                        a06, 0, a07, 0, a08, 0, a09, 0, a10, 0, ...
                        a11, 0, a12, 0, a13, 0, a14, 0, a15, 0, ...
                        a16, 0, a17, 0, a18, 0, a19, 0, a20, 0, ...
                        a21, 0, a22, 0, a23, 0, a24, 0, a25, 0, ...
                        a26, 0, a27, 0, a28, 0, a29, 0, a30, 0, ...
                        a31, 0, a32, 0, a33, 0, a34, 0, a35, 0, ...
                        a36, 0, a37, 0, a38, 0, a39, 0, a40, 0, ...
                        a41, 0, a42, 0, a43, 0, a44, 0, a45, 0, ...
                        a46, 0); 

% m01: shut down the web server
% nothing
m01.AddFunctions();

% m02: shut down the personal computer 1
% f35: the production scheduling function provided by personal computer 1
m02.AddFunctions(f35);

% m03: shut down the personal computer 2
% f36: the production scheduling function provided by personal computer 2
m03.AddFunctions(f36);

% m04: shut down the personal computer 3
% f37: the production scheduling function provided by personal computer 3
m04.AddFunctions(f37);

% m05: disconnect the security gateway 1
% f38: the data service of industrial Ethernet 1
m05.AddFunctions(f38);

% m06: shut down the data server 1
% f38: the data service of industrial Ethernet 1
m06.AddFunctions(f38);

% m07: shut down the engineer station 1
% f41: the configuration of PLCs of distillation column
m07.AddFunctions(f41);

% m08: encrypt the data amongst the PLC 1-4
% nothing
m08.AddFunctions();

% m09: disconnect the security gateway 2
% f39: the data service of industrial Ethernet 2
m09.AddFunctions(f39);

% m10: shut down the data server 2
% f39: the data service of industrial Ethernet 2
m10.AddFunctions(f39);

% m11: shut down the engineer station 2
% f42: the configuration of PLCs of reactor 1
m11.AddFunctions(f42);

% m12: encrypt the data amongst the PLC 5-8
% nothing
m12.AddFunctions();

% m13: disconnect the security gateway 3
% f40: the data service of industrial Ethernet 3
m13.AddFunctions(f40);

% m14: shut down the data server 3
% f40: the data service of industrial Ethernet 3
m14.AddFunctions(f40);

% m15: shut down the engineer station 3
% f43: the configuration of PLCs of reactor 2
m15.AddFunctions(f43);

% m16: encrypt the data amongst the PLC 9-12
% nothing
m16.AddFunctions(); 