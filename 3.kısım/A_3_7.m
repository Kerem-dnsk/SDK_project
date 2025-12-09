A = [0 1;-1000 -9];

B = [0; 1000];

C = [1 0];
D = 0;

% Kontrol edilebilirlik matrisi
Co = ctrb(A,B);

% Gözlenebilirlik matrisi
Ob = obsv(A,C);

% Rank hesapları
rank_Co = rank(Co);
rank_Ob = rank(Ob);
%Sistem için oluşturulan kontrol edilebilirlik matrisinin rütbesi 2 olup 
% sistemin tüm durumlarının giriş sinyali ile kontrol edilebildiği görülmüştür.
%Benzer şekilde gözlenebilirlik matrisinin rütbesi de 2 olup sistemin tüm
% durumlarının çıkıştan gözlenebilir olduğu doğrulanmıştır.
%bizim transfer fonksiyonunun mertebesi de 2'dir.
