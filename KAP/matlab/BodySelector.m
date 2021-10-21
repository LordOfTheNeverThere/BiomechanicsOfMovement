
function Body = BodySelector(b)
%ordem: número que identifica o corpo, length, coordenada x da joint
%proximal, coordenada z da joint proximal, coordenada x da joint distal,
%coordenada z da joint distal
%cm
file = readtsvCustom("trial_0011_g05.tsv");

global CM;

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




switch b
    case 1
        Body.size = HeadSize;
        Body.xPjoint = xShoulders;
        Body.zPjoint = zShoulders;
        Body.xDjoint = file{1,3};
        Body.zDJoint = file{1,5};
        Body.cmFromProx = 1;
        Body.cmVector = CM{b,1};
        
    case 2
        Body.size = LForearmSize;
        Body.xPjoint = file{1,9};
        Body.zPjoint = file{1,11};
        Body.xDjoint = file{1,12};
        Body.zDJoint = file{1,14};
        Body.cmFromProx = 0.430;
        Body.cmVector = CM{b,1};
        
    case 3
        Body.size = LArmSize;
        Body.xPjoint = file{1,6};
        Body.zPjoint = file{1,8};
        Body.xDjoint = file{1,9};
        Body.zDJoint = file{1,11};
        Body.cmFromProx = 0.436;
        Body.cmVector = CM{b,1};
        
    case 4 
        Body.size = RForearmSize;
        Body.xPjoint = file{1,18};
        Body.zPjoint = file{1,20};
        Body.xDjoint = file{1,21};
        Body.zDJoint = file{1,23};
        Body.cmFromProx = 0.430;
        Body.cmVector = CM{b,1};
        
    case 5
        Body.size = RArmSize;
        Body.xPjoint = file{1,15};
        Body.zPjoint = file{1,17};
        Body.xDjoint = file{1,18};
        Body.zDJoint = file{1,20};
        Body.cmFromProx = 0.436;
        Body.cmVector = CM{b,1};
        
    case 6
        Body.size = TrunkSize;
        Body.xPjoint = xShoulders;
        Body.zPjoint = zShoulders;
        Body.xDjoint = xHip;
        Body.zDJoint = zHip;
        Body.cmFromProx = 0.500;
        Body.cmVector = CM{b,1};
        
    case 7
        Body.size = LThighSize;
        Body.xPjoint = file{1,24};
        Body.zPjoint = file{1,26};
        Body.xDjoint = file{1,27};
        Body.zDJoint = file{1,29};
        Body.cmFromProx = 0.433;
        Body.cmVector = CM{b,1};
        
    case 8
        Body.size = LLegSize;
        Body.xPjoint = file{1,27};
        Body.zPjoint = file{1,29};
        Body.xDjoint = file{1,30};
        Body.zDJoint = file{1,32};
        Body.cmFromProx = 0.433;
        Body.cmVector = CM{b,1};
        
    case 9
        Body.size = LFootSize;
        Body.xPjoint = file{1,30};
        Body.zPjoint = file{1,32};
        Body.xDjoint = file{1,36};
        Body.zDJoint = file{1,38};
        Body.cmFromProx = 0.500;
        Body.cmVector = CM{b,1};
        
    case 10
        Body.size = LToeSize;
        Body.xPjoint = file{1,36};
        Body.zPjoint = file{1,38};
        Body.xDjoint = file{1,39};
        Body.zDJoint = file{1,41};
        Body.cmFromProx = 0.5;
        Body.cmVector = CM{b,1};
        
    case 11
        Body.size = RThighSize;
        Body.xPjoint = file{1,42};
        Body.zPjoint = file{1,44};
        Body.xDjoint = file{1,45};
        Body.zDJoint = file{1,47};
        Body.cmFromProx = 0.433;
        Body.cmVector = CM{b,1};
        
    case 12
        Body.size = RLegSize;
        Body.xPjoint = file{1,45};
        Body.zPjoint = file{1,47};
        Body.xDjoint = file{1,48};
        Body.zDJoint = file{1,50};
        Body.cmFromProx = 0.433;
        Body.cmVector = CM{b,1};
        
    case 13
        Body.size = RFootSize;
        Body.xPjoint = file{1,48};
        Body.zPjoint = file{1,50};
        Body.xDjoint = file{1,54};
        Body.zDJoint = file{1,56};
        Body.cmFromProx = 0.500;
        Body.cmVector = CM{b,1};
        
    case 14
        Body.size = RToeSize;
        Body.xPjoint = file{1,54};
        Body.zPjoint = file{1,56};
        Body.xDjoint = file{1,57};
        Body.zDJoint = file{1,59};
        Body.cmFromProx = 0.500;
        Body.cmVector = CM{b,1};
        
end


end
