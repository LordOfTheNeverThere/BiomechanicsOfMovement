clear all;
exfile = [1 2 3 4 5 6 7 8 9 1 2 3; 1 2 3 4 5 6 7 8 9 1 2 3 ];
% disp (exfile);
% disp(length(exfile));

%%Order of Bodies%%

%{
 1-Head; 2-lForArm; 3-lArm; 4-rForArm; 5-rArm; 6-Trunk; 7-lThigh;
8-lLeg; 9-lFoot; 10-lToes; 11-rThigh; 12-rLeg; 13-rFoot; 14-rToes 
%}

%%%%%%%%%%%%%%%%%


file = readtsvCustom("trial_0001_static.tsv");


global NBodies 
NBodies = 14;
NRevJ = 13;
NTransJ = 0;
NRenRevJ = 0;
NTransRevJ = 0;
NCamJ = 0;
NGrd = 0; %encastramentos
NSimp = 0; 
global NDriv 
NDriv = 14;
NPts = 1;

modelParameters =[NBodies, NRevJ, NTransJ, NRenRevJ, NTransRevJ, NCamJ, NGrd, NSimp, NDriv, NPts];

global origin;
origin = [file.(33)(1),file.(35)(1)];
xShoulders = (file{1,6} + file{1,15})/2;
zShoulders = (file{1,8} + file{1,17})/2;
xHip = (file{1,24} + file{1,42})/2;
zHip = (file{1,26} + file{1,44})/2;

HeadSize = sqrt((file{1,3} - xShoulders)^2 + (file{1,5} - zShoulders)^2); 
RArmSize = sqrt((file{1,15} - file{1,18})^2 + (file{1,17} - file{1,20})^2);
LArmSize = sqrt((file{1,6} - file{1,9})^2 + (file{1,8} - file{1,11})^2);
RForearmSize = sqrt((file{1,18} - file{1,21})^2 + (file{1,20} - file{1,23})^2);
LForearmSize = sqrt((file{1,9} - file{1,12})^2 + (file{1,11} - file{1,14})^2);
TrunkSize = sqrt((xShoulders - xHip)^2 + (zShoulders - zHip)^2);
RThighSize = sqrt((xHip - file{1,45})^2 + (zHip - file{1,47})^2);
LThighSize = sqrt((xHip - file{1,27})^2 + (zHip - file{1,29})^2);
RLegSize = sqrt((file{1,45} - file{1,48})^2 + (file{1,47} - file{1,50})^2);
LLegSize = sqrt((file{1,27} - file{1,30})^2 + (file{1,29} - file{1,32})^2);
RFootSize = sqrt((file{1,48} - file{1,54})^2 + (file{1,50} - file{1,56})^2);
LFootSize = sqrt((file{1,30} - file{1,36})^2 + (file{1,32} - file{1,38})^2);
RToeSize = sqrt((file{1,54} - file{1,57})^2 + (file{1,56} - file{1,59})^2);
LToeSize = sqrt((file{1,36} - file{1,39})^2 + (file{1,38} - file{1,41})^2);


%calculo dos cm

xHead = xShoulders;
zHead = zShoulders;
xTrunk = xShoulders - abs(xShoulders - xHip)/2 ;
zTrunk = zShoulders - TrunkSize/2 ;
xRArm = file{1,15} + 0.564*(file{1,18} - file{1,15});
zRArm = file{1,20} + 0.564*(file{1,17} - file{1,20});
xLArm = file{1,9} + 0.564*(file{1,6} - file{1,9});
zLArm = file{1,11} + 0.564*(file{1,8} - file{1,11});
xRForearm = file{1,21} + 0.57*(file{1,18} - file{1,21});
zRForearm = file{1,23} + 0.57*(file{1,20} - file{1,23});
xLForearm = file{1,12} + 0.57*(file{1,9} - file{1,12});
zLForearm = file{1,14} + 0.57*(file{1,11} - file{1,14});
xRThigh = file{1,45} + 0.567*(file{1,42} - file{1,45});
zRThigh = file{1,47} + 0.433*(file{1,44} - file{1,47});
xLThigh = file{1,24} + 0.433*(file{1,27} - file{1,24});
zLThigh = file{1,29} + 0.567*(file{1,26} - file{1,29});
xRLeg = file{1,48} + 0.567*(file{1,45} - file{1,48});
zRLeg = file{1,50} + 0.567*(file{1,29} - file{1,50});
xLLeg = file{1,27} + 0.433*(file{1,27} - file{1,30});
zLLeg = file{1,32} + 0.433*(file{1,29} - file{1,32});
xRFoot = file{1,54} + 0.5*(file{1,48} - file{1,54});
zRFoot = file{1,56} + 0.5*(file{1,50} - file{1,56});
xLFoot = file{1,36} + 0.5*(file{1,30} - file{1,36});
zLFoot = file{1,38} + 0.5*(file{1,32} - file{1,38});
xRToe = file{1,57} + 0.5*(file{1,54} - file{1,57});
zRToe = file{1,56} + 0.5*(file{1,59} - file{1,56});
xLToe = file{1,39} + 0.5*(file{1,36} - file{1,39});
zLToe = file{1,38} + 0.5*(file{1,41} - file{1,38});

