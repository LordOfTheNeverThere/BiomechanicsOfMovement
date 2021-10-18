clc
exfile = [1 2 3 4 5 6 7 8 9 1 2 3; 1 2 3 4 5 6 7 8 9 1 2 3 ];
% disp (exfile);
% disp(length(exfile));

NBodies = 0;
i = 3;
while i <= length(exfile) 
    NBodies = NBodies + 1 ;
    i = i + 3 ;
end
disp (NBodies);

NRevJ = 13;
NTransJ = 0;
NRenRevJ = 0;
NTransRevJ = 0;
NCamJ = 0;
NGrd = 0; %encastramentos
NSimp = 0; 
NDriv = 13;
NPts = 13;

xShoulders = (file(1,6) + file(1,15))/2;
zShoulders = (file(1,8) + file(1,17))/2;
xHip = (file(1,24) + file(1,42))/2;
zHip = (file(1,26) + file(1,44))/2;

HeadSize = sqrt((file(1,3) - xShoulders)^2 + (file(1,5) - zShoulders^2)); 
RArmSize = sqrt((file(1,15) - file(1,18))^2 + (file(1,17) - file(1,20))^2);
LArmSize = sqrt((file(1,6) - file(1,9))^2 + (file(1,8) - file(1,11))^2);
RForearmSize = sqrt((file(1,18) - file(1,21))^2 + (file(1,20) - file(1,23))^2);
LForearmSize = sqrt((file(1,9) - file(1,12))^2 + (file(1,11) - file(1,14))^2);
TrunkSize = sqrt((xShoulders - xHip)^2 + (zShoulders - zHip)^2);
RThighSize = sqrt((xHip - file(1,45))^2 + (zHip - file(1,47))^2);
LThighSize = sqrt((xHip - file(1,27))^2 + (zHip - file(1,29))^2);
RLegSize = sqrt((file(1,45) - file(1,48))^2 + (file(1,47) - file(1,50))^2)
LLegSize = sqrt((file(1,27) - file(1,30))^2 + (file(1,29) - file(1,32))^2)
%??? size do pé

RToe = sqrt((file(1,54) - file(1,57))^2 + (file(1,56) - file(1,59))^2);
LToe = sqrt((file(1,36) - file(1,39))^2 + (file(1,38) - file(1,41))^2);


%calculo dos cm

xHead = file(1,3);
zHaed = file(1,5);

