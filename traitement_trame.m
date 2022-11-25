function res = traitement_trame(SigBruitFT)

dspestim = Mon_Welch(SigBruitFT,512);

Sigrehausse = SigBruitFT - dspestim;

n = length(Sigrehausse);

for i=1:n
    if(Sigrehausse(i)<0)
        Sigrehausse(i) = 0;
    end
end

res = 3;