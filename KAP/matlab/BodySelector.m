
function Body = BodySelector(b)
%ordem: número que identifica o corpo, length, coordenada x da joint
%proximal, coordenada z da joint proximal, coordenada x da joint distal,
%coordenada z da joint distal
%cm
file = readtsvCustom("trial_0011_g05.tsv");

global CM;

xShoulders = (file{:,6} + file{:,15})./2;
zShoulders = (file{:,8} + file{:,17})./2;
xHip = (file{:,24} + file{:,42})./2;
zHip = (file{:,26} + file{:,44})./2;

HeadSize = sqrt((file{1,3} - xShoulders(1))^2 + (file{1,5} - zShoulders(1))^2); 
RArmSize = sqrt((file{1,15} - file{1,18})^2 + (file{1,17} - file{1,20})^2);
LArmSize = sqrt((file{1,6} - file{1,9})^2 + (file{1,8} - file{1,11})^2);
RForearmSize = sqrt((file{1,18} - file{1,21})^2 + (file{1,20} - file{1,23})^2);
LForearmSize = sqrt((file{1,9} - file{1,12})^2 + (file{1,11} - file{1,14})^2);
TrunkSize = sqrt((xShoulders(1) - xHip(1))^2 + (zShoulders(1) - zHip(1))^2);
RThighSize = sqrt((xHip(1) - file{1,45})^2 + (zHip(1) - file{1,47})^2);
LThighSize = sqrt((xHip(1) - file{1,27})^2 + (zHip(1) - file{1,29})^2);
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
        Body.xDjoint = file{:,3};
        Body.zDjoint = file{:,5};
        Body.cmFromProx = 1;
        Body.cmVector = CM{b,1};
        
    case 2
        Body.size = LForearmSize;
        Body.xPjoint = file{:,9};
        Body.zPjoint = file{:,11};
        Body.xDjoint = file{:,12};
        Body.zDjoint = file{:,14};
        Body.cmFromProx = 0.430;
        Body.cmVector = CM{b,1};
        
    case 3
        Body.size = LArmSize;
        Body.xPjoint = file{:,6};
        Body.zPjoint = file{:,8};
        Body.xDjoint = file{:,9};
        Body.zDjoint = file{:,11};
        Body.cmFromProx = 0.436;
        Body.cmVector = CM{b,1};
        
    case 4 
        Body.size = RForearmSize;
        Body.xPjoint = file{:,18};
        Body.zPjoint = file{:,20};
        Body.xDjoint = file{:,21};
        Body.zDjoint = file{:,23};
        Body.cmFromProx = 0.430;
        Body.cmVector = CM{b,1};
        
    case 5
        Body.size = RArmSize;
        Body.xPjoint = file{:,15};
        Body.zPjoint = file{:,17};
        Body.xDjoint = file{:,18};
        Body.zDjoint = file{:,20};
        Body.cmFromProx = 0.436;
        Body.cmVector = CM{b,1};
        
    case 6
        Body.size = TrunkSize;
        Body.xPjoint = xShoulders;
        Body.zPjoint = zShoulders;
        Body.xDjoint = xHip;
        Body.zDjoint = zHip;
        Body.cmFromProx = 0.500;
        Body.cmVector = CM{b,1};
        
    case 7
        Body.size = LThighSize;
        Body.xPjoint = file{:,24};
        Body.zPjoint = file{:,26};
        Body.xDjoint = file{:,27};
        Body.zDjoint = file{:,29};
        Body.cmFromProx = 0.433;
        Body.cmVector = CM{b,1};
        
    case 8
        Body.size = LLegSize;
        Body.xPjoint = file{:,27};
        Body.zPjoint = file{:,29};
        Body.xDjoint = file{:,30};
        Body.zDjoint = file{:,32};
        Body.cmFromProx = 0.433;
        Body.cmVector = CM{b,1};
        
    case 9
        Body.size = LFootSize;
        Body.xPjoint = file{:,30};
        Body.zPjoint = file{:,32};
        Body.xDjoint = file{:,36};
        Body.zDjoint = file{:,38};
        Body.cmFromProx = 0.500;
        Body.cmVector = CM{b,1};
        
    case 10
        Body.size = LToeSize;
        Body.xPjoint = file{:,36};
        Body.zPjoint = file{:,38};
        Body.xDjoint = file{:,39};
        Body.zDjoint = file{:,41};
        Body.cmFromProx = 0.5;
        Body.cmVector = CM{b,1};
        
    case 11
        Body.size = RThighSize;
        Body.xPjoint = file{:,42};
        Body.zPjoint = file{:,44};
        Body.xDjoint = file{:,45};
        Body.zDjoint = file{:,47};
        Body.cmFromProx = 0.433;
        Body.cmVector = CM{b,1};
        
    case 12
        Body.size = RLegSize;
        Body.xPjoint = file{:,45};
        Body.zPjoint = file{:,47};
        Body.xDjoint = file{:,48};
        Body.zDjoint = file{:,50};
        Body.cmFromProx = 0.433;
        Body.cmVector = CM{b,1};
        
    case 13
        Body.size = RFootSize;
        Body.xPjoint = file{:,48};
        Body.zPjoint = file{:,50};
        Body.xDjoint = file{:,54};
        Body.zDjoint = file{:,56};
        Body.cmFromProx = 0.500;
        Body.cmVector = CM{b,1};
        
    case 14
        Body.size = RToeSize;
        Body.xPjoint = file{:,54};
        Body.zPjoint = file{:,56};
        Body.xDjoint = file{:,57};
        Body.zDjoint = file{:,59};
        Body.cmFromProx = 0.500;
        Body.cmVector = CM{b,1};
        
end


end
