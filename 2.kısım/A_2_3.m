syms s

% Transfer fonksiyonu
G = 1000 / (s^2 + 9*s + 1000);

% Step input için Y(s) = G(s)/s
Y = G / s;
%impuls input için Y(s) = G(s):
Y1 = G;

% Son değer teoremi
y_inf = limit(s * Y, s, 0);
y_inf1 = limit(s*Y1,s,0);


disp('Son değerler = ')
disp(y_inf,y_inf1)
disp(y_inf1)
