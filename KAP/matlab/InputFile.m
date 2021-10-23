clear all;

%%Order of Bodies%%

%{
 1-Head; 2-lForArm; 3-lArm; 4-rForArm; 5-rArm; 6-Trunk; 7-lThigh;
8-lLeg; 9-lFoot; 10-lToes; 11-rThigh; 12-rLeg; 13-rFoot; 14-rToes 
%}

%%%%%%%%%%%%%%%%%

global NBodies NDriv isStaticAnalysis isGaitAnalysis isKickAnalysis;
NBodies = 14;
NRevJ = 13;
NTransJ = 0;
NRenRevJ = 0;
NTransRevJ = 0;
NCamJ = 0;
NGrd = 0; %encastramentos
NSimp = 0; 
NDriv = 16;
NPts = 0;

modelParameters =[NBodies, NRevJ, NTransJ, NRenRevJ, NTransRevJ, NCamJ, NGrd, NSimp, NDriv, NPts];

computeLengths();


%% Aviso os CM devem ser calculados apartir dos dados filtrados de cad simulação%%

% global CM;
% CM = { [xHead,zHead]; [xLForearm,zLForearm]; [xLArm,zLArm]; [xRForearm,zRForearm]; 
%     [xRArm,zRArm]; [xTrunk,zTrunk]; [xLThigh,zLThigh]; [xLLeg,zLLeg]; [xLFoot,zLFoot];
%     [xLToe,zLToe]; [xRThigh,zRThigh]; [xRLeg,zRLeg]; [xRFoot,zRFoot]; [xRToe,zRToe]};


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

 if isStaticAnalysis
  modelFile = fopen('model_static.txt','w');
 elseif isGaitAnalysis
  modelFile = fopen('model_gait_group7_2turn.txt','w');
 else
  modelFile = fopen('model_fkick_group7_2turn.txt','w');
 end


 %% Model Parameters%%

 fprintf(modelFile,'%6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f\r\n',modelParameters);

 %% Centre of Mass %%
for index = 1:length(thetaList)
 fprintf(modelFile,'%6.2f %6.2f %6.2f\r\n', CM{index,1}(1), CM{index,1}(2), thetaList(index));
end

 %% Joints Data %%

for index = 1:length(allJointsList)
    fprintf(modelFile,'%6.2f %6.2f %6.2f %6.2f %6.2f %6.2f\r\n', allJointsList{index,1});
end



 %% Driver Data %%
 
 for index = 1:length(allDrivers)
    fprintf(modelFile,'%6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f\r\n', allDrivers{index,1});
end

%  %% Points of Interest %%
% 
%  fprintf(modelFile,'%6.2f %6.2f %6.2f\r\n', [1, 0, 0]); % Cm of the head
 
 %% End of the files %%
 fprintf(modelFile,'%6.2f %6.10f\r\n',[12, 0.0000001]);
 fprintf(modelFile,'%6.2f %6.2f %6.2f\r\n', [0, 0.01, 5]);






