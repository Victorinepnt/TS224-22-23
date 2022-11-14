clear,
close all,
clc,

sig=load("fcno03fz.mat");
s1 = -sig.fcno03fz;
n=length(s1);
[bbg]=BruitBlancGaussien(length(s1),1,5,1e-6);

%% Figure

figure,
plot(s1);
title("Signal original");

