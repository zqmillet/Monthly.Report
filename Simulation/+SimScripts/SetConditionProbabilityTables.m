%% Set the conditional probabilities of nodes.
% Set attack nodes.
% a01: network scanning of the Ethernet in the management layer
a01.AddAllParents(... Has no parent node
    0.00000001);

% a02: vulnerability scanning of the devices in the management layer
% a01: network scanning of the Ethernet in the management layer
a02.AddAllParents(a01, ...
    0.00000000, ... T
    0.99999900);  % F

% a03: buffer overflow attack on the web server
% a02: vulnerability scanning of the devices in the management layer
a03.AddAllParents(a02, ...
    0.00000000, ... T
    0.10000000);  % F

% a04: brute force attack on the web server
% a02: vulnerability scanning of the devices in the management layer
a04.AddAllParents(a02, ...
    0.00000000, ... T
    0.10000000);  % F

% a05: brute force attack on the personal computer 1
% a02: vulnerability scanning of the devices in the management layer
a05.AddAllParents(a02, ...
    0.00000000, ... T
    0.10000000);  % F

% a06: brute force attack on the personal computer 2
% a02: vulnerability scanning of the devices in the management layer
a06.AddAllParents(a02, ...
    0.00000000, ... T
    0.10000000);  % F

% a07: brute force attack on the personal computer 3
% a02: vulnerability scanning of the devices in the management layer
a07.AddAllParents(a02, ...
    0.00000000, ... T
    0.10000000);  % F

% a08: network scanning of the industrial Ethernet 1 in the control layer
% a03: buffer overflow attack on the web server
% a04: brute force attack on the web server
% a05: brute force attack on the personal computer 1
% a06: brute force attack on the personal computer 2
% a07: brute force attack on the personal computer 3
a08.AddAllParents(a03, a04, a05, a06, a07, ...
    0.00000000, ... F    F    F    F    F
    0.10000000, ... F    F    F    F    T
    0.10000000, ... F    F    F    T    F
    0.20000000, ... F    F    F    T    T
    0.10000000, ... F    F    T    F    F
    0.20000000, ... F    F    T    F    T
    0.20000000, ... F    F    T    T    F
    0.30000000, ... F    F    T    T    T
    0.10000000, ... F    T    F    F    F
    0.20000000, ... F    T    F    F    T
    0.20000000, ... F    T    F    T    F
    0.30000000, ... F    T    F    T    T
    0.20000000, ... F    T    T    F    F
    0.40000000, ... F    T    T    F    T
    0.30000000, ... F    T    T    T    F
    0.60000000, ... F    T    T    T    T
    0.10000000, ... T    F    F    F    F
    0.20000000, ... T    F    F    F    T
    0.30000000, ... T    F    F    T    F
    0.30000000, ... T    F    F    T    T
    0.20000000, ... T    F    T    F    F
    0.30000000, ... T    F    T    F    T
    0.30000000, ... T    F    T    T    F
    0.50000000, ... T    F    T    T    T
    0.30000000, ... T    T    F    F    F
    0.30000000, ... T    T    F    F    T
    0.30000000, ... T    T    F    T    F
    0.60000000, ... T    T    F    T    T
    0.40000000, ... T    T    T    F    F
    0.50000000, ... T    T    T    F    T
    0.70000000, ... T    T    T    T    F
    0.90000000);  % T    T    T    T    T

% a09: vulnerability scanning of the devices in the industrial Ethernet 1
% a08: network scanning of the industrial Ethernet 1 in the control layer
a09.AddAllParents(a08, ...
    0.00000000, ... T
    0.99999900);  % F

% a10: buffer overflow attack on the data server 1
% a09: vulnerability scanning of the devices in the industrial Ethernet 1
a10.AddAllParents(a09, ...
    0.00000000, ... T
    0.10000000);  % F

% a11: brute force attack on the data server 1
% a09: vulnerability scanning of the devices in the industrial Ethernet 1
a11.AddAllParents(a09, ...
    0.00000000, ... T
    0.10000000);  % F

% a12: brute force attack on the engineer station 1
% a09: vulnerability scanning of the devices in the industrial Ethernet 1
a12.AddAllParents(a09, ...
    0.00000000, ... T
    0.10000000);  % F

% a13: network scanning of the industrial Ethernet 2 in the control layer
% a03: buffer overflow attack on the web server
% a04: brute force attack on the web server
% a05: brute force attack on the personal computer 1
% a06: brute force attack on the personal computer 2
% a07: brute force attack on the personal computer 3
a13.AddAllParents(a03, a04, a05, a06, a07, ...
    0.00000000, ... F    F    F    F    F
    0.10000000, ... F    F    F    F    T
    0.10000000, ... F    F    F    T    F
    0.20000000, ... F    F    F    T    T
    0.10000000, ... F    F    T    F    F
    0.20000000, ... F    F    T    F    T
    0.20000000, ... F    F    T    T    F
    0.30000000, ... F    F    T    T    T
    0.10000000, ... F    T    F    F    F
    0.20000000, ... F    T    F    F    T
    0.20000000, ... F    T    F    T    F
    0.30000000, ... F    T    F    T    T
    0.20000000, ... F    T    T    F    F
    0.40000000, ... F    T    T    F    T
    0.30000000, ... F    T    T    T    F
    0.60000000, ... F    T    T    T    T
    0.10000000, ... T    F    F    F    F
    0.20000000, ... T    F    F    F    T
    0.30000000, ... T    F    F    T    F
    0.30000000, ... T    F    F    T    T
    0.20000000, ... T    F    T    F    F
    0.30000000, ... T    F    T    F    T
    0.30000000, ... T    F    T    T    F
    0.50000000, ... T    F    T    T    T
    0.30000000, ... T    T    F    F    F
    0.30000000, ... T    T    F    F    T
    0.30000000, ... T    T    F    T    F
    0.60000000, ... T    T    F    T    T
    0.40000000, ... T    T    T    F    F
    0.50000000, ... T    T    T    F    T
    0.70000000, ... T    T    T    T    F
    0.90000000);  % T    T    T    T    T

% a14: vulnerability scanning of the devices in the industrial Ethernet 2
% a13: network scanning of the industrial Ethernet 2 in the control layer
a14.AddAllParents(a13, ...
    0.00000000, ... T
    0.99999900);  % F

% a14: vulnerability scanning of the devices in the industrial Ethernet 2
% a15: buffer overflow attack on the data server 2
a15.AddAllParents(a14, ...
    0.00000000, ... T
    0.10000000);  % F

% a16: brute force attack on the data server 2
% a14: vulnerability scanning of the devices in the industrial Ethernet 2
a16.AddAllParents(a14, ...
    0.00000000, ... T
    0.10000000);  % F

% a17: brute force attack on the engineer station 2
% a14: vulnerability scanning of the devices in the industrial Ethernet 2
a17.AddAllParents(a14, ...
    0.00000000, ... T
    0.10000000);  % F

