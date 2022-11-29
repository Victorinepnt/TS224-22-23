clear,
close all,
clc,

sig=load("fcno03fz.mat");
s1 = -sig.fcno03fz;
n=length(s1);

N=64;
dec=decomp(s1,N,50);
t1=dec(:,1);
t2=dec(:,2);
w=window("hamming",length(t1));
t3=t1.*w;
figure,
plot(t3);

[bbg]=BruitBlancGaussien(length(s1),1,5,1e-6);

%% Ajout du bruit en fonction du RSB final 

RSB = 5;

sigbruite = parolebruitee(s1, RSB);

% RSB = 10;
% 
% sigbruite2 = parolebruitee(s1, RSB);
% RSB = 15;
% 
% sigbruite3 = parolebruitee(s1, RSB);


%% Traitement de trame

res = traitement_trame(sigbruite);

%% Figure

figure,
plot(s1);
title("Signal original");

