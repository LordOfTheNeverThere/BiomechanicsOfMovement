clc
exfile = [1 2 3 4 5 6 7 8 9 1 2 3; 1 2 3 4 5 6 7 8 9 1 2 3 ];
% disp (exfile);
% disp(length(exfile));

%%Order of Bodies%%

%{
 1-Head; 2-lForArm; 3-lArm; 4-rForArm; 5-rArm; 6-Trunk; 7-lThigh;
8-lLeg; 9-lFoot; 10-lToes; 11-rThigh; 12-rLeg; 13-rFoot; 14-rToes 
%}

%%%%%%%%%%%%%%%%%


file = readtsvCustom("trial_0011_g05.tsv");


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
NDriv = 13;
NPts = 13;

global origin
origin = [file{1,30}, file{1,32}];

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


CM = { {xHead,zHead}; {xLForearm,zLForearm}; {xLArm,zLArm}; {xRForearm,zRForearm}; 
    {xRArm,zRArm}; {xTrunk,zTrunk}; {xLThigh,zLThigh}; {xLLeg,zLLeg}; {xLFoot,zLFoot};
    {xLToe,zLToe}; {xRThigh,zRThigh}; {xRLeg,zRLeg}; {xRFoot,zRFoot}; {xRToe,zRToe}};


%{
 1-Head; 2-lForArm; 3-lArm; 4-rForArm; 5-rArm; 6-Trunk; 7-lThigh;
8-lLeg; 9-lFoot; 10-lToes; 11-rThigh; 12-rLeg; 13-rFoot; 14-rToes 
%}
