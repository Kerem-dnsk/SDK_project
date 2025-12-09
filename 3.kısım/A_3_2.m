clear; close all; clc;
R = 9;
L = 1;
C = 1e-3;
num = 1;
den = [L*C, R*C, 1];
G = tf(num, den);

A = [0 1; -1/(L*C) -R/L];
B = [0; 1/L];
C = [1/C 0]; 
D = 0;
sys_ss = ss(A,B,C,D);

t = linspace(0,2,2000);
[y_tf, t_tf] = step(G, t);
[y_ss, t_ss] = step(sys_ss, t);

figure('Color','w'); 
plot(t_tf, y_tf, 'b-', 'LineWidth',1.6); hold on;
plot(t_ss, y_ss, 'm--', 'LineWidth',1.2);
xlabel('Time (s)'); ylabel('v_C(t) [V]');
title('Step yanıtı: Transfer fonksiyonu vs State-space (x=[v_C; i_L])');
grid on; legend('TF','S-S','Location','best');

err = y_tf - y_ss;
fprintf('--- (x=[vC; iL]) Error metrics ---\n');
fprintf('Max abs error = %g V\n', max(abs(err)));
fprintf('RMS error     = %g V\n', sqrt(mean(err.^2)));
%iki durumda da grafikler aynı oldu.
