function [bbg] = BruitBlancGaussien(n,PuiFil,dB,Ts)
nfft=2048;
%Création du bruit
SigmaSym=1;

Puimoy=SigmaSym*PuiFil./Ts;
sigma2=SigmaSym*PuiFil./(2*10.^(dB/10));

bbg=sqrt(sigma2)*randn(n,1);
l=meshgrid(-n+1:1:n-1,1);

%Calcul des corrélations
AutoCorr=zeros(2*n-1,1);
AutoCorr(n)=sigma2;
unbia=xcorr(bbg,'unbiased');
bia=xcorr(bbg,'biased');

%Calcul DSP
perio=Mon_Welch(bbg,nfft);

%Calcul spectre de puissance
%A modifier, voir cours de l'an dernier
bbg_fft=real(fftshift(fft(bbg)));

%Calcul de la DSP théorique
bbg_dsp=ones(n,1)*sigma2;

%Changer toutes les abscisses

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
plot(bbg_fft);
title("Spectre de puissance");


figure,
plot(perio);
hold on;
plot(bbg_dsp(1:nfft));
title("Periodogramme et densite spectrale de puissance")
legend("DSP calculé", "DSP théorique")
