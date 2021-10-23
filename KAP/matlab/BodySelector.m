
function Body = BodySelector(b)
%ordem: número que identifica o corpo, length, coordenada x da joint
%proximal, coordenada z da joint proximal, coordenada x da joint distal,
%coordenada z da joint distal
%cm

global CM bodyLenghts chosenFile xShoulders zShoulders xHip zHip;
file = readtsvCustom("'" + chosenFile + "'");

switch b
    case 1          %head
        Body.size = bodyLenghts(b);
        Body.xPjoint = xShoulders;
        Body.zPjoint = zShoulders;
        Body.xDjoint = file{:,1};
        Body.zDjoint = file{:,2};
        Body.cmFromProx = 1;
        Body.cmVector = CM{b,1};
        
    case 2          %LForearm
        Body.size = bodyLenghts(b);
        Body.xPjoint = file{:,5};
        Body.zPjoint = file{:,6};
        Body.xDjoint = file{:,7};
        Body.zDjoint = file{:,8};
        Body.cmFromProx = 0.430;
        Body.cmVector = CM{b,1};
        
    case 3          %LArm
        Body.size = bodyLenghts(b);
        Body.xPjoint = file{:,3};
        Body.zPjoint = file{:,4};
        Body.xDjoint = file{:,5};
        Body.zDjoint = file{:,6};
        Body.cmFromProx = 0.436;
        Body.cmVector = CM{b,1};
        
    case 4          %RForearm
        Body.size = bodyLenghts(b);
        Body.xPjoint = file{:,11};
        Body.zPjoint = file{:,12};
        Body.xDjoint = file{:,13};
        Body.zDjoint = file{:,14};
        Body.cmFromProx = 0.430;
        Body.cmVector = CM{b,1};
        
    case 5          %RArm
        Body.size = bodyLenghts(b);
        Body.xPjoint = file{:,9};
        Body.zPjoint = file{:,10};
        Body.xDjoint = file{:,11};
        Body.zDjoint = file{:,12};
        Body.cmFromProx = 0.436;
        Body.cmVector = CM{b,1};
        
    case 6          %Trunk
        Body.size = bodyLenghts(b);
        Body.xPjoint = xShoulders;
        Body.zPjoint = zShoulders;
        Body.xDjoint = xHip;
        Body.zDjoint = zHip;
        Body.cmFromProx = 0.500;
        Body.cmVector = CM{b,1};
        
    case 7          %LThigh
        Body.size = bodyLenghts(b);
        Body.xPjoint = xHip;
        Body.zPjoint = zHip;
        Body.xDjoint = file{:,17};
        Body.zDjoint = file{:,18};
        Body.cmFromProx = 0.433;
        Body.cmVector = CM{b,1};
        
    case 8          %LLeg
        Body.size = bodyLenghts(b);
        Body.xPjoint = file{:,17};
        Body.zPjoint = file{:,18};
        Body.xDjoint = file{:,19};
        Body.zDjoint = file{:,20};
        Body.cmFromProx = 0.433;
        Body.cmVector = CM{b,1};
        
    case 9          %LFoot
        Body.size = bodyLenghts(b);
        Body.xPjoint = file{:,19};
        Body.zPjoint = file{:,20};
        Body.xDjoint = file{:,23};
        Body.zDjoint = file{:,24};
        Body.cmFromProx = 0.500;
        Body.cmVector = CM{b,1};
        
    case 10         %LToe
        Body.size = bodyLenghts(b);
        Body.xPjoint = file{:,23};
        Body.zPjoint = file{:,24};
        Body.xDjoint = file{:,25};
        Body.zDjoint = file{:,26};
        Body.cmFromProx = 0.5;
        Body.cmVector = CM{b,1};
        
    case 11         %RThigh
        Body.size = bodyLenghts(b);
        Body.xPjoint = xHip;
        Body.zPjoint = zHip;
        Body.xDjoint = file{:,29};
        Body.zDjoint = file{:,30};
        Body.cmFromProx = 0.433;
        Body.cmVector = CM{b,1};
        
    case 12         %RLeg
        Body.size = bodyLenghts(b);
        Body.xPjoint = file{:,29};
        Body.zPjoint = file{:,30};
        Body.xDjoint = file{:,31};
        Body.zDjoint = file{:,32};
        Body.cmFromProx = 0.433;
        Body.cmVector = CM{b,1};
        
    case 13         %RFoot
        Body.size = bodyLenghts(b);
        Body.xPjoint = file{:,31};
        Body.zPjoint = file{:,32};
        Body.xDjoint = file{:,35};
        Body.zDjoint = file{:,36};
        Body.cmFromProx = 0.500;
        Body.cmVector = CM{b,1};
        
    case 14         %RToe
        Body.size = bodyLenghts(b);
        Body.xPjoint = file{:,35};
        Body.zPjoint = file{:,36};
        Body.xDjoint = file{:,37};
        Body.zDjoint = file{:,38};
        Body.cmFromProx = 0.500;
        Body.cmVector = CM{b,1};
        
end


end
