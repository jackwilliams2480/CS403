function result = constructSE3(Rotation, Translation)
    %Ori_mat = EulAng2OriMat(Rotation);
    Ori_mat = Rotation;
    result = [Ori_mat(1,1) Ori_mat(1,2) Ori_mat(1,3) Translation(1,1);
              Ori_mat(2,1) Ori_mat(2,2) Ori_mat(2,3) Translation(1,2);
              Ori_mat(3,1) Ori_mat(3,2) Ori_mat(3,3) Translation(1,3);
              0 0 0 1;];
end