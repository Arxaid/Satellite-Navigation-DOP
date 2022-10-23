% This file is part of the GNSS DOP Calculator.
%
% Copyright (c) 2022 Vladislav Sosedov, Alexander Novikov.
%
% Feel free to use, copy, modify, merge, and publish this software.

function r = GetPosition(elevation, azimuth)
% GetPosition function uses quaternion matlab class v1.8.0.0 by Mark Tincknell.
% https://www.mathworks.com/matlabcentral/fileexchange/33341-quaternion
%
% Input:
%   Coordinates of the navigation satellite in horizontal (az/el)
%   astronomical coordinate system.
% Return:
%   Position vector (radius-vector) in topocentric coordinate system
%   of current navigational satellite.

% Orts of the topocentric coordinate system via quaternions.
x0 = quaternion([0,1,0,0]);
y0 = quaternion([0,0,1,0]);

% Position vector (line of sight vector) projection on the xOz plane.
lambda = cosd(azimuth/2) + y0 * sind(azimuth/2);    
r_xz = lambda * x0 * lambda';

% Quaternion M, rotation by the elevation angle in the vertical plane.
e = (r_xz * y0)/(abs(r_xz * y0));
M = cosd(elevation/2) + e * sind(elevation/2);

r = vector(M * r_xz * M');