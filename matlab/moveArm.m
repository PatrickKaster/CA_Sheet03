function moveArm(arm,rot1,rot2,rot3)
    
    %invert translation and rotation
    arm.Lt1(1:3,4) = -arm.Lt1(1:3,4);
    arm.Lt2(1:3,4) = -arm.Lt2(1:3,4);
    arm.Lt3(1:3,4) = -arm.Lt3(1:3,4);
    arm.Lt1(1:3,1:3) = arm.Lt1(1:3,1:3)';
    arm.Lt2(1:3,1:3) = arm.Lt2(1:3,1:3)';
    arm.Lt3(1:3,1:3) = arm.Lt3(1:3,1:3)';

    %move vertices to origin vertices
    v1=ones(4,5);
    v1(1:3,:)=get(arm.Handles(1),'Vertices')';
    v1=arm.Lt1*v1;
    set(arm.Handles(1),'Vertices',v1(1:3,:)');

    v2=ones(4,5);
    v2(1:3,:)=get(arm.Handles(2),'Vertices')';
    v2=arm.Lt1*arm.Lt2*v2;
    set(arm.Handles(2),'Vertices',v2(1:3,:)');

    v3=ones(4,5);
    v3(1:3,:)=get(arm.Handles(3),'Vertices')';
    v3=arm.Lt1*arm.Lt2*arm.Lt3*v3;
    set(arm.Handles(3),'Vertices',v3(1:3,:)');
    
    %restore translation and rotation
    arm.Lt1(1:3,4) = -arm.Lt1(1:3,4);
    arm.Lt2(1:3,4) = -arm.Lt2(1:3,4);
    arm.Lt3(1:3,4) = -arm.Lt3(1:3,4);
    arm.Lt1(1:3,1:3) = arm.Lt1(1:3,1:3)';
    arm.Lt2(1:3,1:3) = arm.Lt2(1:3,1:3)';
    arm.Lt3(1:3,1:3) = arm.Lt3(1:3,1:3)';
    
    %update the rotation matrices
    arm.Lt1=arm.Lt1*rot1;
    arm.Lt2=arm.Lt2*rot2;
    arm.Lt3=arm.Lt3*rot3;
    
    %update vertices
    v1=ones(4,5);
    v1(1:3,:)=get(arm.Handles(1),'Vertices')';
    v1=arm.Lt1*v1;
    set(arm.Handles(1),'Vertices',v1(1:3,:)');

    v2=ones(4,5);
    v2(1:3,:)=get(arm.Handles(2),'Vertices')';
    v2=arm.Lt1*arm.Lt2*v2;
    set(arm.Handles(2),'Vertices',v2(1:3,:)');

    v3=ones(4,5);
    v3(1:3,:)=get(arm.Handles(3),'Vertices')';
    v3=arm.Lt1*arm.Lt2*arm.Lt3*v3;
    set(arm.Handles(3),'Vertices',v3(1:3,:)');
    
end