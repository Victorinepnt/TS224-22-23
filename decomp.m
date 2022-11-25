function [trame] = decomp(s,taille,recouv)

len=length(s);
len_trame=floor(len/taille);

trame(:,1)=s(1:len_trame+1);
cpt=2;
pas=len_trame-len_trame*(recouv/100);
init=len_trame-(len_trame*(recouv/100))+1;
for i=init:pas:len-len_trame
    trame(:,cpt)=s(i:i+len_trame);
    cpt=cpt+1;
end

% i=1;
% ind=i-(recouv/100)*len_trame;
% while ind~=len
%     %trame(:,cpt)=s(ind:ind+len_trame);
%     i=i+1;
%     ind=i-(recouv/100)*len_trame
%     cpt=cpt+1;
% end