global CM;
CM = { [xHead,zHead]; [xLForearm,zLForearm]; [xLArm,zLArm]; [xRForearm,zRForearm]; 
    [xRArm,zRArm]; [xTrunk,zTrunk]; [xLThigh,zLThigh]; [xLLeg,zLLeg]; [xLFoot,zLFoot];
    [xLToe,zLToe]; [xRThigh,zRThigh]; [xRLeg,zRLeg]; [xRFoot,zRFoot]; [xRToe,zRToe]};


%{
 1-Head; 2-lForArm; 3-lArm; 4-rForArm; 5-rArm; 6-Trunk; 7-lThigh;
8-lLeg; 9-lFoot; 10-lToes; 11-rThigh; 12-rLeg; 13-rFoot; 14-rToes 
%}

global head lForArm lArm rForArm rArm trunk lThigh lLeg lFoot lToes rThigh rLeg rFoot rToes
head = BodySelector(1);
lForArm = BodySelector(2);
lArm = BodySelector(3);
rForArm = BodySelector(4);
rArm = BodySelector(5);
trunk = BodySelector(6);
lThigh = BodySelector(7);
lLeg = BodySelector(8);
lFoot = BodySelector(9);
lToes = BodySelector(10);
rThigh = BodySelector(11);
rLeg = BodySelector(12);
rFoot = BodySelector(13);
rToes = BodySelector(14);

[~, headTheta, ~] = driverStream(head);
[~, lForArmTheta, ~] = driverStream(lForArm);
[~, lArmTheta, ~] = driverStream(lArm);
[~, rForArmTheta, ~] = driverStream(rForArm);
[~, rArmTheta, ~] = driverStream(rArm);
[~, trunkTheta, ~] = driverStream(trunk);
[~, lThighTheta, ~] = driverStream(lThigh);
[~, lLegTheta, ~] = driverStream(lLeg);
[~, lFootTheta, ~] = driverStream(lFoot);
[~, lToesTheta, ~] = driverStream(lToes);
[~, rThighTheta, ~] = driverStream(rThigh);
[~, rLegTheta, ~] = driverStream(rLeg);
[~, rFootTheta, ~] = driverStream(rFoot);
[~, rToesTheta, ~] = driverStream(rToes);

thetaList = [headTheta(1), lForArmTheta(1), lArmTheta(1), rForArmTheta(1), rArmTheta(1), trunkTheta(1), lThighTheta(1), lLegTheta(1), lFootTheta(1), lToesTheta(1), rThighTheta(1), rLegTheta(1), rFootTheta(1), rToesTheta(1)];
%List with all the initial drivers
 allJointsList = allJoints(file, [xShoulders, zShoulders], [xHip, zHip]);
 allDrivers = drivers();









 %% Starting to write the new file model.txt%%
 fileStatic = fopen('model_static.txt','w');

%{
  fileGait = fopen('model_gait.txt','w');
 fileKick = fopen('model_kick.txt','w'); 
%}



 %% Model Parameters%%

 fprintf(fileStatic,'%6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f\r\n',modelParameters);

 %% Centre of Mass %%
for index = 1:length(thetaList)
 fprintf(fileStatic,'%6.2f %6.2f %6.2f\r\n', CM{index,1}(1), CM{index,1}(2), thetaList(index));
end

 %% Joints Data %%

for index = 1:length(allJointsList)
    fprintf(fileStatic,'%6.2f %6.2f %6.2f %6.2f %6.2f %6.2f\r\n', allJointsList{index,1});
end



 %% Driver Data %%
 
 for index = 1:length(allDrivers)
    fprintf(fileStatic,'%6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f\r\n', allDrivers{index,1});
end

 %% Points of Interest %%

 fprintf(fileStatic,'%6.2f %6.2f %6.2f\r\n', [1, 0, 0]); % Cm of the head
 
 %% End of the files %%
 fprintf(fileStatic,'%6.2f %6.10f\r\n',[12, 0.0000001]);
 fprintf(fileStatic,'%6.2f %6.2f %6.2f\r\n', [0, 0.01, 5]);

%{
  fprintf(fileGait,'%6.2f %6.10f\r\n',[12, 1e-7]);
 fprintf(fileGait,'%6.2f %6.2f %6.2f\r\n', [0, 0.01, 5]);
 fprintf(fileKick,'%6.2f %6.10f\r\n',[12, 1e-7]);
 fprintf(fileKick,'%6.2f %6.2f %6.2f\r\n',[0, 0.01, 5]); 
%}