% a18: network scanning of the industrial Ethernet 3 in the control layer
% a03: buffer overflow attack on the web server
% a04: brute force attack on the web server
% a05: brute force attack on the personal computer 1
% a06: brute force attack on the personal computer 2
% a07: brute force attack on the personal computer 3
a18.AddAllParents(a03, a04, a05, a06, a07, ...
    0.00000000, ... F    F    F    F    F
    0.10000000, ... F    F    F    F    T
    0.10000000, ... F    F    F    T    F
    0.20000000, ... F    F    F    T    T
    0.10000000, ... F    F    T    F    F
    0.20000000, ... F    F    T    F    T
    0.20000000, ... F    F    T    T    F
    0.30000000, ... F    F    T    T    T
    0.10000000, ... F    T    F    F    F
    0.20000000, ... F    T    F    F    T
    0.20000000, ... F    T    F    T    F
    0.30000000, ... F    T    F    T    T
    0.20000000, ... F    T    T    F    F
    0.40000000, ... F    T    T    F    T
    0.30000000, ... F    T    T    T    F
    0.60000000, ... F    T    T    T    T
    0.10000000, ... T    F    F    F    F
    0.20000000, ... T    F    F    F    T
    0.30000000, ... T    F    F    T    F
    0.30000000, ... T    F    F    T    T
    0.20000000, ... T    F    T    F    F
    0.30000000, ... T    F    T    F    T
    0.30000000, ... T    F    T    T    F
    0.50000000, ... T    F    T    T    T
    0.30000000, ... T    T    F    F    F
    0.30000000, ... T    T    F    F    T
    0.30000000, ... T    T    F    T    F
    0.60000000, ... T    T    F    T    T
    0.40000000, ... T    T    T    F    F
    0.50000000, ... T    T    T    F    T
    0.70000000, ... T    T    T    T    F
    0.90000000);  % T    T    T    T    T

% a19: vulnerability scanning of the devices in the industrial Ethernet 3
% a18: network scanning of the industrial Ethernet 3 in the control layer
a19.AddAllParents(a18, ...
    0.00000000, ... T
    0.99999900);  % F

% a20: buffer overflow attack on the data server 3
% a19: vulnerability scanning of the devices in the industrial Ethernet 3
a20.AddAllParents(a19, ...
    0.00000000, ... T
    0.10000000);  % F

% a21: brute force attack on the data server 3
% a19: vulnerability scanning of the devices in the industrial Ethernet 3
a21.AddAllParents(a19, ...
    0.00000000, ... T
    0.10000000);  % F

% a22: brute force attack on the engineer station 3
% a19: vulnerability scanning of the devices in the industrial Ethernet 3
a22.AddAllParents(a19, ...
    0.00000000, ... T
    0.10000000);  % F

% a23: DoS attack on PLC1
% a10: buffer overflow attack on the data server 1
% a11: brute force attack on the data server 1
% a12: brute force attack on the engineer station 1
a23.AddAllParents(a10, a11, a12, ...
    0.00000000, ... F    F    F
    0.30000000, ... F    F    T
    0.30000000, ... F    T    F
    0.30000000, ... F    T    T
    0.30000000, ... T    F    F
    0.30000000, ... T    F    T
    0.30000000, ... T    T    F
    0.30000000);  % T    T    T

% a24: DoS attack on PLC2
% a10: buffer overflow attack on the data server 1
% a11: brute force attack on the data server 1
% a12: brute force attack on the engineer station 1
a24.AddAllParents(a10, a11, a12, ...
    0.00000000, ... F    F    F
    0.30000000, ... F    F    T
    0.30000000, ... F    T    F
    0.30000000, ... F    T    T
    0.30000000, ... T    F    F
    0.30000000, ... T    F    T
    0.30000000, ... T    T    F
    0.30000000);  % T    T    T

% a25: DoS attack on PLC3
% a10: buffer overflow attack on the data server 1
% a11: brute force attack on the data server 1
% a12: brute force attack on the engineer station 1
a25.AddAllParents(a10, a11, a12, ...
    0.00000000, ... F    F    F
    0.30000000, ... F    F    T
    0.30000000, ... F    T    F
    0.30000000, ... F    T    T
    0.30000000, ... T    F    F
    0.30000000, ... T    F    T
    0.30000000, ... T    T    F
    0.30000000);  % T    T    T

% a26: DoS attack on PLC4
% a10: buffer overflow attack on the data server 1
% a11: brute force attack on the data server 1
% a12: brute force attack on the engineer station 1
a26.AddAllParents(a10, a11, a12, ...
    0.00000000, ... F    F    F
    0.30000000, ... F    F    T
    0.30000000, ... F    T    F
    0.30000000, ... F    T    T
    0.30000000, ... T    F    F
    0.30000000, ... T    F    T
    0.30000000, ... T    T    F
    0.30000000);  % T    T    T

% a27: DoS attack on PLC5
% a15: buffer overflow attack on the data server 2
% a16: brute force attack on the data server 2
% a17: brute force attack on the engineer station 2
a27.AddAllParents(a15, a16, a17, ...
    0.00000000, ... F    F    F
    0.30000000, ... F    F    T
    0.30000000, ... F    T    F
    0.30000000, ... F    T    T
    0.30000000, ... T    F    F
    0.30000000, ... T    F    T
    0.30000000, ... T    T    F
    0.30000000);  % T    T    T

% a28: DoS attack on PLC6
% a15: buffer overflow attack on the data server 2
% a16: brute force attack on the data server 2
% a17: brute force attack on the engineer station 2
a28.AddAllParents(a15, a16, a17, ...
    0.00000000, ... F    F    F
    0.30000000, ... F    F    T
    0.30000000, ... F    T    F
    0.30000000, ... F    T    T
    0.30000000, ... T    F    F
    0.30000000, ... T    F    T
    0.30000000, ... T    T    F
    0.30000000);  % T    T    T

% a29: DoS attack on PLC7
% a15: buffer overflow attack on the data server 2
% a16: brute force attack on the data server 2
% a17: brute force attack on the engineer station 2
a29.AddAllParents(a15, a16, a17, ...
    0.00000000, ... F    F    F
    0.30000000, ... F    F    T
    0.30000000, ... F    T    F
    0.30000000, ... F    T    T
    0.30000000, ... T    F    F
    0.30000000, ... T    F    T
    0.30000000, ... T    T    F
    0.30000000);  % T    T    T

% a30: DoS attack on PLC8
% a15: buffer overflow attack on the data server 2
% a16: brute force attack on the data server 2
% a17: brute force attack on the engineer station 2
a30.AddAllParents(a15, a16, a17, ...
    0.00000000, ... F    F    F
    0.30000000, ... F    F    T
    0.30000000, ... F    T    F
    0.30000000, ... F    T    T
    0.30000000, ... T    F    F
    0.30000000, ... T    F    T
    0.30000000, ... T    T    F
    0.30000000);  % T    T    T

