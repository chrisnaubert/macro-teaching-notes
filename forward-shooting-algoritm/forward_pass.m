function [dif,sign,C0,K0,K1]=forward_pass(c0,k0,mp,MaxT,dif,tol)
    C0=zeros(MaxT+1,1);
    K0=zeros(MaxT+1,1);
    K1=zeros(MaxT+1,1);
    T=1;
    while (T<=MaxT) & (dif>tol) & (k0>0)
        % Capital Accumulation Equation
        k1=k0^mp.alpha+(1.0-mp.delta)*k0-c0;
        % Euler Equation
        c1=c0*(mp.beta*(mp.alpha*k1^(mp.alpha-1.0)+(1.0-mp.delta)));
        C0(T,1)=c0;
        K0(T,1)=k0;
        K1(T,1)=k1;
        dif=abs((k1-k0)/k0);
        sign=k1-k0;
        c0=c1;
        k0=k1;
        T=T+1;
    end  
    C0=C0(1:T-1,1);
    K0=K0(1:T-1,1);
    K1=K1(1:T-1,1);
end