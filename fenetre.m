function [x,w]=fenetre(dec,type)

len=length(dec(1,:));

w=window(type,length(dec(:,1)));


for i=1:len
    x(:,i)=dec(:,i).*w;
end