% a31: DoS attack on PLC9
% a20: buffer overflow attack on the data server 3
% a21: brute force attack on the data server 3
% a22: brute force attack on the engineer station 3
a31.AddAllParents(a20, a21, a22, ...
    0.00000000, ... F    F    F
    0.30000000, ... F    F    T
    0.30000000, ... F    T    F
    0.30000000, ... F    T    T
    0.30000000, ... T    F    F
    0.30000000, ... T    F    T
    0.30000000, ... T    T    F
    0.30000000);  % T    T    T

% a32: DoS attack on PLC10
% a20: buffer overflow attack on the data server 3
% a21: brute force attack on the data server 3
% a22: brute force attack on the engineer station 3
a32.AddAllParents(a20, a21, a22, ...
    0.00000000, ... F    F    F
    0.30000000, ... F    F    T
    0.30000000, ... F    T    F
    0.30000000, ... F    T    T
    0.30000000, ... T    F    F
    0.30000000, ... T    F    T
    0.30000000, ... T    T    F
    0.30000000);  % T    T    T

% a33: DoS attack on PLC11
% a20: buffer overflow attack on the data server 3
% a21: brute force attack on the data server 3
% a22: brute force attack on the engineer station 3
a33.AddAllParents(a20, a21, a22, ...
    0.00000000, ... F    F    F
    0.30000000, ... F    F    T
    0.30000000, ... F    T    F
    0.30000000, ... F    T    T
    0.30000000, ... T    F    F
    0.30000000, ... T    F    T
    0.30000000, ... T    T    F
    0.30000000);  % T    T    T

% a34: DoS attack on PLC12
% a20: buffer overflow attack on the data server 3
% a21: brute force attack on the data server 3
% a22: brute force attack on the engineer station 3
a34.AddAllParents(a20, a21, a22, ...
    0.00000000, ... F    F    F
    0.30000000, ... F    F    T
    0.30000000, ... F    T    F
    0.30000000, ... F    T    T
    0.30000000, ... T    F    F
    0.30000000, ... T    F    T
    0.30000000, ... T    T    F
    0.30000000);  % T    T    T

% a35: man-in-the-middle attack on PLC1
% a12: brute force attack on the engineer station 1
a35.AddAllParents(a12, ...
    0.00000000, ... T
    0.30000000);  % F

% a36: man-in-the-middle attack on PLC2
% a12: brute force attack on the engineer station 1
a36.AddAllParents(a12, ...
    0.00000000, ... T
    0.30000000);  % F

% a37: man-in-the-middle attack on PLC3
% a12: brute force attack on the engineer station 1
a37.AddAllParents(a12, ...
    0.00000000, ... T
    0.30000000);  % F

% a38: man-in-the-middle attack on PLC4
% a12: brute force attack on the engineer station 1
a38.AddAllParents(a12, ...
    0.00000000, ... T
    0.30000000);  % F

% a39: man-in-the-middle attack on PLC5
% a17: brute force attack on the engineer station 2
a39.AddAllParents(a17, ...
    0.00000000, ... T
    0.30000000);  % F

% a40: man-in-the-middle attack on PLC6
% a17: brute force attack on the engineer station 2
a40.AddAllParents(a17, ...
    0.00000000, ... T
    0.30000000);  % F

% a41: man-in-the-middle attack on PLC7
% a17: brute force attack on the engineer station 2
a41.AddAllParents(a17, ...
    0.00000000, ... T
    0.30000000);  % F

% a42: man-in-the-middle attack on PLC8
% a17: brute force attack on the engineer station 2
a42.AddAllParents(a17, ...
    0.00000000, ... T
    0.30000000);  % F

% a43: man-in-the-middle attack on PLC9
% a22: brute force attack on the engineer station 3
a43.AddAllParents(a22, ...
    0.00000000, ... T
    0.30000000);  % F

% a44: man-in-the-middle attack on PLC10
% a22: brute force attack on the engineer station 3
a44.AddAllParents(a22, ...
    0.00000000, ... T
    0.30000000);  % F

% a45: man-in-the-middle attack on PLC11
% a22: brute force attack on the engineer station 3
a45.AddAllParents(a22, ...
    0.00000000, ... T
    0.30000000);  % F

% a46: man-in-the-middle attack on PLC12
% a22: brute force attack on the engineer station 3
a46.AddAllParents(a22, ...
    0.00000000, ... T
    0.30000000);  % F

% Set function nodes.
% f01: distillation
% f02: the temperature control function of distillation column
% f03: the pressure control function of distillation column
f01.AddAllParents(f02, f03, ...
    0.00000000, ... F    F
    1.00000000, ... F    T
    1.00000000, ... T    F
    1.00000000);  % T    T)

% f02: the temperature control function of distillation column
% f04: the traffic control function of V1
% f06: the traffic control function of V3
% f07: the switch control function of S1
% f08: the temperature sensation function of distillation column
f02.AddAllParents(f04, f06, f07, f08, ...
    0.00000001, ... F    F    F    F
    0.10000000, ... F    F    F    T
    0.10000000, ... F    F    T    F
    0.20000000, ... F    F    T    T
    0.10000000, ... F    T    F    F
    0.20000000, ... F    T    F    T
    0.20000000, ... F    T    T    F
    0.40000000, ... F    T    T    T
    0.10000000, ... T    F    F    F
    0.20000000, ... T    F    F    T
    0.20000000, ... T    F    T    F
    0.40000000, ... T    F    T    T
    0.20000000, ... T    T    F    F
    0.40000000, ... T    T    F    T
    0.40000000, ... T    T    T    F
    0.80000000);  % T    T    T    T

% f03: the pressure control function of distillation column
% f05: the traffic control function of V2
% f07: the switch control function of S1
% f09: the pressure sensation function of distillation column
f03.AddAllParents(f05, f07, f09, ...
    0.00000001, ... F    F    F
    0.10000000, ... F    F    T
    0.10000000, ... F    T    F
    0.30000000, ... F    T    T
    0.10000000, ... T    F    F
    0.30000000, ... T    F    T
    0.30000000, ... T    T    F
    0.80000000);  % T    T    T

% f04: the traffic control function of V1
% a23: DoS attack on PLC1
% a35: man-in-the-middle attack on PLC1
f04.AddAllParents(a23, a35, ...
    0.00000001, ... F    F
    0.30000000, ... F    T
    0.30000000, ... T    F
    0.60000000);  % T    T

% f05: the traffic control function of V2
% a26: DoS attack on PLC4
% a38: man-in-the-middle attack on PLC4
f05.AddAllParents(a26, a38, ...
    0.00000001, ... F    F
    0.30000000, ... F    T
    0.30000000, ... T    F
    0.60000000);  % T    T

% f06: the traffic control function of V3
% a26: DoS attack on PLC4
% a38: man-in-the-middle attack on PLC4
f06.AddAllParents(a26, a38, ...
    0.00000001, ... F    F
    0.30000000, ... F    T
    0.30000000, ... T    F
    0.60000000);  % T    T

