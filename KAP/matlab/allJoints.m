
function allJointsList = allJoints(tsvFile, shoulderPosition, hipPosition)

%allJoints(tsvFile, shoulderPosition, hipPosition, CM) Position = [x,z] and CM has the lenght of bodies, and has the cm of all bodies

%
% Syntax: output = myFun(input)
%
% Long description


global CM;
 %Left Heel
lElbow = [tsvFile{1,9},tsvFile{1,11}];
rElbow = [tsvFile{1,18},tsvFile{1,20}];
lKnee = [tsvFile{1,27},tsvFile{1,29}];
rKnee = [tsvFile{1,45},tsvFile{1,47}];
lAnkle =[tsvFile{1,30},tsvFile{1,32}];
rAnkle =[tsvFile{1,48},tsvFile{1,50}];
lMeta =[tsvFile{1,36},tsvFile{1,38}];
rMeta =[tsvFile{1,54},tsvFile{1,56}];
lHip = [tsvFile{1,24}, tsvFile{1,26}];
rHip = [tsvFile{1,42}, tsvFile{1,44}];


allJointsList={[]};

%%HERE You use all 13 revJoints regardless of superposition

%% Head and Trunk %%
allJointsList{1,1} = oneJoint(1,6,CM{1,1},shoulderPosition,CM{6,1});

%% Head and lFA %%
allJointsList{2,1} = oneJoint(1,2,CM{1,1},shoulderPosition,CM{2,1});

%% leftFA and leftA %%
allJointsList{3,1} = oneJoint(2,3,CM{2,1},lElbow,CM{3,1});

%% Head and rFA %%
allJointsList{4,1} = oneJoint(1,4,CM{1,1},shoulderPosition,CM{4,1});

%% rightFA and rightA %%
allJointsList{5,1} = oneJoint(4,5,CM{4,1},rElbow,CM{5,1});

%% Trunk and lThigh %%
allJointsList{6,1} = oneJoint(6,7,CM{6,1},hipPosition,CM{7,1});

%% lthigh and lleg %%
allJointsList{7,1} = oneJoint(7,8,CM{7,1},lKnee,CM{8,1});

%% left Leg and left foot %%
allJointsList{8,1} = oneJoint(8,9,CM{8,1},lAnkle,CM{9,1});

%% leftFoot and leftToes %%
allJointsList{9,1} = oneJoint(9,10,CM{9,1},lMeta,CM{10,1});

%% Trunk and rThigh %%
allJointsList{10,1} = oneJoint(6,11,CM{6,1},hipPosition,CM{11,1});

%% rthigh and rleg %%
allJointsList{11,1} = oneJoint(11,12,CM{11,1},rKnee, CM{12,1});

%% Right Leg and Right foot %%
allJointsList{12,1} = oneJoint(12,13, CM{12,1}, rAnkle, CM{13,1});

%% RightFoot and RightToes %%
allJointsList{13,1} = oneJoint(13,14,CM{13,1},rMeta,CM{14,1});



end