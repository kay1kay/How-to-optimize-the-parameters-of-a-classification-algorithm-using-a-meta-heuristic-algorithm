function [x l_lr u_lr l_mom u_mom]=init(N) 
l_lr=0.005; u_lr=0.2; % Lower and upper bounds for Learning Rate
l_mom=0.8; u_mom=0.99; % Lower and upper bounds for Momentum

for i=1:N 
    x(i,1)=l_lr-(l_lr-u_lr)*rand; 
    x(i,2)=l_mom-(l_mom-u_mom)*rand;
end
