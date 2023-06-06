function  el = elevation(ENU, el_mask)
% ENU의 위치를 이용하여 Elevation 계산%
% ENU성분은 [km]단위%
mask = el_mask; %[deg]
r_E = ENU(1); 
r_N = ENU(2); 
r_U = ENU(3);

r_ENU = sqrt(r_E^2+r_N^2+r_U^2);
el = asin(r_U/r_ENU); %[rad]
el = rad2deg(el); %[deg]

    if el<=mask
        el= NaN;
    end
end