function [sigbruit, bruit] = parolebruitee(siginit, RSB)

n = length(siginit);
varsig = var(siginit);

varbruit = varsig/(10^(RSB/10));

bruit=sqrt(varbruit)*randn(n,1);

sigbruit = siginit + bruit;

figure,
subplot(2,1,1);
plot(siginit);
xlabel("axe temporel");
title("Représentation temporelle du signal d'origine");
subplot(2,1,2);
spectrogram(siginit,100,80,100,1000,'yaxis')
title("Spectrogramme du signal d'origine");

figure,
subplot(2,1,1);
plot(sigbruit);
xlabel("axe temporel");
title("Représentation temporelle du signal bruité");
subplot(2,1,2);
spectrogram(sigbruit,100,80,100,1000,'yaxis')
title("Spectrogramme du signal bruité");

