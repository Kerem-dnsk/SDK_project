clear; clc;

a1 = 9;
a0 = 1000;

% PAY katsayısı 1000
b0 = 1000;
b1 = 0;

A_ccf = [0 1; -a0 -a1];
B_ccf = [0; 1];
C_ccf = [b0 b1];
D_ccf = 0;

sys_ccf = ss(A_ccf, B_ccf, C_ccf, D_ccf);
tf(sys_ccf)
