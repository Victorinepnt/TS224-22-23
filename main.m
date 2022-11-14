clear,
close all,
clc,

sig=load("fcno03fz.mat");
s1 = -sig.fcno03fz;


%% Figure

figure,
plot(s1);
title("Signal original");
