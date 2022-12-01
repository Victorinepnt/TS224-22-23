function res = traitement_trame(SigBruit)

extrait = SigBruit(1:10000);

sigma2 = var(extrait);

SigBruitFT = fft(SigBruit);
n = length(SigBruitFT);

dspestim = ones(n,1)*sigma2;  %problème de taille pour la soustraction !!

Sigrehausse = abs(SigBruitFT) - abs(dspestim);

for i=1:n
    if(Sigrehausse(i)<0)
        Sigrehausse(i) = 0;
    end
end

figure,
plot(Sigrehausse);
title('Sigrehausse');

SigdebruitFT = Sigrehausse; %+ angle(SigBruitFT);

figure,
plot(SigdebruitFT);
title('SigdebruitFT');

Sigdebruit = ifft(SigdebruitFT); 

figure,
plot(Sigdebruit);

res = 3;