% f07: the switch control function of S1
% a24: DoS attack on PLC2
% a36: man-in-the-middle attack on PLC2
f07.AddAllParents(a24, a36, ...
    0.00000001, ... F    F
    0.30000000, ... F    T
    0.30000000, ... T    F
    0.60000000);  % T    T

% f08: the temperature sensation function of distillation column
% a25: DoS attack on PLC3
% a37: man-in-the-middle attack on PLC3
f08.AddAllParents(a25, a37, ...
    0.00000001, ... F    F
    0.30000000, ... F    T
    0.30000000, ... T    F
    0.60000000);  % T    T

% f09: the pressure sensation function of distillation column 
% a25: DoS attack on PLC3
% a37: man-in-the-middle attack on PLC3
f09.AddAllParents(a25, a37, ...
    0.00000001, ... F    F
    0.30000000, ... F    T
    0.30000000, ... T    F
    0.60000000);  % T    T

% f10: heating
% f11: the temperature control function of reactor 1
% f12: the pressure control function of reactor 1
% f13: the level control function of reactor 1
f10.AddAllParents(f11, f12, f13, ...
    0.00000000, ... F    F    F
    1.00000000, ... F    F    T
    1.00000000, ... F    T    F
    1.00000000, ... F    T    T
    1.00000000, ... T    F    F
    1.00000000, ... T    F    T
    1.00000000, ... T    T    F
    1.00000000);  % T    T    T

% f11: the temperature control function of reactor 1
% f14: the traffic control function of V4
% f15: the traffic control function of V5
% f16: the traffic control function of V7
% f18: the switch control function of S2
% f19: the temperature sensation function of reactor 1
f11.AddAllParents(f14, f15, f16, f18, f19, ...
    0.00000001, ... F    F    F    F    F
    0.10000000, ... F    F    F    F    T
    0.10000000, ... F    F    F    T    F
    0.20000000, ... F    F    F    T    T
    0.10000000, ... F    F    T    F    F
    0.20000000, ... F    F    T    F    T
    0.20000000, ... F    F    T    T    F
    0.30000000, ... F    F    T    T    T
    0.10000000, ... F    T    F    F    F
    0.20000000, ... F    T    F    F    T
    0.20000000, ... F    T    F    T    F
    0.30000000, ... F    T    F    T    T
    0.20000000, ... F    T    T    F    F
    0.40000000, ... F    T    T    F    T
    0.30000000, ... F    T    T    T    F
    0.60000000, ... F    T    T    T    T
    0.10000000, ... T    F    F    F    F
    0.20000000, ... T    F    F    F    T
    0.30000000, ... T    F    F    T    F
    0.30000000, ... T    F    F    T    T
    0.20000000, ... T    F    T    F    F
    0.30000000, ... T    F    T    F    T
    0.30000000, ... T    F    T    T    F
    0.50000000, ... T    F    T    T    T
    0.30000000, ... T    T    F    F    F
    0.30000000, ... T    T    F    F    T
    0.30000000, ... T    T    F    T    F
    0.60000000, ... T    T    F    T    T
    0.40000000, ... T    T    T    F    F
    0.50000000, ... T    T    T    F    T
    0.70000000, ... T    T    T    T    F
    0.90000000);  % T    T    T    T    T
    
% f12: the pressure control function of reactor 1
% f17: the pressure reducing function of reactor 1
% f18: the switch control function of S2
% f20: the pressure sensation function of reactor 1
f12.AddAllParents(f17, f18, f20, ...
    0.00000001, ... F    F    F
    0.10000000, ... F    F    T
    0.10000000, ... F    T    F
    0.30000000, ... F    T    T
    0.10000000, ... T    F    F
    0.30000000, ... T    F    T
    0.30000000, ... T    T    F
    0.80000000);  % T    T    T
    
% f13: the level control function of reactor 1
% f14: the traffic control function of V4
% f15: the traffic control function of V5
% f16: the traffic control function of V7
% f21: the level sensation function of reactor 1
f13.AddAllParents(f14, f15, f16, f21, ...
    0.00000001, ... F    F    F    F
    0.10000000, ... F    F    F    T
    0.10000000, ... F    F    T    F
    0.20000000, ... F    F    T    T
    0.10000000, ... F    T    F    F
    0.20000000, ... F    T    F    T
    0.20000000, ... F    T    T    F
    0.40000000, ... F    T    T    T
    0.10000000, ... T    F    F    F
    0.20000000, ... T    F    F    T
    0.20000000, ... T    F    T    F
    0.40000000, ... T    F    T    T
    0.20000000, ... T    T    F    F
    0.40000000, ... T    T    F    T
    0.40000000, ... T    T    T    F
    0.80000000);  % T    T    T    T

% f14: the traffic control function of V4
% a27: DoS attack on PLC5
% a39: man-in-the-middle attack on PLC5
f14.AddAllParents(a27, a39, ...
    0.00000001, ... F    F
    0.30000000, ... F    T
    0.30000000, ... T    F
    0.60000000);  % T    T

% f15: the traffic control function of V5
% a27: DoS attack on PLC5
% a39: man-in-the-middle attack on PLC5
f15.AddAllParents(a27, a39, ...
    0.00000001, ... F    F
    0.30000000, ... F    T
    0.30000000, ... T    F
    0.60000000);  % T    T

% f16: the traffic control function of V7
% a30: DoS attack on PLC8
% a42: man-in-the-middle attack on PLC8
f16.AddAllParents(a30, a42, ...
    0.00000001, ... F    F
    0.30000000, ... F    T
    0.30000000, ... T    F
    0.60000000);  % T    T

% f17: the pressure reducing function of reactor 1
% a30: DoS attack on PLC8
% a42: man-in-the-middle attack on PLC8
f17.AddAllParents(a30, a42, ...
    0.00000001, ... F    F
    0.30000000, ... F    T
    0.30000000, ... T    F
    0.60000000);  % T    T

% f18: the switch control function of S2
% a28: DoS attack on PLC6
% a40: man-in-the-middle attack on PLC6
f18.AddAllParents(a28, a40, ...
    0.00000001, ... F    F
    0.30000000, ... F    T
    0.30000000, ... T    F
    0.60000000);  % T    T

% f19: the temperature sensation function of reactor 1
% a29: DoS attack on PLC7
% a41: man-in-the-middle attack on PLC7
f19.AddAllParents(a29, a41, ...
    0.00000001, ... F    F
    0.30000000, ... F    T
    0.30000000, ... T    F
    0.60000000);  % T    T

% f20: the pressure sensation function of reactor 1
% a29: DoS attack on PLC7
% a41: man-in-the-middle attack on PLC7
f20.AddAllParents(a29, a41, ...
    0.00000001, ... F    F
    0.30000000, ... F    T
    0.30000000, ... T    F
    0.60000000);  % T    T

% f21: the level sensation function of reactor 1
% a29: DoS attack on PLC7
% a41: man-in-the-middle attack on PLC7
f21.AddAllParents(a29, a41, ...
    0.00000001, ... F    F
    0.30000000, ... F    T
    0.30000000, ... T    F
    0.60000000);  % T    T

