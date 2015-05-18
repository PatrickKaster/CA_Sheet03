
%create arm
arm=createArm(15,10,5);

%set some rotation in homogenous coordinates
rot1=eul2rot(45,0,0);
rot2=eul2rot(0,45,45);
rot3=eul2rot(45,45,45);

%move the arm
moveArm(arm,rot1,rot2,rot3);