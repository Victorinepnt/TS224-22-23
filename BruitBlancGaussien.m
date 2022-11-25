function [bbg] = BruitBlancGaussien(n,PuiFil,dB,Ts)

%Création du bruit
SigmaSym=1;

Puimoy=SigmaSym*PuiFil./Ts;
sigma2=SigmaSym*PuiFil./(2*10.^(dB/10));

bbg=sqrt(sigma2)*randn(n,1);
l=meshgrid(-n+1:1:n-1,1);
AutoCorr=zeros(2*n-1,1);
AutoCorr(n)=sigma2;
unbia=xcorr(bbg,'unbiased');
bia=xcorr(bbg,'biased');
bbgfft=real(fftshift(fft(bbg)));
perio=Mon_Welch(bbg,2048);

%% Figure

%Representation autocorrélation théorique:

figure,
subplot(3,1,1);
plot(l,AutoCorr);
title("Autocorrélation théorique");
subplot(3,1,2);
plot(l,unbia);
title("Corrélatioon non-biaisé");
subplot(3,1,3);
plot(l,bia);
title("Corrélatioon biaisé");

figure,
plot(bbgfft);
title("Spectre de puissance");

figure,
plot(perio);
title("Periodogramme")
