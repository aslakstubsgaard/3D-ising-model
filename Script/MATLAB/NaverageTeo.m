function [ColEnd2] = NaverageTeo(Beta,Mu,eAA,eAB,eBA,eBB,eWA,eWB,uAA,uAB,uBA,uBB,rep,sec)
%%
Template=[sec(1),repmat(sec,1,rep)];
phi=numel(sec);
N=1+phi*rep; % =numel(Template)
N_ave1=zeros(numel(eAA),numel(eAB),numel(eBA),numel(eBB),...
             numel(uAA),numel(uAB),numel(uBA),numel(uBB));
N_ave2=zeros(numel(eAA),numel(eAB),numel(eBA),numel(eBB),...
             numel(uAA),numel(uAB),numel(uBA),numel(uBB));
N_ave3=zeros(numel(eAA),numel(eAB),numel(eBA),numel(eBB),...
             numel(uAA),numel(uAB),numel(uBA),numel(uBB));
%%
for i1=eAA
for j1=eAB
for k1=eBA
for l1=eBB

for i2=uAA
for j2=uAB
for k2=uBA
for l2=uBB
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Q1mark=[exp(-Beta*(eWA-Mu)),0;0,exp(-Beta*(eWB-Mu))]...
  *[exp(-Beta*(i2-Mu)),0;0,exp(-Beta*(k2-Mu))];
Q2mark=[exp(-Beta*(eWA-Mu)),0;0,exp(-Beta*(eWB-Mu))]...
  *[exp(-Beta*(j2-Mu)),0;0,exp(-Beta*(l2-Mu))];
Q1=[exp(-Beta*(i1-Mu)),exp(-Beta*(j1-Mu));exp(-Beta*(k1-Mu)),exp(-Beta*(l1-Mu))]...
  *[exp(-Beta*(i2-Mu)),0;0,exp(-Beta*(k2-Mu))];
Q2=[exp(-Beta*(i1-Mu)),exp(-Beta*(j1-Mu));exp(-Beta*(k1-Mu)),exp(-Beta*(l1-Mu))]...
  *[exp(-Beta*(j2-Mu)),0;0,exp(-Beta*(l2-Mu))];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% #1
% tic
% Prod1=zeros(2,2); dProd1=zeros(2,2);
% Y=eye(2);
% for n=2:N;
%     Y=Y*(Q1.*(Template(n)==1)+Q2.*(Template(n)==2));
%     Prod1=Prod1+Y;
%     dProd1=dProd1+n.*Y;
% end
% QW=Q1mark.*(sec(1)==1)+Q2mark.*(sec(1)==2);
% N_ave1(i1==eAA,j1==eAB,k1==eBA,l1==eBB,i2==uAA,j2==uAB,k2==uBA,l2==uBB)=...
%        sum(sum(QW+QW*dProd1))/sum(sum(QW+QW*Prod1));
% toc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% #2
% % tic
Prod1=zeros(2,2); dProd1=zeros(2,2);
Prod2=zeros(2,2); dProd2=zeros(2,2);
Y=eye(2);
for p=1:phi;
    Y=Y*(Q1.*(sec(p)==1)+Q2.*(sec(p)==2));
    Prod2=Prod2+Y;
    dProd2=dProd2+(p+1).*Y;
end
for p=1:rep;
    Prod1=Prod1+Y^(p-1);
    dProd1=dProd1+((p-1)*phi).*(Y^(p-1));
end
QW=Q1mark.*(sec(1)==1)+Q2mark.*(sec(1)==2);
N_ave2(i1==eAA,j1==eAB,k1==eBA,l1==eBB,i2==uAA,j2==uAB,k2==uBA,l2==uBB)=...
      sum(sum(QW+QW*(dProd1*Prod2+Prod1*dProd2)))/sum(sum(QW+QW*Prod1*Prod2));
% % toc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% #3
% tic
% Prod1=zeros(2,2); dProd1=zeros(2,2);
% Prod2=zeros(2,2); dProd2=zeros(2,2);
% Y=eye(2);
% for p=1:phi;
%     Y=Y*(Q1.*(sec(p)==1)+Q2.*(sec(p)==2));
%     Prod2=Prod2+Y;
%     dProd2=dProd2+p.*Y;
% end
% [V,L] = eig(Y);
% for p=1:rep;
%     Prod1=Prod1+V*L^(p-1)*V^-1;
%     dProd1=dProd1+(p*phi).*(V*L^(p-1)*V^-1);
% end
% Prod1
% dProd1
% Prod2
% dProd2
% QW=Q1mark.*(sec(1)==1)+Q2mark.*(sec(1)==2);
% N_ave3(i1==eAA,j1==eAB,k1==eBA,l1==eBB,i2==uAA,j2==uAB,k2==uBA,l2==uBB)=...
%       sum(sum(QW+QW*(dProd1*Prod2+Prod1*dProd2)))/sum(sum(QW+QW*Prod1*Prod2));
% toc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
end
end
end

end
end
end
end
% ColEnd1=N_ave1;
ColEnd2=N_ave2;
% ColEnd3=N_ave3;

