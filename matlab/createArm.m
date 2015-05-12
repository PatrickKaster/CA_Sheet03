function arm=createArm(l1,l2,l3)

  arm=createArmStruct();

  arm.Handles(1)=createSegment(l1);
  arm.Handles(2)=createSegment(l2);
  arm.Handles(3)=createSegment(l3);

  arm.Lt2(2,4)=l1;
  arm.Lt3(2,4)=l2;

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

function arm=createArmStruct()

  arm.Handles=zeros(1,3);

  arm.Lt1=eye(4);
  arm.Lt2=eye(4);
  arm.Lt3=eye(4);

end