R = 9;
L = 1;
C= 0.001;

A = [0 1; -1/(L*C) -R/L];
B = [0; 1/L]; %sistemin giriş etkisi
C = [1/C 0];
D = 0;
sys = ss(A,B,C,D);
