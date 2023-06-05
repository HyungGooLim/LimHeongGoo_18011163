function  az = azimuth(ENU)
% ENU의 위치를 이용하여 Azimuth 계산%
% ENU성분은 [km]단위%
ENUsize = size(ENU)
for i=1:ENUsize(1)
    r_E(i) = ENU(i,1); 
    r_N(i) = ENU(i,2); 
    r_U(i) = ENU(i,3);

    r_EN(i) = sqrt(r_E(i)^2+r_N(i)^2);
    az(i) = rad2deg(acos(r_N(i)./r_EN(i)));
    if az(i)<0
        az(i)=az(i)+360;
    end
end