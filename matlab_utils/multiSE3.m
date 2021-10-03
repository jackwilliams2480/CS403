%Multiply SE(3)_1 by SE(3)_2
function result = multiSE3(SE3_1, SE3_2)
    result = mtimes(SE3_1, SE3_2);
end