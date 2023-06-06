function E = Mean2Eccen(M, e)
%M2E Summary of this function goes here
%   Detailed explanation goes here
E_up = M+e*sin(0.1);
E_down = E_up + 0.1;
while (abs(E_up - E_down) > 0.0001)
    E_down = E_up;
    E_up = M + e*sin(E_down);
end 
E = E_up;
end