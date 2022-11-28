function res = traitement_trame(SigBruit)

extrait = SigBruit(1:10000);

sigma2 = var(extrait);

SigBruitFT = fft(SigBruit);
n = length(SigBruitFT);

bruit=sqrt(sigma2)*randn(n,1);

dspestim = Mon_Welch(bruit',n);  %problème de taille pour la soustraction !!

Sigrehausse = abs(SigBruitFT) - abs(dspestim');

for i=1:n
    if(Sigrehausse(i)<0)
        Sigrehausse(i) = 0;
    end
end

SigdebruitFT = Sigrehausse + angle(SigBruitFT);

Sigdebruit = fftshift(ifft(SigdebruitFT));

figure,
plot(Sigdebruit);

res = 3;