% f22: mixing & heating
% f23: the mixing function of reactor 2
% f24: the temperature control function of reactor 2
% f25: the pressure control function of reactor 2
% f26: the level control function of reactor 2
f22.AddAllParents(f23, f24, f25, f26, ...
    0.00000000, ... F    F    F    F
    1.00000000, ... F    F    F    T
    1.00000000, ... F    F    T    F
    1.00000000, ... F    F    T    T
    1.00000000, ... F    T    F    F
    1.00000000, ... F    T    F    T
    1.00000000, ... F    T    T    F
    1.00000000, ... F    T    T    T
    1.00000000, ... T    F    F    F
    1.00000000, ... T    F    F    T
    1.00000000, ... T    F    T    F
    1.00000000, ... T    F    T    T
    1.00000000, ... T    T    F    F
    1.00000000, ... T    T    F    T
    1.00000000, ... T    T    T    F
    1.00000000);  % T    T    T    T

% f23: the temperature control function of reactor 2
% f27: the temperature sensation function of reactor 2
% f30: the traffic control function of V6
% f31: the traffic control function of V10
% f33: the switch control function of S3
f23.AddAllParents(f27, f30, f31, f33, ...
    0.00000001, ... F    F    F    F
    0.10000000, ... F    F    F    T
    0.10000000, ... F    F    T    F
    0.20000000, ... F    F    T    T
    0.10000000, ... F    T    F    F
    0.20000000, ... F    T    F    T
    0.20000000, ... F    T    T    F
    0.40000000, ... F    T    T    T
    0.10000000, ... T    F    F    F
    0.20000000, ... T    F    F    T
    0.20000000, ... T    F    T    F
    0.40000000, ... T    F    T    T
    0.20000000, ... T    T    F    F
    0.40000000, ... T    T    F    T
    0.40000000, ... T    T    T    F
    0.80000000);  % T    T    T    T

% f24: the pressure control function of reactor 2
% f28: the pressure sensation function of reactor 2
% f32: the pressure reducing function of reactor 2
% f33: the switch control function of S3
f24.AddAllParents(f28, f32, f33, ...
    0.00000001, ... F    F    F
    0.10000000, ... F    F    T
    0.10000000, ... F    T    F
    0.30000000, ... F    T    T
    0.10000000, ... T    F    F
    0.30000000, ... T    F    T
    0.30000000, ... T    T    F
    0.80000000);  % T    T    T
    
% f25: the mixing function of reactor 2
% a32: DoS attack on PLC10
% a44: man-in-the-middle attack on PLC10
f25.AddAllParents(a32, a44, ...
    0.00000001, ... F    F
    0.30000000, ... F    T
    0.30000000, ... T    F
    0.60000000);  % T    T

% f26: the level control function of reactor 2
% f29: the level sensation function of reactor 2
% f30: the traffic control function of V6
% f31: the traffic control function of V10
f26.AddAllParents(f29, f30, f31, ...
    0.00000001, ... F    F    F
    0.10000000, ... F    F    T
    0.10000000, ... F    T    F
    0.30000000, ... F    T    T
    0.10000000, ... T    F    F
    0.30000000, ... T    F    T
    0.30000000, ... T    T    F
    0.80000000);  % T    T    T

% f27: the temperature sensation function of reactor 2
% a33: DoS attack on PLC11
% a45: man-in-the-middle attack on PLC11
f27.AddAllParents(a33, a45, ...
    0.00000001, ... F    F
    0.30000000, ... F    T
    0.30000000, ... T    F
    0.60000000);  % T    T
    
% f28: the pressure sensation function of reactor 2
% a34: DoS attack on PLC12
% a46: man-in-the-middle attack on PLC12
f28.AddAllParents(a34, a46, ...
    0.00000001, ... F    F
    0.30000000, ... F    T
    0.30000000, ... T    F
    0.60000000);  % T    T

% f29: the level sensation function of reactor 2
% a33: DoS attack on PLC11
% a45: man-in-the-middle attack on PLC11
f29.AddAllParents(a33, a45, ...
    0.00000001, ... F    F
    0.30000000, ... F    T
    0.30000000, ... T    F
    0.60000000);  % T    T

% f30: the traffic control function of V6
% a31: DoS attack on PLC9
% a43: man-in-the-middle attack on PLC9
f30.AddAllParents(a31, a43, ...
    0.00000001, ... F    F
    0.30000000, ... F    T
    0.30000000, ... T    F
    0.60000000);  % T    T

% f31: the traffic control function of V10
% a34: DoS attack on PLC12
% a46: man-in-the-middle attack on PLC12
f31.AddAllParents(a34, a46, ...
    0.00000001, ... F    F
    0.30000000, ... F    T
    0.30000000, ... T    F
    0.60000000);  % T    T

% f32: the pressure reducing function of reactor 2
% a34: DoS attack on PLC12
% a46: man-in-the-middle attack on PLC12
f32.AddAllParents(a34, a46, ...
    0.00000001, ... F    F
    0.30000000, ... F    T
    0.30000000, ... T    F
    0.60000000);  % T    T

% f33: the switch control function of S3
% a32: DoS attack on PLC10
% a44: man-in-the-middle attack on PLC10
f33.AddAllParents(a32, a44, ...
    0.00000001, ... F    F
    0.30000000, ... F    T
    0.30000000, ... T    F
    0.60000000);  % T    T
    
