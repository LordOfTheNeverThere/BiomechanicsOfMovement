function allJointsList = allJoints(tsvFile, shoulderPosition, hipPosition, cmHead, cmTrunk)
%myFun - Description
%
% Syntax: output = myFun(input)
%
% Long description

origin = [tsvFile(1,33),tsvFile(1,35)]; %Left Heel
lElbow = [tsvFile(1,9),tsvFile(1,11)];
rElbow = [tsvFile(1,18),tsvFile(1,20)];
lKnee = [tsvFile(1,27),tsvFile(1,29)];
rKnee = [tsvFile(1,45),tsvFile(1,47)];
lAnkle =[tsvFile(1,30),tsvFile(1,32)];
rAnkle =[tsvFile(1,48),tsvFile(1,50)];
lMeta =[tsvFile(1,36),tsvFile(1,38)];
rMeta =[tsvFile(1,54),tsvFile(1,56)];

allJointsList={[]};

%%Head and Trunk%%

allJointsList{1,1} = oneJoint(1,2,origin,cmHead,shoulderPosition,cmTrunck);

%%leftFA and leftA %%
allJointsList{2,1} = oneJoint(2,3,origin,cmlForArm,lElbow,cmlArm);

%%rightFA and rightA %%
allJointsList{3,1} = oneJoint(4,5,origin,cmrForArm,rElbow,cmrArm);

%%Trunk and thigh%%
allJointsList{4,1} = oneJoint(6,7,origin,cmTrunk,hipPosition,cmlThigh);

%%lthigh and lleg%%
allJointsList{5,1} = oneJoint(7,8,origin,cmlThigh,lKnee,cmlLeg);

%%left Leg and left foot%%
allJointsList{6,1} = oneJoint(8,9,origin,cmlLeg,lAnkle,cmlFoot);

%%leftFoot and leftToes%%
allJointsList{7,1} = oneJoint(9,10,origin,cmlFoot,lMeta,cmlToe);

%%rthigh and rleg%%
allJointsList{8,1} = oneJoint(11,12,origin,cmrThigh,rKnee,cmrLeg);

%%Right Leg and Right foot%%
allJointsList{9,1} = oneJoint(12,13,origin,cmrLeg,rAnkle,cmrFoot);

%%RightFoot and RightToes%%
allJointsList{10,1} = oneJoint(9,10,origin,cmrFoot,rMeta,cmrToe);



end