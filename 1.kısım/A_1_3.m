R = 9;
L = 1.0;
C = 0.001;   % mF -> F

num = 1;
den = [L*C  R*C  1];

num1 = num*(1000); 
den1 = den*(1000);
G = tf(num1 , den1); 
%köklerin grafiğini veren kod:
pzmap(G);
%print(gcf,'scope_plot', '-dpdf','-bestfit'); bu kod arkada açık olan
%figürün pdf halini oluşturur.