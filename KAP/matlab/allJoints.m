function allJointsList = allJoints(tsvFile, shoulderPosition, hipPosition, cmVector)
%allJoints(tsvFile, shoulderPosition, hipPosition, cmVector) Position = [x,z] and cmVector has the lenght of bodies, and has the cm of all bodies

%
% Syntax: output = myFun(input)
%
% Long description

global origin = [tsvFile(1,33),tsvFile(1,35)]; %Left Heel
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

allJointsList{1,1} = oneJoint(1,2,origin,cmVector(1),shoulderPosition,cmVector(2));

%%leftFA and leftA %%
allJointsList{2,1} = oneJoint(2,3,origin,cmVector(2),lElbow,cmVector(3));

%%rightFA and rightA %%
allJointsList{3,1} = oneJoint(4,5,origin,cmVector(4),rElbow,cmVector(5));

%%Trunk and thigh%%
allJointsList{4,1} = oneJoint(6,7,origin,cmVector(6),hipPosition,cmVector(7));

%%lthigh and lleg%%
allJointsList{5,1} = oneJoint(7,8,origin,cmVector(7),lKnee,cmVector(8));

%%left Leg and left foot%%
allJointsList{6,1} = oneJoint(8,9,origin,cmVector(8),lAnkle,cmVector(9));

%%leftFoot and leftToes%%
allJointsList{7,1} = oneJoint(9,10,origin,cmVector(9),lMeta,cmVector(10));

%%rthigh and rleg%%
allJointsList{8,1} = oneJoint(11,12,origin,cmVector(11),rKnee,cmVector(12));

%%Right Leg and Right foot%%
allJointsList{9,1} = oneJoint(12,13,origin,cmVector(12),rAnkle,cmVector(13));

%%RightFoot and RightToes%%
allJointsList{10,1} = oneJoint(13,14,origin,cmVector(13),rMeta,cmVector(14));



end