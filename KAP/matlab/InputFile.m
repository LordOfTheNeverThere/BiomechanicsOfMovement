clear all;
file = readtsvCustom("trial_0001_static.tsv");
NDriv = 14;
NPts = 1;
modelParameters =[NBodies, NRevJ, NTransJ, NRenRevJ, NTransRevJ, NCamJ, NGrd, NSimp, NDriv, NPts];
global origin;
origin = [file.(33)(1),file.(35)(1)];
global CM;
CM = { [xHead,zHead]; [xLForearm,zLForearm]; [xLArm,zLArm]; [xRForearm,zRForearm]; 
    [xRArm,zRArm]; [xTrunk,zTrunk]; [xLThigh,zLThigh]; [xLLeg,zLLeg]; [xLFoot,zLFoot];
    [xLToe,zLToe]; [xRThigh,zRThigh]; [xRLeg,zRLeg]; [xRFoot,zRFoot]; [xRToe,zRToe]};
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









 fileStatic = fopen('model_static.txt','w');
%{
  fileGait = fopen('model_gait.txt','w');
 fileKick = fopen('model_kick.txt','w'); 
%}
 %% Model Parameters%%

 fprintf(fileStatic,'%6.2f %6.2f %6.2f\r\n',modelParameters);

 %% Centre of Mass %%
for index = 1:length(thetaList)
 fprintf(fileStatic,'%6.2f %6.2f %6.2f\r\n', CM{index,1}(1), CM{index,1}(2), thetaList(index));
end

 %% Joints Data %%

for index = 1:length(allJointsList)
    fprintf(fileStatic,'%6.2f %6.2f %6.2f %6.2f %6.2f\r\n', allJointsList{index,1});
end

 %% Ground Joints %%

 fprintf(fileStatic,'%6.2f\r\n', [0]);

 %% Driver Data %%
 
 for index = 1:length(allDrivers)
    fprintf(fileStatic,'%6.2f %6.2f %6.2f %6.2f %6.2f\r\n', allDrivers{index,1});
end

 %% Points of Interest %%

 fprintf(fileStatic,'%6.2f %6.2f %6.2f\r\n', [1, 0, 0]); % Cm of the head
 
 fprintf(fileStatic,'%6.2f %6.2f\r\n',[12, 1e-7]);
 fprintf(fileStatic,'%6.2f %6.2f %6.2f\r\n', [0, 0.01, 5]);

%{
  fprintf(fileGait,'%6.2f %6.2f\r\n',[12, 1e-7]);
 fprintf(fileKick,'%6.2f %6.2f %6.2f\r\n',[0, 0.01, 5]); 
%}
