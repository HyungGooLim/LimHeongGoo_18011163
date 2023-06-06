% Main Script %
%% Parameter
clear all
clc
load('nav.mat')
a = nav.GPS.a/1000;  % Semi-major axis
e = nav.GPS.e;  % eccentricity
i = rad2deg(nav.GPS.i);  % inclination angle
omega = rad2deg(nav.GPS.omega); %Argument of perigee 
M0 = nav.GPS.M0; % Mean anomaly at toc
toc = nav.GPS.toc; %Epoch
OMEGA = rad2deg(nav.GPS.OMEGA); %Right ascension of ascending node
%% geoplot append matrix 
lat_geoplot = [];
lon_geoplot = []; 
%% skyplot append matrix
az_skyplot = [];
el_skyplot = [];
%% Ground Station %%
ground_lat = 37; %[deg]
ground_lon = 127; %[deg]
height = 1; %[km]
el_mask = 10; %[deg]
%% Time setting
t1 = datetime(toc);
t2 = datetime(2023,04,30,0,0,0);
ttime = linspace(t1,t2,24*60);
%% Orbit
for j=1:length(ttime)
    %% M0 2 M
    M = Mean_anomaly(t1,ttime(j),a,e,M0);
    %% M2E
    E = Mean2Eccen(M,e);
    %% E2v
    v = E2v(E,e);
    %% Range in Perifocal frame
    rangeInPQW = solveRangeInPerifocalFrame(a,e,v);
    %% Perifocal 2 ECI frame
    DCM_P2I=PQW2ECI(omega,i,OMEGA);
    rangeInECI=(DCM_P2I)*rangeInPQW;
    %% ECI 2 ECEF frame
    DCM = ECI2ECEF_DCM(ttime(j));
    rangeInECEF=DCM*rangeInECI;
    %% ECEF 2 geodetic
    wgs84 = wgs84Ellipsoid('kilometer');
    [lat,lon,h] = ecef2geodetic(wgs84,rangeInECEF(1),rangeInECEF(2),rangeInECEF(3),"degrees");

    % geodetic -> geoplot
    lat_geoplot = [lat_geoplot,lat];
    lon_geoplot = [lon_geoplot,lon];

    %% ECEF 2 ENU
    wgs84 = wgs84Ellipsoid('kilometer');
    [rangeInENU(1),rangeInENU(2),rangeInENU(3)] = ecef2enu(rangeInECEF(1),rangeInECEF(2),rangeInECEF(3),...
        ground_lat,ground_lon,height,wgs84);
    rangeInENU = [rangeInENU(1);rangeInENU(2);rangeInENU(3)];
    %% ENU 2 Azimuth/Elevation
    az = azimuth(rangeInENU);
    el = elevation(rangeInENU, el_mask);
    az_skyplot = [az_skyplot,az];
    el_skyplot = [el_skyplot,el];
end
geoplot(lat_geoplot,lon_geoplot,'r-*');
figure;
skyplot(az_skyplot,el_skyplot);