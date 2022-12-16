function [Signal] = AddRecouv(x,w,prct)

lenf=length(w);
[hx,lenx]=size(x);
Signal=[];
for k=1:lenx-1
    for i=1:hx-floor(hx*(prct/100))-1
        calx=x(i+floor(hx*(prct/100)),k)+x(i,k+1);
        calw=w(floor(lenf*(prct/100)))+w(1);
        Sigtmp(i)=calx/calw;
    end
    Signal=[Signal Sigtmp];
end
