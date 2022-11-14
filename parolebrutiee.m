function [sigbruit] = parolebrutiee(siginit, bruit)

spec = spectogramme(siginit);

sigbruit = siginit + bruit;
specbru = spectrogramme(sigbruit);

figure,
subplot(2,1,1);
plot(siginit);
xaxis("axe temporel");
title("Représentation temporelle du signal d'origine");
subplot(2,1,2);
plot(spec);
xaxis("axe temporel");
title("Spectrogramme du signal d'origine");

figure,
subplot(2,1,1);
plot(sigbruit);
xaxis("axe temporel");
title("Représentation temporelle du signal bruité");
subplot(2,1,2);
plot(specbru);
xaxis("axe temporel");
title("Spectrogramme du signal bruité");

