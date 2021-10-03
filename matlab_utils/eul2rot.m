%Eul to rotational matrix
function rotMatrix = eul2rot(phi, theta, psi)
    Z = [cos(phi) -sin(phi) 0;sin(phi) cos(phi) 0;0 0 1];
    Y = [cos(theta) 0 sin(theta);0 1 0;-sin(theta) 0 cos(theta)];
    X = [1 0 0;0 cos(psi) -sin(psi);0 sin(psi) cos(psi)];
    
    rotMatrix =Z*Y*X;
end