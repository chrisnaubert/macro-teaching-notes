function [c_L,c_H]=update_bounds(sign,c_L,c_H)
    if sign > 0
         % Sign>0 => didn't consume enough in period 0 so we adjust upward
         % our starting consumption level
         c_L=(c_L+c_H)/2;
    else
         % k1-k0<0 => we consumed too much in period 0 so we adjust
         % downward our starting consumption level
         c_H=(c_L+c_H)/2;
     end
end