clc
close all

addpath('./matlab_utils')
%%
L1 = 0.15;
L2 = 0.3;
L3 = 0.15;
L4 = 0.1;
L5 = 0.07;
L6 = 0.05;
%%
% draw figure
figure(1)
hold on
grid on

%base orientation
frame0To1 = constructSE3(eye(3),[0, 0, 0]);
frame0To2 = frame0To1 * constructSE3(eye(3),[0, 0, L1]);
frame0To3 = frame0To2 * constructSE3(eye(3),[L2, 0, 0]);
frame0To4 = frame0To3 * constructSE3(eye(3),[L3, 0, 0]);
frame0To5 = frame0To4 * constructSE3(eye(3),[L4, 0, 0]);
frame0To6 = frame0To5 * constructSE3(eye(3),[L5, 0, 0]);
frame0ToEE = frame0To6 * constructSE3(eye(3),[L6, 0, 0]);

%drawCoordinate3D(reference(1:3,1:3),reference(1:3,end));
drawLine3D([0,0,0].',frame0To2(1:3,end).');
drawLine3D(frame0To2(1:3,end).', frame0To3(1:3,end).');
drawLine3D(frame0To3(1:3,end).',frame0To4(1:3,end).');
drawLine3D(frame0To4(1:3,end).',frame0To5(1:3,end).');
drawLine3D(frame0To5(1:3,end).',frame0To6(1:3,end).');
drawLine3D(frame0To6(1:3,end).',frame0ToEE(1:3,end).');

axis equal
 
view(25,30)
pause(0.5);
%%
% first orientation
figure(2)
hold on
grid on

q = [0,90,0,30,90,0];

frame0To1 = constructSE3(Rz(q(1)),[0, 0, 0]);
frame0To2 = frame0To1 * constructSE3(Ry(q(2)),[0, 0, L1]);
frame0To3 = frame0To2 * constructSE3(Ry(q(3)),[L2, 0, 0]);
frame0To4 = frame0To3 * constructSE3(Rx(q(4)),[L3, 0, 0]);
frame0To5 = frame0To4 * constructSE3(Ry(q(5)),[L4, 0, 0]);
frame0To6 = frame0To5 * constructSE3(Rx(q(6)),[L5, 0, 0]);
frame0ToEE = frame0To6 * constructSE3(eye(3),[L6, 0, 0]);

drawLine3D([0,0,0].',frame0To2(1:3,end).');
drawLine3D(frame0To2(1:3,end).', frame0To3(1:3,end).');
drawLine3D(frame0To3(1:3,end).',frame0To4(1:3,end).');
drawLine3D(frame0To4(1:3,end).',frame0To5(1:3,end).');
drawLine3D(frame0To5(1:3,end).',frame0To6(1:3,end).');
drawLine3D(frame0To6(1:3,end).',frame0ToEE(1:3,end).');

%drawCoordinate3D(frame0To1(1:3,1:3),frame0To1(1:3,end));

axis([-.3 .3 -.3 .3 -.4 .3])
 
view(25,30)
pause(0.5);

%%
% first orientation
figure(3)
hold on
grid on

q = [0,120,0,60,90,0];

frame0To1 = constructSE3(Rz(q(1)),[0, 0, 0]);
frame0To2 = frame0To1 * constructSE3(Ry(q(2)),[0, 0, L1]);
frame0To3 = frame0To2 * constructSE3(Ry(q(3)),[L2, 0, 0]);
frame0To4 = frame0To3 * constructSE3(Rx(q(4)),[L3, 0, 0]);
frame0To5 = frame0To4 * constructSE3(Ry(q(5)),[L4, 0, 0]);
frame0To6 = frame0To5 * constructSE3(Rx(q(6)),[L5, 0, 0]);
frame0ToEE = frame0To6 * constructSE3(eye(3),[L6, 0, 0]);

