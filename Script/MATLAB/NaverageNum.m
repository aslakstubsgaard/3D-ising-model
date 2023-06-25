function [ColEnd1,ColEnd2,ColEnd3,ColEnd4] = NaverageNum(Beta,Mu,eAA,eAB,eBA,eBB,eWA,eWB,uAA,uAB,uBA,uBB,rep,sec,Tint)
%% 
Size=numel(Tint);
Template=[sec(1),repmat(sec,1,rep)];
K=numel(Template);
N_ave=zeros(numel(eAA),numel(eAB),numel(eBA),numel(eBB),...
            numel(uAA),numel(uAB),numel(uBA),numel(uBB));
N_unc=zeros(numel(eAA),numel(eAB),numel(eBA),numel(eBB),...
            numel(uAA),numel(uAB),numel(uBA),numel(uBB));
F_ave=zeros(numel(eAA),numel(eAB),numel(eBA),numel(eBB),...
            numel(uAA),numel(uAB),numel(uBA),numel(uBB));
F_unc=zeros(numel(eAA),numel(eAB),numel(eBA),numel(eBB),...
            numel(uAA),numel(uAB),numel(uBA),numel(uBB));
%%        
for i1=eAA%-Mu
for j1=eAB
for k1=eBA
for l1=eBB

for i2=uAA
for j2=uAB
for k2=uBA
for l2=uBB
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Matrix/Array Dannelse
r=rand(2,Size);
Chain=zeros(1,K+1);
nCol=zeros(1,Size);
failCol=zeros(1,Size);

%% Komputering % 1=A, 2=B, og 0=W
n=0;
H=0; % Chain(n-1) % Er 0 hvis n<2
I=0; % Chain(n)   % Er 0 hvis n<1
S=0; % Template(n-1) % Er 0 hvis n<1
T=Template(n+1);

for m=Tint;

DeltaPlusA=eWA*(I==0)+i1*(I==1)+k1*(I==2)+i2*(T==1)+j2*(T==2);
DeltaPlusB=eWB*(I==0)+j1*(I==1)+l1*(I==2)+k2*(T==1)+l2*(T==2);
DeltaMinusI=-(( eWA*(H==0)+k1*(H==2)+i1*(H==1)+i2*(S==1)+j2*(S==2) )*(I==1)...
             +( eWB*(H==0)+j1*(H==1)+l1*(H==2)+k2*(S==1)+l2*(S==2) )*(I==2));

A=( r(1,m)<((1/3)*(3/2)^(n==0)*(0)^(n==K)) )...
 *( (DeltaPlusA <=0)+(DeltaPlusA >0)*(r(2,m)<=exp(-Beta*DeltaPlusA )) ); % Tilføj en A

B=( ((1/3)*(3/2)^(n==0))<r(1,m) )*( r(1,m)<((2/3)*(3/2)^(n==0)*(0)^(n==K)) )...
 *( (DeltaPlusB <=0)+(DeltaPlusB >0)*(r(2,m)<=exp(-Beta*DeltaPlusB )) ); % Tilføj en B

M=( ((2/3)*(3/2)^(n==0)*(n~=K))<r(1,m) )...
 *( (DeltaMinusI<=0)+(DeltaMinusI>0)*(r(2,m)<=exp(-Beta*DeltaMinusI)) ); %  Fjern en I

% Preparations til næste runde:
Chain(n+1)=A+2*B;
Chain(n+(n==0))=Chain(n+(n==0))*(M==0);
n=n+A+B-M;

H=Chain(n-(n>1)+(n==0))*(n>1);
I=Chain(n+(n==0));
S=Template(n+(n==0))*(n>0);
T=Template(n+(n<K));

nCol(m)=n;
failCol(m)=sum((Chain(1:end-1)~=Template).*(Chain(1:end-1)~=0));
% failCol(m)=sum( (Chain(1:end-1)==2).*(Template==1) );
end
N_ave(i1==eAA,j1==eAB,k1==eBA,l1==eBB,i2==uAA,j2==uAB,k2==uBA,l2==uBB)=...
    sum(nCol)/numel(nCol);

N_unc(i1==eAA,j1==eAB,k1==eBA,l1==eBB,i2==uAA,j2==uAB,k2==uBA,l2==uBB)=...
    sqrt((1/(Tint(end)-1))*sum((nCol-sum(nCol)/numel(nCol)).^2));

F_ave(i1==eAA,j1==eAB,k1==eBA,l1==eBB,i2==uAA,j2==uAB,k2==uBA,l2==uBB)=...
    sum(failCol)/numel(failCol);

F_unc(i1==eAA,j1==eAB,k1==eBA,l1==eBB,i2==uAA,j2==uAB,k2==uBA,l2==uBB)=...
    sqrt((1/(Tint(end)-1))*sum((failCol-sum(failCol)/numel(failCol)).^2));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
end
end
end

end
end
end
end
ColEnd1=N_ave;
ColEnd2=N_unc;
ColEnd3=F_ave;
ColEnd4=F_unc;

