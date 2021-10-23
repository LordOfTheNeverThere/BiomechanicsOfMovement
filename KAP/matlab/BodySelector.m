
function Body = BodySelector(b)
%ordem: número que identifica o corpo, length, coordenada x da joint
%proximal, coordenada z da joint proximal, coordenada x da joint distal,
%coordenada z da joint distal
%cm

global CM bodyLenghts filteredTable xShoulders zShoulders xHip zHip;

switch b
    case 1          %head
        Body.size = bodyLenghts(b);
        Body.xPjoint = filteredTable{:,1}(:,1); %{:,1}(:,1) because we have a matrix in each of the 19 columns, one for each marker
        Body.zPjoint = filteredTable{:,1}(:,2);
        Body.xDjoint = xShoulders;
        Body.zDjoint = zShoulders;
        Body.cmFromProx = 1;
        Body.cmVector = CM{b,1};
        
    case 2          %LForearm
        Body.size = bodyLenghts(b);
        Body.xPjoint = filteredTable{:,2}(:,1);
        Body.zPjoint = filteredTable{:,2}(:,2);
        Body.xDjoint = filteredTable{:,3}(:,1);
        Body.zDjoint = filteredTable{:,3}(:,2);
        Body.cmFromProx = 0.430;
        Body.cmVector = CM{b,1};
        
    case 3          %LArm
        Body.size = bodyLenghts(b);
        Body.xPjoint = filteredTable{:,3}(:,1);
        Body.zPjoint = filteredTable{:,3}(:,2);
        Body.xDjoint = filteredTable{:,4}(:,1);
        Body.zDjoint = filteredTable{:,4}(:,2);
        Body.cmFromProx = 0.436;
        Body.cmVector = CM{b,1};
        
    case 4          %RForearm
        Body.size = bodyLenghts(b);
        Body.xPjoint = filteredTable{:,5}(:,1);
        Body.zPjoint = filteredTable{:,5}(:,2);
        Body.xDjoint = filteredTable{:,6}(:,1);
        Body.zDjoint = filteredTable{:,6}(:,2);
        Body.cmFromProx = 0.430;
        Body.cmVector = CM{b,1};
        
    case 5          %RArm
        Body.size = bodyLenghts(b);
        Body.xPjoint = filteredTable{:,6}(:,1);
        Body.zPjoint = filteredTable{:,6}(:,2);
        Body.xDjoint = filteredTable{:,7}(:,1);
        Body.zDjoint = filteredTable{:,7}(:,2);
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
        Body.zPjoint =  zHip;
        Body.xDjoint = filteredTable{:,9}(:,1);
        Body.zDjoint = filteredTable{:,9}(:,2);
        Body.cmFromProx = 0.433;
        Body.cmVector = CM{b,1};
        
    case 8          %LLeg
        Body.size = bodyLenghts(b);
        Body.xPjoint = filteredTable{:,9}(:,1);
        Body.zPjoint = filteredTable{:,9}(:,2);
        Body.xDjoint = filteredTable{:,10}(:,1);
        Body.zDjoint = filteredTable{:,10}(:,2);
        Body.cmFromProx = 0.433;
        Body.cmVector = CM{b,1};
        
    case 9          %LFoot
        Body.size = bodyLenghts(b);
        Body.xPjoint = filteredTable{:,10}(:,1);
        Body.zPjoint = filteredTable{:,10}(:,2);
        Body.xDjoint = filteredTable{:,12}(:,1);
        Body.zDjoint = filteredTable{:,12}(:,2);
        Body.cmFromProx = 0.500;
        Body.cmVector = CM{b,1};
        
    case 10         %LToe
        Body.size = bodyLenghts(b);
        Body.xPjoint = filteredTable{:,12}(:,1);
        Body.zPjoint = filteredTable{:,12}(:,2);
        Body.xDjoint = filteredTable{:,13}(:,1);
        Body.zDjoint = filteredTable{:,13}(:,2);
        Body.cmFromProx = 0.5;
        Body.cmVector = CM{b,1};
        
    case 11         %RThigh
        Body.size = bodyLenghts(b);
        Body.xPjoint = xHip;
        Body.zPjoint = zHip;
        Body.xDjoint = filteredTable{:,15}(:,1);
        Body.zDjoint = filteredTable{:,15}(:,2);
        Body.cmFromProx = 0.433;
        Body.cmVector = CM{b,1};
        
    case 12         %RLeg
        Body.size = bodyLenghts(b);
        Body.xPjoint = filteredTable{:,15}(:,1);
        Body.zPjoint = filteredTable{:,15}(:,2);
        Body.xDjoint = filteredTable{:,16}(:,1);
        Body.zDjoint = filteredTable{:,16}(:,2);
        Body.cmFromProx = 0.433;
        Body.cmVector = CM{b,1};
        
    case 13         %RFoot
        Body.size = bodyLenghts(b);
        Body.xPjoint = filteredTable{:,16}(:,1);
        Body.zPjoint = filteredTable{:,16}(:,2);
        Body.xDjoint = filteredTable{:,18}(:,1);
        Body.zDjoint = filteredTable{:,18}(:,2);
        Body.cmFromProx = 0.500;
        Body.cmVector = CM{b,1};
        
    case 14         %RToe
        Body.size = bodyLenghts(b);
        Body.xPjoint = filteredTable{:,18}(:,1);
        Body.zPjoint = filteredTable{:,18}(:,2);
        Body.xDjoint = filteredTable{:,19}(:,1);
        Body.zDjoint = filteredTable{:,19}(:,2);
        Body.cmFromProx = 0.500;
        Body.cmVector = CM{b,1};
        
end


end
