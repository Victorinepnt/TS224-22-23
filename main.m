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

sigbruite = parolebruitee(s1, RSB);

% RSB = 10;
% 
% sigbruite2 = parolebruitee(s1, RSB);
% RSB = 15;
% 
% sigbruite3 = parolebruitee(s1, RSB);

%%Addition-recouvrement

Signal_recouv=AddRecouv(fen,w,prct);

figure,
plot(s1)

figure,
plot(Signal_recouv),
title("Tu recouvres ?")

%% Traitement de trame

N=64;
prct=50;
dec2=decomp(sigbruite,N,prct);
[m,k] = size(dec2);

[fenb,wb]=fenetre(dec2,"hamming");   %on se place dans une hypothèse de quasi stationarité

for i=1:126
    res(:,i) = traitement_trame(fenb(:,i), sigbruite);
end


Signal_final=AddRecouv(res,w,prct);

figure,
plot(Signal_final),
title("Signal final");
%% Figure

figure,
plot(s1);
title("Signal original");

