function [kstar,cstar]=compute_steady_state(mp)
    kstar=(mp.alpha/((1.0/mp.beta)-(1.0-mp.delta)))^(1.0/(1.0-mp.alpha));
    cstar=kstar^mp.alpha-mp.delta*kstar;
end