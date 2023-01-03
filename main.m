%Groupe 14
clear,
close all,
clc,

sig=load("fcno03fz.mat");
s1 = -sig.fcno03fz;
n=length(s1);


N=64;
prct=50;
dec=decomp(s1,N,prct);

[fen,w]=fenetre(dec,"hamming");

t=test();



%[bbg]=BruitBlancGaussien(length(s1),1,5,1e-6);

%% Ajout du bruit en fonction du RSB final 

RSB = 5;

[sigbruite, bruit1] = parolebruitee(s1, RSB);
figure,
plot(sigbruite);
title('Signal bruité');

RSB = 10;

[sigbruite2, bruit2] = parolebruitee(s1, RSB);

RSB = 15;

[sigbruite3, bruit3] = parolebruitee(s1, RSB);

%%Addition-recouvrement

Signal_recouv=AddRecouv(fen,w,prct);


%% Traitement de trame
%RSB=5dB
N=64;
prct=50;
dec2=decomp(sigbruite,N,prct);
[m,k] = size(dec2);

[fenb,wb]=fenetre(dec2,"hamming");   %on se place dans une hypothèse de quasi stationarité

for i=1:126
    res(:,i) = traitement_trame(fenb(:,i), sigbruite);
end


Signal_final=AddRecouv(real(res),w,prct);
Signal_final=[zeros(1,floor(length(dec2(:,1))*(prct/100))) Signal_final];
figure,
plot(sigbruite,'r');

hold on,
plot(Signal_final,'b'),

hold on,
plot(s1,'g');

legend("Signal bruité RSB = 5 dB","Signal débruité", "Signal original");

%RSB = 10dB
dec3=decomp(sigbruite2,N,prct);
[m,k] = size(dec3);

[fenb2,wb]=fenetre(dec3,"hamming");   %on se place dans une hypothèse de quasi stationarité

for i=1:126
    res2(:,i) = traitement_trame(fenb2(:,i), sigbruite2);
end


Signal_final2=AddRecouv(real(res2),w,prct);
Signal_final2=[zeros(1,floor(length(dec3(:,1))*(prct/100))) Signal_final2];
figure,
plot(sigbruite2,'r');

hold on,
plot(Signal_final2,'b'),

hold on,
plot(s1,'g');
legend("Signal bruité RSB = 10 dB","Signal débruité", "Signal original");

%RSB = 15dB
dec4=decomp(sigbruite3,N,prct);
[m,k] = size(dec4);

[fenb3,wb]=fenetre(dec4,"hamming");   %on se place dans une hypothèse de quasi stationarité

for i=1:126
    res3(:,i) = traitement_trame(fenb3(:,i), sigbruite3);
end


Signal_final3=AddRecouv(real(res3),w,prct);
Signal_final3=[zeros(1,floor(length(dec2(:,1))*(prct/100))) Signal_final3];
figure,
plot(sigbruite3,'r');

hold on,
plot(Signal_final3,'b'),

hold on,
plot(s1,'g');
legend("Signal bruité RSB = 15 dB","Signal débruité", "Signal original");

%%Calcul de RSB sur le signal débruité

SNRfuncRSB = zeros(3,2);
SNRfuncRSB(1,1) = 5;
SNRfuncRSB(2,1) = 10;
SNRfuncRSB(3,1) = 15;

SNRfuncRSB(1,2) = 10*log10(var(Signal_final)/var(bruit1));
SNRfuncRSB(2,2) = 10*log10(var(Signal_final2)/var(bruit2));
SNRfuncRSB(3,2) = 10*log10(var(Signal_final3)/var(bruit3));
