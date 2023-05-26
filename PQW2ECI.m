function rotation_matrix = PQW2ECI(arg_prg,inc_angle,RAAN) 
%%                  Definition                      %%
% arg_prg : argument of perigee [deg]               %% 
% inc_angle : inclination angle [deg]               %%
% RAAN : Right Ascension of the Ascending Node [deg]%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% a_n = a_ECI , a_b = a_PQW // n -> b frame transformation
% a_ECI = Rz(RAAN,3)*Rx(inc_angle,1)*Rz(arg_prg,3)*a_PQR
% a_ECI = rotation_matrix*a_PQR

Rz_RAAN = [cosd(RAAN) -sind(RAAN) 0;...
           sind(RAAN) cosd(RAAN) 0;...
           0        0       1]

Rx_inc = [1      0       0;...
          0 cosd(inc_angle) -sind(inc_angle);...
          0 sind(inc_angle) cosd(inc_angle)]

Rz_arg = [cosd(arg_prg) -sind(arg_prg) 0;...
          sind(arg_prg) cosd(arg_prg) 0;...
          0       0      1]

rotation_matrix = Rz_RAAN*Rx_inc*Rz_arg;
end