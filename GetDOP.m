% This file is part of the GNSS DOP Calculator.
%
% Copyright (c) 2022 Vladislav Sosedov, Alexander Novikov.
%
% Feel free to use, copy, modify, merge, and publish this software.

function GetDOP(r1, r2, r3, r4)
% Input:
%   Position vector for each navigation satellite 
%   in the satellite constellation.
% Return:
%   Outputs A matrix and Q matrix to the console.
%   Outputs PDOP, TDOP, GDOP, HDOP values to the console.

% A matrix for current satellite constellation.
%
% A matrix consists of the following elements:
% rx1 ry1 rz1 -1
% rx2 ry2 rz2 -1
% rx3 ry3 rz3 -1
% rx4 ry4 rz4 -1
A = [r1(1),r1(2),r1(3),-1;
     r2(1),r2(2),r2(3),-1;
     r3(1),r3(2),r3(3),-1;
     r4(1),r4(2),r4(3),-1];
disp('A matrix');
disp(A);

% Q matrix for current satellite constellation.
%
% Q matrix consists of the following elements:
% dx^2  dx*dy dx*dz dx*dt
% dy*dx dy^2  dy*dz dy*dt
% dz*dx dz*dy dz^2  dz*dt
% dt*dx dt*dy dt*dz dt^2
Q = (A * A')^(-1);
disp('Q matrix');
disp(Q);

% PDOP (position DOP) value.
PDOP = sqrt(Q(1,1)+Q(2,2)+Q(3,3));
disp('PDOP value = ');
disp(PDOP);

% TDOP (time DOP) value.
TDOP = sqrt(Q(4,4));
disp('TDOP value');
disp(TDOP);

% GDOP (geometric DOP) value.
GDOP = sqrt(PDOP^2+TDOP^2);
disp('GDOP value');
disp(GDOP);

% HDOP (horizontal DOP) value.
HDOP = sqrt(Q(1,1)+Q(3,3));
disp('HDOP value');
disp(HDOP);

% VDOP (vertical DOP) value.
VDOP = sqrt(Q(2,2));
disp('VDOP value');
disp(VDOP);