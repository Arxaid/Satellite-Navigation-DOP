% This file is part of the GNSS DOP Calculator.
%
% Copyright (c) 2022 Vladislav Sosedov, Alexander Novikov.
%
% Feel free to use, copy, modify, merge, and publish this software.

clear all
close all
clc

% Elevation and azimuth values for each using navigation satellite.
satG02 = [50; 110];
satG05 = [84; 166];
satG10 = [31; 64];
satG13 = [15; 34];
satG25 = [13; 250];
satG26 = [23; 162];

% Position vectors for each using navigation satellite.
rG02 = GetPosition(satG02(1), satG02(2));
rG05 = GetPosition(satG05(1), satG05(2));
rG10 = GetPosition(satG10(1), satG10(2));
rG13 = GetPosition(satG13(1), satG13(2));
rG25 = GetPosition(satG25(1), satG25(2));
rG26 = GetPosition(satG26(1), satG26(2));

% The best possible working constellation of satellites:
% G05, G13, G25, G26
disp('The best possible working constellation of satellites');
GetDOP(rG05, rG13, rG25, rG26);

% The worst possible working constellation of satellites.
% G02, G10, G13, G26
disp('The worst possible working constellation of satellites');
GetDOP(rG02, rG10, rG13, rG26);