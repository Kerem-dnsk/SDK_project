clear; clc;

%kanonik form için tanımlama(s^2 + 9 s + 1000)
a1 = 9;
a0 = 1000;

% Kontrol kanonik (reference)
A_c = [0 1; -a0 -a1];
B_c = [0; 1];
C_c = [1000 0];
D_c = 0;

%matrislerin transpozu alındı
A_o = A_c.';
B_o = C_c.';
C_o = B_c.';
D_o = D_c;

% Display
A_o; B_o; C_o; D_o;

% Doğrulama: TF elde et
sys_o = ss(A_o,B_o,C_o,D_o);
tf(sys_o)
