function az = azimuth(ENU)
    % ENU의 위치를 이용하여 Azimuth 계산
    % ENU 성분은 [km] 단위

    r_E = ENU(1);
    r_N = ENU(2);
    r_U = ENU(3);

    r_EN = sqrt(r_E^2 + r_N^2);
    az = rad2deg(acos(r_N / r_EN));

    if az < 0
        az = mod(az, 360);
    end

    if r_E >= 0
        az = az;
    else
        az = 360-az;
end