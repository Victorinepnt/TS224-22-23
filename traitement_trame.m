function Sigdebruit = traitement_trame(Trame, SigBruit)

extrait = SigBruit(1:10000);

sigma2 = var(extrait);

SigBruitFT = fft(Trame);
n = length(SigBruitFT);

dspestim = ones(n,1)*sigma2;

Sigrehausse = ((abs(SigBruitFT)).^2)/n - dspestim;

for i=1:n
    if(Sigrehausse(i)<0)
        Sigrehausse(i) = 0;
    end
end


Sigrehausseft = sqrt(n*Sigrehausse);
SigdebruitFT = Sigrehausseft.*exp(1j*angle(SigBruitFT));


Sigdebruit = ifft(SigdebruitFT)'; 
rest = 4;