% f34: production scheduling
% f35: the production scheduling function provided by personal computer 1
% f36: the production scheduling function provided by personal computer 2
% f37: the production scheduling function provided by personal computer 3
% f41: the configuration of PLCs of distillation column
% f42: the configuration of PLCs of reactor 1
% f43: the configuration of PLCs of reactor 2    
f34.AddAllParents(f35, f36, f37, f41, f42, f43, ...
    0.00000000, ... F    F    F    F    F    F
    1.00000000, ... F    F    F    F    F    T
    1.00000000, ... F    F    F    F    T    F
    1.00000000, ... F    F    F    F    T    T
    1.00000000, ... F    F    F    T    F    F
    1.00000000, ... F    F    F    T    F    T
    1.00000000, ... F    F    F    T    T    F
    1.00000000, ... F    F    F    T    T    T
    1.00000000, ... F    F    T    F    F    F
    1.00000000, ... F    F    T    F    F    T
    1.00000000, ... F    F    T    F    T    F
    1.00000000, ... F    F    T    F    T    T
    1.00000000, ... F    F    T    T    F    F
    1.00000000, ... F    F    T    T    F    T
    1.00000000, ... F    F    T    T    T    F
    1.00000000, ... F    F    T    T    T    T
    1.00000000, ... F    T    F    F    F    F
    1.00000000, ... F    T    F    F    F    T
    1.00000000, ... F    T    F    F    T    F
    1.00000000, ... F    T    F    F    T    T
    1.00000000, ... F    T    F    T    F    F
    1.00000000, ... F    T    F    T    F    T
    1.00000000, ... F    T    F    T    T    F
    1.00000000, ... F    T    F    T    T    T
    1.00000000, ... F    T    T    F    F    F
    1.00000000, ... F    T    T    F    F    T
    1.00000000, ... F    T    T    F    T    F
    1.00000000, ... F    T    T    F    T    T
    1.00000000, ... F    T    T    T    F    F
    1.00000000, ... F    T    T    T    F    T
    1.00000000, ... F    T    T    T    T    F
    1.00000000, ... F    T    T    T    T    T
    1.00000000, ... T    F    F    F    F    F
    1.00000000, ... T    F    F    F    F    T
    1.00000000, ... T    F    F    F    T    F
    1.00000000, ... T    F    F    F    T    T
    1.00000000, ... T    F    F    T    F    F
    1.00000000, ... T    F    F    T    F    T
    1.00000000, ... T    F    F    T    T    F
    1.00000000, ... T    F    F    T    T    T
    1.00000000, ... T    F    T    F    F    F
    1.00000000, ... T    F    T    F    F    T
    1.00000000, ... T    F    T    F    T    F
    1.00000000, ... T    F    T    F    T    T
    1.00000000, ... T    F    T    T    F    F
    1.00000000, ... T    F    T    T    F    T
    1.00000000, ... T    F    T    T    T    F
    1.00000000, ... T    F    T    T    T    T
    1.00000000, ... T    T    F    F    F    F
    1.00000000, ... T    T    F    F    F    T
    1.00000000, ... T    T    F    F    T    F
    1.00000000, ... T    T    F    F    T    T
    1.00000000, ... T    T    F    T    F    F
    1.00000000, ... T    T    F    T    F    T
    1.00000000, ... T    T    F    T    T    F
    1.00000000, ... T    T    F    T    T    T
    1.00000000, ... T    T    T    F    F    F
    1.00000000, ... T    T    T    F    F    T
    1.00000000, ... T    T    T    F    T    F
    1.00000000, ... T    T    T    F    T    T
    1.00000000, ... T    T    T    T    F    F
    1.00000000, ... T    T    T    T    F    T
    1.00000000, ... T    T    T    T    T    F
    1.00000000);  % T    T    T    T    T    T 

% f35: the production scheduling function provided by personal computer 1
% f38: the data service of industrial Ethernet 1
% f39: the data service of industrial Ethernet 2
% f40: the data service of industrial Ethernet 3
f35.AddAllParents(f38, f39, f40, ...
    0.00000000, ... F    F    F
    1.00000000, ... F    F    T
    1.00000000, ... F    T    F
    1.00000000, ... F    T    T
    1.00000000, ... T    F    F
    1.00000000, ... T    F    T
    1.00000000, ... T    T    F
    1.00000000);  % T    T    T

% f36: the production scheduling function provided by personal computer 2
% f38: the data service of industrial Ethernet 1
% f39: the data service of industrial Ethernet 2
% f40: the data service of industrial Ethernet 3
f36.AddAllParents(f38, f39, f40, ...
    0.00000000, ... F    F    F
    1.00000000, ... F    F    T
    1.00000000, ... F    T    F
    1.00000000, ... F    T    T
    1.00000000, ... T    F    F
    1.00000000, ... T    F    T
    1.00000000, ... T    T    F
    1.00000000);  % T    T    T
    
% f37: the production scheduling function provided by personal computer 3
% f38: the data service of industrial Ethernet 1
% f39: the data service of industrial Ethernet 2
% f40: the data service of industrial Ethernet 3
f37.AddAllParents(f38, f39, f40, ...
    0.00000000, ... F    F    F
    1.00000000, ... F    F    T
    1.00000000, ... F    T    F
    1.00000000, ... F    T    T
    1.00000000, ... T    F    F
    1.00000000, ... T    F    T
    1.00000000, ... T    T    F
    1.00000000);  % T    T    T

% f38: the data service of industrial Ethernet 1
f38.AddAllParents(... Has no parent node
    0.00000000);

% f39: the data service of industrial Ethernet 2
f39.AddAllParents(... Has no parent node
    0.00000000);

% f40: the data service of industrial Ethernet 3
f40.AddAllParents(... Has no parent node
    0.00000000);
    
% f41: the configuration of PLCs of distillation column
f41.AddAllParents(... Has no parent node
    0.00000000);
    
% f42: the configuration of PLCs of reactor 1
f42.AddAllParents(... Has no parent node
    0.00000000);
    
% f43: the configuration of PLCs of reactor 2
f43.AddAllParents(... Has no parent node
    0.00000000); 

% Set incident nodes.
% e01: pressure anomaly @ distillation column
% f03: the pressure control function of distillation column
e01.AddAllParents(f03, ...
    0.00000001, ... T
    0.40000000);  % F

% e02: temperature anomaly @ distillation column
% f02: the temperature control function of distillation column
e02.AddAllParents(f02, ...
    0.00000001, ... T
    0.40000000);  % F
    
% e03: traffic of anomaly @ distillation column
% f04: the traffic control function of V1
% f06: the traffic control function of V3
e03.AddAllParents(f04, f06, ...
    0.00000001, ... F    F
    0.30000000, ... F    T
    0.30000000, ... T    F
    0.50000000);  % T    T)

% e04: excessive pressure @ reactor 1
% f12: the pressure control function of reactor 1
e04.AddAllParents(f12, ...
    0.00000001, ... T
    0.40000000);  % F

% e05: low pressure @ reactor 1
% f12: the pressure control function of reactor 1
e05.AddAllParents(f12, ...
    0.00000001, ... T
    0.40000000);  % F
    
% e06: temperature anomaly @ reactor 1
% f11: the temperature control function of reactor 1
e06.AddAllParents(f11, ...
    0.00000001, ... T
    0.40000000);  % F

% e07: excessive liquid level @ reactor 1
% f13: the level control function of reactor 1
e07.AddAllParents(f13, ...
    0.00000001, ... T
    0.40000000);  % F
    
% e08: low liquid level @ reactor 1
% f13: the level control function of reactor 1
e08.AddAllParents(f13, ...
    0.00000001, ... T
    0.40000000);  % F

% e09: explosion @ reactor 1
% e04: excessive pressure @ reactor 1
e09.AddAllParents(e04, ...
    0.00000001, ... T
    0.40000000);  % F

% e10: heater dry fired @ reactor 1
% e08: low liquid level @ reactor 1
e10.AddAllParents(e08, ...
    0.00000001, ... T
    0.40000000);  % F

% e11: liquid overflow @ reactor 1
% e07: excessive liquid level @ reactor 1
e11.AddAllParents(e07, ...
    0.00000001, ... T
    0.40000000);  % F

% e12: excessive pressure @ reactor 2
% f24: the pressure control function of reactor 2
e12.AddAllParents(f24, ...
    0.00000001, ... T
    0.40000000);  % F

% e13: low pressure @ reactor 2
% f24: the pressure control function of reactor 2
e13.AddAllParents(f24, ...
    0.00000001, ... T
    0.40000000);  % F

