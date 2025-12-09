R = 9;
L = 1.0;
C = 0.001;   % mF -> F

num = 1;
den = [L*C  R*C  1];

num1 = num*(1000); 
den1 = den*(1000);
G = tf(num1 , den1); 

  % kökleri ve sıfırları
  zeros_G = roots(num1);%sıfırı yoktur.
  poles_G = roots(den1);%kutuplar imajiner çıktı.
  
  