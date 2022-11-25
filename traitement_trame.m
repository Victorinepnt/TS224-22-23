function res = traitement_trame(SigBruitFT)

n = length(SigBruitFT);

dspestim = Mon_Welch(SigBruitFT',512);  %problème de taille pour la soustraction !!

Sigrehausse = SigBruitFT - dspestim';

for i=1:n
    if(Sigrehausse(i)<0)
        Sigrehausse(i) = 0;
    end
end

res = 3;