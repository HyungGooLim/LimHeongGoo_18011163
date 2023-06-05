function  el = elevation(ENU, el_mask)
% ENU의 위치를 이용하여 Elevation 계산%
% ENU성분은 [km]단위%
ENUsize = size(ENU);
mask = el_mask; %[deg]
for i=1:ENUsize(1)
    r_E(i) = ENU(i,1); 
    r_N(i) = ENU(i,2); 
    r_U(i) = ENU(i,3);

    r_ENU(i) = sqrt(r_E(i)^2+r_N(i)^2+r_U(i)^2);
    el(i) = asin(r_U(i)./r_ENU(i)); %[rad]
    el(i) = rad2deg(el(i)); %[deg]

    if el(i)<=mask
        el(i)= NaN;
    end
end