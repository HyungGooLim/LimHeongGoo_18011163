function M = Mean_anomaly(time_start,time_current,a,e,M0)
% a = semi_major_axis
mu = 3.986e+5; %(gravitational parameter)
s = seconds(time_current-time_start);
M = M0 + sqrt(mu/a^3)*s; %[rad]
if abs(M) > 2*pi
    M = rem(M,2*pi);
end
end