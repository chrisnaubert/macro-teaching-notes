function [MaxT,dif]=update_MaxT(kend,kstar,MaxT,tol,dif)
     if (kend-kstar)>tol
         MaxT=MaxT-10;
         dif=10;
     elseif (kstar-kend)>tol
         MaxT=MaxT+10;
         dif=dif;
     else
         MaxT=MaxT;
     end
end