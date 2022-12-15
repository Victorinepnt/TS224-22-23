function [t] = test()

signal=linspace(1,10,10);

dec=decomp(signal,5,50);

for i=1:length(dec)
    [x,w]=fenetre(dec,"hamming");
end

lenf=length(w);
[hx,lenx]=size(x);

for k=1:lenx-1
    calx=x(floor(hx*(50/100)),k)+x(1,k+1);
    calw=w(floor(lenf*(50/100)))+w(1);
    t(k)=calx/calw;
end

figure,
plot(signal);
title("Origine");
hold on,
plot(t);
title("test")