drawLine3D([0,0,0].',frame0To2(1:3,end).');
drawLine3D(frame0To2(1:3,end).', frame0To3(1:3,end).');
drawLine3D(frame0To3(1:3,end).',frame0To4(1:3,end).');
drawLine3D(frame0To4(1:3,end).',frame0To5(1:3,end).');
drawLine3D(frame0To5(1:3,end).',frame0To6(1:3,end).');
drawLine3D(frame0To6(1:3,end).',frame0ToEE(1:3,end).');

%drawCoordinate3D(frame0To1(1:3,1:3),frame0To1(1:3,end));

axis([-0.2 0.5 -0.2 0.3 -0.3 0.3])
 
view(25,30)
pause(0.5)
hold off
%%
% Find EE for given configurations
q = [0,90,90,30,90,0];

frame0To1 = constructSE3(Rz(q(1)),[0, 0, 0]);
frame0To2 = frame0To1 * constructSE3(Ry(q(2)),[0, 0, L1]);
frame0To3 = frame0To2 * constructSE3(Ry(q(3)),[L2, 0, 0]);
frame0To4 = frame0To3 * constructSE3(Rx(q(4)),[L3, 0, 0]);
frame0To5 = frame0To4 * constructSE3(Ry(q(5)),[L4, 0, 0]);
frame0To6 = frame0To5 * constructSE3(Rx(q(6)),[L5, 0, 0]);
frame0ToEE = frame0To6 * constructSE3(eye(3),[L6, 0, 0])

q = [0,60,45,60,90,0];

frame0To1 = constructSE3(Rz(q(1)),[0, 0, 0]);
frame0To2 = frame0To1 * constructSE3(Ry(q(2)),[0, 0, L1]);
frame0To3 = frame0To2 * constructSE3(Ry(q(3)),[L2, 0, 0]);
frame0To4 = frame0To3 * constructSE3(Rx(q(4)),[L3, 0, 0]);
frame0To5 = frame0To4 * constructSE3(Ry(q(5)),[L4, 0, 0]);
frame0To6 = frame0To5 * constructSE3(Rx(q(6)),[L5, 0, 0]);
frame0ToEE = frame0To6 * constructSE3(eye(3),[L6, 0, 0])
%%
% Functions
function x = Rx(theta)
    x = [1 0 0;0 cos(theta) -sin(theta);0 sin(theta) cos(theta)];
end

function y = Ry(theta)
    y = [cos(theta) 0 sin(theta);0 1 0;-sin(theta) 0 cos(theta)];
end

function z = Rz(theta)
    z = [cos(theta) -sin(theta) 0;sin(theta) cos(theta) 0;0 0 1];
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

%Eul to rotational matrix
function rotMatrix = eul2rot(phi, theta, psi)
    Z = [cos(phi) -sin(phi) 0;sin(phi) cos(phi) 0;0 0 1];
    Y = [cos(theta) 0 sin(theta);0 1 0;-sin(theta) 0 cos(theta)];
    X = [1 0 0;0 cos(psi) -sin(psi);0 sin(psi) cos(psi)];
    
    rotMatrix =Z*Y*X;
end

function result = constructSE3(Rotation, Translation)
    %Ori_mat = EulAng2OriMat(Rotation);
    Ori_mat = Rotation;
    result = [Ori_mat(1,1) Ori_mat(1,2) Ori_mat(1,3) Translation(1,1);
              Ori_mat(2,1) Ori_mat(2,2) Ori_mat(2,3) Translation(1,2);
              Ori_mat(3,1) Ori_mat(3,2) Ori_mat(3,3) Translation(1,3);
              0 0 0 1;];
end

%Convert a rotational matrix to a SE(3) matrix
function se3 = rot2se3(phi, theta, psi, p1, p2, p3)
    rotm = eul2rot(phi, theta, psi);
    se3 = [rotm(1,1) rotm(1,2) rotm(1,3) p1;
           rotm(2,1) rotm(2,2) rotm(2,3) p2;
           rotm(3,1) rotm(3,2) rotm(3,3) p3;
           0         0         0         1];
end