% e14: temperature anomaly @ reactor 2
% f23: the temperature control function of reactor 2
e14.AddAllParents(f23, ...
    0.00000001, ... T
    0.40000000);  % F
    
% e15: excessive liquid level @ reactor 2
% f26: the level control function of reactor 2
e15.AddAllParents(f26, ...
    0.00000001, ... T
    0.40000000);  % F

% e16: low liquid level @ reactor 2
% f26: the level control function of reactor 2
e16.AddAllParents(f26, ...
    0.00000001, ... T
    0.40000000);  % F

% e17: explosion @ reactor 2
% e12: excessive pressure @ reactor 2
e17.AddAllParents(e12, ...
    0.00000001, ... T
    0.40000000);  % F

% e18: heater dry fired @ reactor 2
% e16: low liquid level @ reactor 2
e18.AddAllParents(e16, ...
    0.00000001, ... T
    0.40000000);  % F

% e19: liquid overflow @ reactor 2
% e15: excessive liquid level @ reactor 2
e19.AddAllParents(e15, ...
    0.00000001, ... T
    0.40000000);  % F

% e20: blender stop @ reactor 2
% f25: the mixing function of reactor 2
e20.AddAllParents(f25, ...
    0.00000001, ... T
    0.40000000);  % F

% e21: out of control @ distillation column
% f41: the configuration of PLCs of distillation column
e21.AddAllParents(f41, ...
    0.00000001, ... T
    0.40000000);  % F

% e22: out of control @ reactor 1
% f42: the configuration of PLCs of reactor 1
e22.AddAllParents(f42, ...
    0.00000001, ... T
    0.40000000);  % F
   
% e23: out of control @ reactor 2
% f43: the configuration of PLCs of reactor 2  
e23.AddAllParents(f43, ...
    0.00000001, ... T
    0.40000000);  % F

% e24: production scheduling error @ control layer
% f34: production scheduling
e24.AddAllParents(f34, ...
    0.00000001, ... T
    0.40000000);  % F 

% Set asset nodes.
% z01: semi-product s01 and s02
% e01: pressure anomaly @ distillation column
% e02: temperature anomaly @ distillation column
% e03: traffic of anomaly @ distillation column
% e21: out of control @ distillation column
% e24: production scheduling error @ control layer
z01.AddAllParents(e01, e02, e03, e21, e24, ...
    0.00000001, ... F    F    F    F    F
    0.10000000, ... F    F    F    F    T
    0.10000000, ... F    F    F    T    F
    0.20000000, ... F    F    F    T    T
    0.10000000, ... F    F    T    F    F
    0.20000000, ... F    F    T    F    T
    0.20000000, ... F    F    T    T    F
    0.30000000, ... F    F    T    T    T
    0.10000000, ... F    T    F    F    F
    0.20000000, ... F    T    F    F    T
    0.20000000, ... F    T    F    T    F
    0.30000000, ... F    T    F    T    T
    0.20000000, ... F    T    T    F    F
    0.40000000, ... F    T    T    F    T
    0.30000000, ... F    T    T    T    F
    0.60000000, ... F    T    T    T    T
    0.10000000, ... T    F    F    F    F
    0.20000000, ... T    F    F    F    T
    0.30000000, ... T    F    F    T    F
    0.30000000, ... T    F    F    T    T
    0.20000000, ... T    F    T    F    F
    0.30000000, ... T    F    T    F    T
    0.30000000, ... T    F    T    T    F
    0.50000000, ... T    F    T    T    T
    0.30000000, ... T    T    F    F    F
    0.30000000, ... T    T    F    F    T
    0.30000000, ... T    T    F    T    F
    0.60000000, ... T    T    F    T    T
    0.40000000, ... T    T    T    F    F
    0.50000000, ... T    T    T    F    T
    0.70000000, ... T    T    T    T    F
    0.90000000);  % T    T    T    T    T

% z02: product s03
% e05: low pressure @ reactor 1
% e06: temperature anomaly @ reactor 1
% e09: explosion @ reactor 1
% e11: liquid overflow @ reactor 1
% e22: out of control @ reactor 1
% e24: production scheduling error @ control layer
z02.AddAllParents(e05, e06, e09, e11, e22, e24, ...
    0.00000001, ... F    F    F    F    F    F
    0.10000000, ... F    F    F    F    F    T
    0.10000000, ... F    F    F    F    T    F
    0.20000000, ... F    F    F    F    T    T
    0.10000000, ... F    F    F    T    F    F
    0.20000000, ... F    F    F    T    F    T
    0.20000000, ... F    F    F    T    T    F
    0.30000000, ... F    F    F    T    T    T
    0.10000000, ... F    F    T    F    F    F
    0.20000000, ... F    F    T    F    F    T
    0.20000000, ... F    F    T    F    T    F
    0.30000000, ... F    F    T    F    T    T
    0.20000000, ... F    F    T    T    F    F
    0.30000000, ... F    F    T    T    F    T
    0.30000000, ... F    F    T    T    T    F
    0.50000000, ... F    F    T    T    T    T
    0.10000000, ... F    T    F    F    F    F
    0.20000000, ... F    T    F    F    F    T
    0.20000000, ... F    T    F    F    T    F
    0.20000000, ... F    T    F    F    T    T
    0.20000000, ... F    T    F    T    F    F
    0.30000000, ... F    T    F    T    F    T
    0.30000000, ... F    T    F    T    T    F
    0.40000000, ... F    T    F    T    T    T
    0.30000000, ... F    T    T    F    F    F
    0.30000000, ... F    T    T    F    F    T
    0.30000000, ... F    T    T    F    T    F
    0.50000000, ... F    T    T    F    T    T
    0.40000000, ... F    T    T    T    F    F
    0.50000000, ... F    T    T    T    F    T
    0.50000000, ... F    T    T    T    T    F
    0.60000000, ... F    T    T    T    T    T
    0.10000000, ... T    F    F    F    F    F
    0.20000000, ... T    F    F    F    F    T
    0.20000000, ... T    F    F    F    T    F
    0.30000000, ... T    F    F    F    T    T
    0.20000000, ... T    F    F    T    F    F
    0.30000000, ... T    F    F    T    F    T
    0.30000000, ... T    F    F    T    T    F
    0.40000000, ... T    F    F    T    T    T
    0.20000000, ... T    F    T    F    F    F
    0.30000000, ... T    F    T    F    F    T
    0.30000000, ... T    F    T    F    T    F
    0.40000000, ... T    F    T    F    T    T
    0.30000000, ... T    F    T    T    F    F
    0.50000000, ... T    F    T    T    F    T
    0.40000000, ... T    F    T    T    T    F
    0.50000000, ... T    F    T    T    T    T
    0.20000000, ... T    T    F    F    F    F
    0.30000000, ... T    T    F    F    F    T
    0.30000000, ... T    T    F    F    T    F
    0.30000000, ... T    T    F    F    T    T
    0.30000000, ... T    T    F    T    F    F
    0.40000000, ... T    T    F    T    F    T
    0.40000000, ... T    T    F    T    T    F
    0.50000000, ... T    T    F    T    T    T
    0.40000000, ... T    T    T    F    F    F
    0.40000000, ... T    T    T    F    F    T
    0.40000000, ... T    T    T    F    T    F
    0.60000000, ... T    T    T    F    T    T
    0.50000000, ... T    T    T    T    F    F
    0.60000000, ... T    T    T    T    F    T
    0.70000000, ... T    T    T    T    T    F
    0.90000000);  % T    T    T    T    T    T 

