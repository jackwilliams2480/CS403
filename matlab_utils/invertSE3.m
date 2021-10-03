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