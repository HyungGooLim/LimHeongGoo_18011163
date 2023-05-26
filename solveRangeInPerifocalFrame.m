function rangeInPQW = solveRangeInPerifocalFrame(semimajor_axis, eccentricity, true_anomaly)
%% parameter %%
mu = 3.986004418e+5; %[km3 s−2]
a = semimajor_axis; %[km]
e = eccentricity;
v = true_anomaly; %[deg]
p = a*(1-e^2);
r = p/(1+e*cosd(v)); %[km]

%% rangeInPQW
rangeInPQW = [r*cosd(v);r*sind(v);0];
end
