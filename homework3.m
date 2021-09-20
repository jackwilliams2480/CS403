clc
close all

%%

%Convert XYZ Euler angle into orientation matrix:
disp('Q1:')
eulMat1 = eul2rot(0.3, 0.2, 0.5);
eulMat2 = eul2rot(0.7, pi, pi/2);
eulMat3 = eul2rot(pi/3, 0, 0);

frame0 = rot2se3(0, 0, 0, 0, 0, 0);
frame0To1 = rot2se3(0.3, 0.2, 0.5, 0.4, 0.8, 1.2);
frame1To2 = rot2se3(0.7, pi, pi/2, -0.4, 0.5, 1.0);
frame2To3 = rot2se3(pi/3, 0, 0, 0.5, -0.8, 1.2);

%%
disp('Q2:')
transformation3T0 = invertSE3(multiSE3(multiSE3(frame0To1,frame1To2),frame2To3));

%%
disp('Q3:')
 
% draw figure
figure
hold on
grid on
 
reference = rot2se3(0, 0, 0, 0, 0, 0)
frame0To1 = rot2se3(0.3, 0.2, 0.5, 0.4, 0.8, 1.2)
frame0To2 = multiSE3(frame0To1,frame1To2)
frame0To3 = multiSE3(multiSE3(frame0To1,frame1To2),frame2To3)
 
drawCoordinate3D(reference(1:3,1:3),reference(1:3,end))
drawCoordinate3D(frame0To1(1:3,1:3),frame0To1(1:3,end))
drawCoordinate3D(frame0To2(1:3,1:3),frame0To2(1:3,end))
drawCoordinate3D(frame0To3(1:3,1:3),frame0To3(1:3,end))
axis equal
 
view(25,30)
hold off

%%
disp('Q4:')

figure
clf

t = 0;

for i=1:200
    t = t+0.02;
    theta = pi*t;
    x = 0.1 * sin(theta) + 0.05; 
    y = 0.3 * cos(theta) + 0.08;
    z = sin(theta) + 0.5;
    rotm = frame0To3(1:3,1:3)
    

    frame0To3 = multiSE3(multiSE3(frame0To1,frame1To2),frame2To3);
    Ga = frame0To3(1:3,4) + rotm * [x; y; z]
    pause(0.01);
    
    drawLine3D([0 0 0],Ga);
    drawCoordinate3D(rotm, Ga);
 
    % fix the range of axis
    axis([-3 3 -3 3 -3 3])
    view(3)
  
end
%%
%Functions

%SE(3) from rotational matrix and translation vector
function rotMatrix = eul2rot(phi, theta, psi)
    Z = [cos(phi) -sin(phi) 0;sin(phi) cos(phi) 0;0 0 1];
    Y = [cos(theta) 0 sin(theta);0 1 0;-sin(theta) 0 cos(theta)];
    X = [1 0 0;0 cos(psi) -sin(psi);0 sin(psi) cos(psi)];
    
    rotMatrix = mtimes(mtimes(Z,Y),X);
end

%Convert a rotational matrix to a SE(3) matrix
function se3 = rot2se3(phi, theta, psi, p1, p2, p3)
    rotm = eul2rot(phi, theta, psi);
    se3 = [rotm(1,1) rotm(1,2) rotm(1,3) p1;
           rotm(2,1) rotm(2,2) rotm(2,3) p2;
           rotm(3,1) rotm(3,2) rotm(3,3) p3;
           0         0         0         1];
end

%Multiply SE(3)_1 by SE(3)_2
function result = multiSE3(SE3_1, SE3_2)
    result = mtimes(SE3_1, SE3_2);
end

%Invert a given SE(3)
function result = invertSE3(SE3)
    n = [SE3(1,1) SE3(2,1) SE3(3,1)];
    o = [SE3(1,2) SE3(2,2) SE3(3,2)];
    a = [SE3(1,3) SE3(2,3) SE3(3,3)];
    p = [SE3(1,4);SE3(2,4);SE3(3,4)];
    
    result = [SE3(1,1) SE3(2,1) SE3(3,1) -1*dot(n,p);
              SE3(1,2) SE3(2,2) SE3(3,2) -1*dot(o,p);
              SE3(1,3) SE3(2,3) SE3(3,3) -1*dot(a,p);
              0        0        0         1];
end

