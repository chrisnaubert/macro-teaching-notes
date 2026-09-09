clc;
clear all;
tol=0.0000001; %Maximum tolerance of Norm(Vi-Vi-1) for convergence.
maxiter=10000; %Maximum number of iterations.
dif=10; %initialize norm of the diference of Vi an Vi-1
iter=1; %initialize number of iterations
alpha=0.3;
beta=0.99;
delta=.1;

% model parameters
mp=struct("alpha",alpha,"beta",beta,"delta",delta)

[kstar,cstar]=compute_steady_state(mp);

k00=.5;
c_L=0;
c_H=k00^alpha+(1-delta)*k00;
MaxT=200;
tic;
while dif>tol & iter<maxiter
     k0=k00;
     c0=(c_L+c_H)/2;
     [dif,sign,C0,K0,K1]=forward_pass(c0,k0,mp,MaxT,dif,tol);
     [c_L,c_H]=update_bounds(sign,c_L,c_H);
     [MaxT,dif]=update_MaxT(K1(end,1),kstar,MaxT,tol,dif);
     iter=iter+1;
end
toc;
T=size(C0,1);
time=[1:1:T];
CS=ones(T,1)*cstar;
KS=ones(T,1)*kstar;
figure()
subplot(1,2,1)
plot(time,C0,time,CS)
title('Consumption')
subplot(1,2,2)
plot(time,K1,time,KS)
title('Capital')