% z03: product s04
% e13: low pressure @ reactor 2
% e14: temperature anomaly @ reactor 2
% e17: explosion @ reactor 2
% e20: blender stop @ reactor 2
% e23: out of control @ reactor 2
% e24: production scheduling error @ control layer
z03.AddAllParents(e13, e14, e17, e20, e23, e24, ...
    0.00000001, ... F    F    F    F    F    F
    0.10000000, ... F    F    F    F    F    T
    0.10000000, ... F    F    F    F    T    F
    0.20000000, ... F    F    F    F    T    T
    0.10000000, ... F    F    F    T    F    F
    0.20000000, ... F    F    F    T    F    T
    0.20000000, ... F    F    F    T    T    F
    0.30000000, ... F    F    F    T    T    T
    0.10000000, ... F    F    T    F    F    F
    0.20000000, ... F    F    T    F    F    T
    0.20000000, ... F    F    T    F    T    F
    0.30000000, ... F    F    T    F    T    T
    0.20000000, ... F    F    T    T    F    F
    0.30000000, ... F    F    T    T    F    T
    0.30000000, ... F    F    T    T    T    F
    0.50000000, ... F    F    T    T    T    T
    0.10000000, ... F    T    F    F    F    F
    0.20000000, ... F    T    F    F    F    T
    0.20000000, ... F    T    F    F    T    F
    0.20000000, ... F    T    F    F    T    T
    0.20000000, ... F    T    F    T    F    F
    0.30000000, ... F    T    F    T    F    T
    0.30000000, ... F    T    F    T    T    F
    0.40000000, ... F    T    F    T    T    T
    0.30000000, ... F    T    T    F    F    F
    0.30000000, ... F    T    T    F    F    T
    0.30000000, ... F    T    T    F    T    F
    0.50000000, ... F    T    T    F    T    T
    0.40000000, ... F    T    T    T    F    F
    0.50000000, ... F    T    T    T    F    T
    0.50000000, ... F    T    T    T    T    F
    0.60000000, ... F    T    T    T    T    T 
    0.10000000, ... T    F    F    F    F    F 
    0.20000000, ... T    F    F    F    F    T 
    0.20000000, ... T    F    F    F    T    F 
    0.30000000, ... T    F    F    F    T    T 
    0.20000000, ... T    F    F    T    F    F 
    0.30000000, ... T    F    F    T    F    T 
    0.30000000, ... T    F    F    T    T    F 
    0.40000000, ... T    F    F    T    T    T 
    0.20000000, ... T    F    T    F    F    F 
    0.30000000, ... T    F    T    F    F    T 
    0.30000000, ... T    F    T    F    T    F 
    0.40000000, ... T    F    T    F    T    T 
    0.30000000, ... T    F    T    T    F    F 
    0.50000000, ... T    F    T    T    F    T 
    0.40000000, ... T    F    T    T    T    F 
    0.50000000, ... T    F    T    T    T    T 
    0.20000000, ... T    T    F    F    F    F 
    0.30000000, ... T    T    F    F    F    T 
    0.30000000, ... T    T    F    F    T    F 
    0.30000000, ... T    T    F    F    T    T 
    0.30000000, ... T    T    F    T    F    F 
    0.40000000, ... T    T    F    T    F    T 
    0.40000000, ... T    T    F    T    T    F 
    0.50000000, ... T    T    F    T    T    T 
    0.40000000, ... T    T    T    F    F    F 
    0.40000000, ... T    T    T    F    F    T 
    0.40000000, ... T    T    T    F    T    F 
    0.60000000, ... T    T    T    F    T    T 
    0.50000000, ... T    T    T    T    F    F 
    0.60000000, ... T    T    T    T    F    T 
    0.70000000, ... T    T    T    T    T    F 
    0.90000000);  % T    T    T    T    T    T 

% z04: tank and sensors of reactor 1
% e09: explosion @ reactor 1
z04.AddAllParents(e09, ...
    0.00000001, ... F
    0.80000000);  % T

% z05: heater of reactor 1
% e09: explosion @ reactor 1
% e10: heater dry fired @ reactor 1
z05.AddAllParents(e09, e10, ...
    0.00000001, ... F    F
    0.80000000, ... F    T
    0.80000000, ... T    F
    0.90000000);  % T    T

% z06: tank, sensors and blender of reactor 2
% e17: explosion @ reactor 2
z06.AddAllParents(e17, ...
    0.00000001, ... F
    0.80000000);  % T

% z07: heater of reactor 2
% e17: explosion @ reactor 2
% e18: heater dry fired @ reactor 2
z07.AddAllParents(e17, e18, ...
    0.00000001, ... F    F
    0.80000000, ... F    T
    0.80000000, ... T    F
    0.90000000);  % T    T

% z08: staff 1-4
% e09: explosion @ reactor 1
% e11: liquid overflow @ reactor 1
z08.AddAllParents(e09, e11, ...
    0.00000001, ... F    F
    0.80000000, ... F    T
    0.80000000, ... T    F
    0.90000000);  % T    T

% z09: staff 5-9
% e17: explosion @ reactor 2
% e19: liquid overflow @ reactor 2
z09.AddAllParents(e17, e19, ...
    0.00000001, ... F    F
    0.80000000, ... F    T
    0.80000000, ... T    F
    0.90000000);  % T    T
    
% z10: river and solid
% e09: explosion @ reactor 1
% e11: liquid overflow @ reactor 1
% e17: explosion @ reactor 2
% e19: liquid overflow @ reactor 2
z10.AddAllParents(e09, e11, e17, e19, ...
    0.00000001, ... F    F    F    F
    0.60000000, ... F    F    F    T
    0.60000000, ... F    F    T    F
    0.80000000, ... F    F    T    T
    0.60000000, ... F    T    F    F
    0.80000000, ... F    T    F    T
    0.80000000, ... F    T    T    F
    0.90000000, ... F    T    T    T
    0.60000000, ... T    F    F    F
    0.80000000, ... T    F    F    T
    0.80000000, ... T    F    T    F
    0.90000000, ... T    F    T    T
    0.80000000, ... T    T    F    F
    0.80000000, ... T    T    F    T
    0.90000000, ... T    T    T    F
    0.99000000);  % T    T    T    T
    
% z11: air  
% e09: explosion @ reactor 1
% e17: explosion @ reactor 2
z11.AddAllParents(e09, e17, ...
    0.00000001, ... F    F
    0.80000000, ... F    T
    0.80000000, ... T    F
    0.90000000);  % T    T 