
function Body = BodySelector(b)
%ordem: número que identifica o corpo, length, coordenada x da joint
%proximal, coordenada z da joint proximal, coordenada x da joint distal,
%coordenada z da joint distal
%cm
file = readtsvCustom("trial_0011_g05.tsv");

global CM bodyLenghts;






switch b
    case 1
        Body.size = bodyLenghts(b);
        Body.xPjoint = xShoulders;
        Body.zPjoint = zShoulders;
        Body.xDjoint = file{:,3};
        Body.zDjoint = file{:,5};
        Body.cmFromProx = 1;
        Body.cmVector = CM{b,1};
        
    case 2
        Body.size = bodyLenghts(b);
        Body.xPjoint = file{:,9};
        Body.zPjoint = file{:,11};
        Body.xDjoint = file{:,12};
        Body.zDjoint = file{:,14};
        Body.cmFromProx = 0.430;
        Body.cmVector = CM{b,1};
        
    case 3
        Body.size = bodyLenghts(b);
        Body.xPjoint = file{:,6};
        Body.zPjoint = file{:,8};
        Body.xDjoint = file{:,9};
        Body.zDjoint = file{:,11};
        Body.cmFromProx = 0.436;
        Body.cmVector = CM{b,1};
        
    case 4 
        Body.size = bodyLenghts(b);
        Body.xPjoint = file{:,18};
        Body.zPjoint = file{:,20};
        Body.xDjoint = file{:,21};
        Body.zDjoint = file{:,23};
        Body.cmFromProx = 0.430;
        Body.cmVector = CM{b,1};
        
    case 5
        Body.size = bodyLenghts(b);
        Body.xPjoint = file{:,15};
        Body.zPjoint = file{:,17};
        Body.xDjoint = file{:,18};
        Body.zDjoint = file{:,20};
        Body.cmFromProx = 0.436;
        Body.cmVector = CM{b,1};
        
    case 6
        Body.size = bodyLenghts(b);
        Body.xPjoint = xShoulders;
        Body.zPjoint = zShoulders;
        Body.xDjoint = xHip;
        Body.zDjoint = zHip;
        Body.cmFromProx = 0.500;
        Body.cmVector = CM{b,1};
        
    case 7
        Body.size = bodyLenghts(b);
        Body.xPjoint = file{:,24};
        Body.zPjoint = file{:,26};
        Body.xDjoint = file{:,27};
        Body.zDjoint = file{:,29};
        Body.cmFromProx = 0.433;
        Body.cmVector = CM{b,1};
        
    case 8
        Body.size = bodyLenghts(b);
        Body.xPjoint = file{:,27};
        Body.zPjoint = file{:,29};
        Body.xDjoint = file{:,30};
        Body.zDjoint = file{:,32};
        Body.cmFromProx = 0.433;
        Body.cmVector = CM{b,1};
        
    case 9
        Body.size = bodyLenghts(b);
        Body.xPjoint = file{:,30};
        Body.zPjoint = file{:,32};
        Body.xDjoint = file{:,36};
        Body.zDjoint = file{:,38};
        Body.cmFromProx = 0.500;
        Body.cmVector = CM{b,1};
        
    case 10
        Body.size = bodyLenghts(b);
        Body.xPjoint = file{:,36};
        Body.zPjoint = file{:,38};
        Body.xDjoint = file{:,39};
        Body.zDjoint = file{:,41};
        Body.cmFromProx = 0.5;
        Body.cmVector = CM{b,1};
        
    case 11
        Body.size = bodyLenghts(b);
        Body.xPjoint = file{:,42};
        Body.zPjoint = file{:,44};
        Body.xDjoint = file{:,45};
        Body.zDjoint = file{:,47};
        Body.cmFromProx = 0.433;
        Body.cmVector = CM{b,1};
        
    case 12
        Body.size = bodyLenghts(b);
        Body.xPjoint = file{:,45};
        Body.zPjoint = file{:,47};
        Body.xDjoint = file{:,48};
        Body.zDjoint = file{:,50};
        Body.cmFromProx = 0.433;
        Body.cmVector = CM{b,1};
        
    case 13
        Body.size = bodyLenghts(b);
        Body.xPjoint = file{:,48};
        Body.zPjoint = file{:,50};
        Body.xDjoint = file{:,54};
        Body.zDjoint = file{:,56};
        Body.cmFromProx = 0.500;
        Body.cmVector = CM{b,1};
        
    case 14
        Body.size = bodyLenghts(b);
        Body.xPjoint = file{:,54};
        Body.zPjoint = file{:,56};
        Body.xDjoint = file{:,57};
        Body.zDjoint = file{:,59};
        Body.cmFromProx = 0.500;
        Body.cmVector = CM{b,1};
        
end


end
