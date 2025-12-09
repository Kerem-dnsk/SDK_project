%% Transfer fonksiyonu
num = 1000;
den = [1 9 1000];
G = tf(num, den);

%% PID ayarı (otomatik optimum)
[C, info] = pidtune(G, 'PID');

Kp = C.Kp;
Ki = C.Ki;
Kd = C.Kd;

%% Kapalı çevrim sistemleri
T0 = feedback(G, 1);      % PID yok
T1 = feedback(C*G, 1);    % PID ile

%% Step cevaplarını çiz
figure;
step(2*T0, 'r--'); hold on;
step(5*T1, 'b'); grid on;
legend('PID öncesi', 'PID sonrası');

%% Step bilgileri
info0 = stepinfo(T0);
info1 = stepinfo(T1);

%% Kalıcı durum hatası
ess0 = abs(1 - dcgain(T0));
ess1 = abs(1 - dcgain(T1));

%% Sonuç tablo
T = table( ...
    [info0.RiseTime; info1.RiseTime], ...
    [info0.PeakTime; info1.PeakTime], ...
    [info0.Overshoot; info1.Overshoot], ...
    [info0.SettlingTime; info1.SettlingTime], ...
    [ess0; ess1], ...
    'VariableNames', {'RiseTime','PeakTime','Overshoot','SettlingTime','SteadyStateError'}, ...
    'RowNames', {'PID Öncesi','PID Sonrası'});

%Bu kodla kp ki kd değerlerinin en optimum dedğerleri bulundu.

