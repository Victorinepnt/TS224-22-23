function [Signal] = AddRecouv(x,w,prct)

lenf=length(w);
[hx,lenx]=size(x);

for k=1:lenx-1
    calx=x(floor(hx*(prct/100)),k)+x(1,k+1);
    calw=w(floor(lenf*(prct/100)))+w(1);
    Signal(k)=calx/calw;
end
