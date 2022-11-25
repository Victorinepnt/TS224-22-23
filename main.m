clear,
close all,
clc,

sig=load("fcno03fz.mat");
s1 = -sig.fcno03fz;
n=length(s1);
[bbg]=BruitBlancGaussien(n,1,5,1e-6);
dec=decomp(s1,100,50);
t1=dec(:,1);
t2=dec(:,2);
%% Figure

figure,
plot(s1);
title("Signal original");

