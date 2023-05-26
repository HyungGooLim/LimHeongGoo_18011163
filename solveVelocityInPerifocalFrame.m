function velocityInPQW = solveVelocityInPerifocalFrame(semimajor_axis, eccentricity, true_anomaly)
%% parameter %%
mu = 3.986004418e+5; %[km3 s−2]
a = semimajor_axis; %[km]
e = eccentricity;
v = true_anomaly; %[deg]
p = a*(1-e^2);

%% velocityInPQW
velocityInPQW = sqrt(mu/p)*[-sind(v);e+cosd(v);0];
end