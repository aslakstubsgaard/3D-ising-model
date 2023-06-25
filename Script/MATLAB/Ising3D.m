clc,clear,close all
reset(RandStream.getDefaultStream,sum(100*clock))
%% Constants %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Beta=1; 
J=1.0;
h=1.0;
N=2;
size=2^(N^2);
%% Constructing P %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Q=ones(N,N,2);
P=ones(size);

for i=1:size
	for j=1:size
		for p=1:N
			for q=1:N
				Q(p,q,1)=(mod(j,2)==1)*(1)+(mod(j,2)==0)*(-1);
				Q(p,q,2)=(mod(i,2)==1)*(1)+(mod(i,2)==0)*(-1);
			end
		end

			E=...;
			epsilon=...;
		P(i,j)=exp(beta*(E+epsilon));
	end
end

%% Eigenvalus %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Exponents %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Plotting %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%