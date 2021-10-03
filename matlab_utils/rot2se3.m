%Convert a rotational matrix to a SE(3) matrix
function se3 = rot2se3(phi, theta, psi, p1, p2, p3)
    rotm = eul2rot(phi, theta, psi);
    se3 = [rotm(1,1) rotm(1,2) rotm(1,3) p1;
           rotm(2,1) rotm(2,2) rotm(2,3) p2;
           rotm(3,1) rotm(3,2) rotm(3,3) p3;
           0         0         0         1];
end

