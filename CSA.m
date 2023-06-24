function [LR,Mom] = CSA(Dataset)
% [cntRow, cntCol] = size(Dataset);
pd=2; % Problem dimension
N=10; % Flock (population) size
AP=0.1; % Awareness probability
fl=1; % Flight length (fl)

[x l_lr u_lr l_mom u_mom]=init(N); % Function for initialization

xn=x;
ft=fitness(xn,N,Dataset); % Function for fitness evaluation

mem=x; % Memory initialization
fit_mem=ft; % Fitness of memory positions

tmax=50; % Maximum number of iterations (itermax)
bItr = [];
for t=1:tmax

    num=ceil(N*rand(1,N)); % Generation of random candidate crows for following (chasing)
    for i=1:N
        if rand>AP
            while(1)
                xnew(i,:) = x(i,:)+fl*rand*(mem(num(i),:)-x(i,:)); % Generation of a new position for crow i (state 1)
                if xnew(i,1)>=l_lr & xnew(i,1)<=u_lr & xnew(i,2)>=l_mom & xnew(i,2)<=u_mom
                    break;
                end
            end
        else
            xnew(i,1)=l_lr-(l_lr-u_lr)*rand; % Generation of a new position for crow i (state 2)
            xnew(i,2)=l_mom-(l_mom-u_mom)*rand;
        end
    end

    xn=xnew;
    ft=fitness(xn,N,Dataset); % Function for fitness evaluation of new solutions

    for i=1:N % Update position and memory
        if xnew(i,1)>=l_lr & xnew(i,1)<=u_lr & xnew(i,2)>=l_mom & xnew(i,2)<=u_mom
            x(i,:)=xnew(i,:); % Update position
            if ft(i)>fit_mem(i)
                mem(i,:)=xnew(i,:); % Update memory
                fit_mem(i)=ft(i);
            end
        end
    end

    ffit(t)=max(fit_mem); % Best found value until iteration t
    disp("Iteration "+t+": "+max(fit_mem));
    bItr(1,t) = max(fit_mem);
end
plot(1:tmax, bItr(1, 1:tmax));
xlabel("Iteration");
ylabel("Fitness");
ngbest=find(fit_mem== max(fit_mem));
g_best=mem(ngbest(1),:); % Solution of the problem
figure;
bar(fit_mem);
LR = g_best(1, 1);
Mom = g_best(1, 2);

end