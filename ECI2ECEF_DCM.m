function DCM=ECI2ECEF_DCM(time)
% input : time ([YYYY,MM,DD,hh,mm,ss] %
jd = juliandate(time);

thGMST = siderealTime(jd);

DCM = [cosd(thGMST) sind(thGMST) 0;...
       -sind(thGMST) cosd(thGMST) 0;...
       0 0 1];

end