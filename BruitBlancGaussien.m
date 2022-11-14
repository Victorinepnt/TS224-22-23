function [bbg] = BruitBlancGaussien(n,PuiFil,dB,Ts)

%Création du bruit
SigmaSym=1;

Puimoy=SigmaSym*PuiFil./Ts;
sigma2=SigmaSym*PuiFil./(2*10.^(dB/10));

bbg=(sqrt(sigma2)*randn(n,1)+1j*randn(n,1));