R = 9;
L = 1.0;
C = 0.001;   % mF -> F

num = 1;
den = [L*C  R*C  1];

num1 = num*(1000); 
den1 = den*(1000);
G = tf(num1 , den1);

wn = 1/sqrt(L*C);                     % doğal açısal frekans (rad/s)
zeta = R/(2*L*wn);                    % sönüm oranı
wd = wn*sqrt(1 - zeta^2);             % sönümlü doğal frekans
tp = pi / wd;                         %tepe zamanı
tr = (pi - acos(zeta)) / wd;          %yükselme süresi
Mp = exp(-zeta*pi / sqrt(1 - zeta^2));%aşım oranı
Mp_oran = Mp * 100; 
ts = 4 / (zeta * wn);                 %oturma süresi 4*𝜏
%adım yanıtı hesabı (x ve y eksenleri)%
tfinal = 1.2;                         % zaman penceresi(s) x ekseninin sınır değeri
dt = 0.0005;                          %artış miktarı
t = 0:dt:tfinal;
[y, t_out] = step(G, t);              %kalıp grafik çizdirme kodu

final_val = y(end);                   %son değer 

%Control System Toolbox yüklü olduğu için hesabı bu koldarla otomatik yapıyoruz
S = stepinfo(y, t_out, final_val, 'RiseTimeLimits',[0,1]); %S struct adlı bir yapı oluşturur
tr_sim = S.RiseTime;
tp_sim = S.PeakTime;
Mp_sim = (S.Peak - final_val) / final_val * 100; % percent
ts_sim = S.SettlingTime;
%Command Window'da değerleri görmek için kodlar:
fprintf('--- Teorik (analitik) değerler ---\n');
fprintf('wn = %.4f rad/s, zeta = %.4f, wd = %.4f rad/s\n', wn, zeta, wd);
fprintf('tr = %.4f s\n', tr);
fprintf('tp = %.4f s\n', tp);
fprintf('Mp = %.4f (% .2f%%)\n', Mp, Mp_oran);
fprintf('ts (2%%) = %.4f s\n\n', ts);

fprintf('--- Simülasyon (step) ile bulunmuş değerler ---\n');
fprintf('tr_sim = %.4f s\n', tr_sim);
fprintf('tp_sim = %.4f s\n', tp_sim);
fprintf('Mp_sim = %.4f %%\n', Mp_sim);
fprintf('ts_sim = %.4f s\n\n', ts_sim);

% --- Grafik çizimi ve işaretleme ---
figure('Units','normalized','Position',[0.1 0.2 0.7 0.5]);
plot(t_out, y, 'LineWidth', 1.8); hold on;

% yatay son değer çizgisi
plot([t_out(1) t_out(end)], [final_val final_val], '--k', 'LineWidth', 1);

% dikey çizgiler ve anotasyonlar (teorik)
yl = ylim;
% tr
plot([tr tr], yl, ':', 'Color',[0 0.5 0], 'LineWidth',1.4);
text(tr, yl(2)*0.9, sprintf('tr=%.3fs', tr), 'Color',[0 0.5 0],'FontSize',10,'HorizontalAlignment','left');

% tp
plot([tp tp], yl, '--', 'Color',[0.85 0.33 0.10], 'LineWidth',1.4);
text(tp, yl(2)*0.8, sprintf('tp=%.3fs', tp), 'Color',[0.85 0.33 0.10],'FontSize',10,'HorizontalAlignment','left');

% ts
plot([ts ts], yl, '-.', 'Color',[0 0 0.8], 'LineWidth',1.4);
text(ts, yl(2)*0.7, sprintf('ts=%.3fs', ts), 'Color',[0 0 0.8],'FontSize',10,'HorizontalAlignment','left');

% Peak noktayı işaretle (sim veya teorik peak zamanı)
[peak_val, peak_idx] = max(y);
plot(t_out(peak_idx), peak_val, 'rx', 'MarkerSize',10, 'LineWidth',2);
text(t_out(peak_idx), peak_val*1.02, sprintf('tepe değeri=%.3f (%.2f%%)', peak_val, (peak_val-final_val)/final_val*100), 'Color','r','FontSize',10,'HorizontalAlignment','center');

xlabel('Zaman (s)');
ylabel('v_C(t)');
title('RLC-1 Sistemi — Birim Basamak Yanıtı ve Geçici Rejim Büyüklükleri');
grid on;
legend('Step yanıtı','Son değer','tr','tp','ts','tepe değeri','Location','Best');

xlim([0 min(tfinal, ts*1.6)]);
hold off;

