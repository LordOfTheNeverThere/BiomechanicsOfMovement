function computeLengths()
%myFun - Description
%
% Syntax: output = myFun(input)
%
% Long description

clear all;

global bodyLenghts filteredTableStatic cutFrequenciesStatic origin  xShoulders zShoulders xHip zHip;
filteredTableStatic = table();


staticFile = readtsvCustom("trial_0001_static.tsv");
origin = [staticFile.(33)(1),staticFile.(35)(1)];

colInFiltered = 1; % Position on the new table where we inserted the new filtered coordinates
    for index = 3:3:width(staticFile)-2 % Will iterate through the x and z of each body part, compile the cutoff frequencies and filtered coordinates into a array and table on global scope

        [final_fc, filtered_coordinates] = ProcessData(100, [staticFile{:,index}, staticFile{:,index + 2}]);
        cutFrequenciesStatic{1, colInFiltered} = final_fc;
        filteredTableStatic{ :,colInFiltered} = filtered_coordinates;
        colInFiltered =colInFiltered + 1;
    end
    filteredTableStatic.Properties.VariableNames = {'Head' 'L_Shoulder' 'L_Elbow' 'L_Wrist' 'R_Shoulder' 'R_Elbow'...
                                                    'R_Wrist' 'L_Hip' 'L_Knee' 'L_Ankle' 'L_Heel' 'L_Meta' 'L_Toe_II' 'R_Hip' 'R_Knee' 'R_Ankle'...
                                                    'R_Heel' 'R_Meta_V' 'R_Toe_II'};

    
     xShoulders = mean((filteredTableStatic{:,2}(:,1) + filteredTableStatic{:,5}(:,1))./2);
     zShoulders = mean((filteredTableStatic{:,2}(:,2) + filteredTableStatic{:,5}(1,2))./2);
     xHip = mean((filteredTableStatic{:,8}(:,1) + filteredTableStatic{:,14}(:,1))./2);
     zHip = mean((filteredTableStatic{:,8}(:,2) + filteredTableStatic{:,14}(:,2))./2);
     
     meanValuesTable = table();
     colInMean = 1;
     for markerNumber = 1:width(filteredTableStatic)
         meanValuesTable{1,colInMean} = mean(filteredTableStatic{:,markerNumber}(:,1));
         colInMean = colInMean + 1;
         meanValuesTable{1,colInMean} = mean(filteredTableStatic{:,markerNumber}(:,2));
         colInMean = colInMean + 1;
     end
     meanValuesTable.Properties.VariableNames = {'Head_x' 'Head_z' 'L_Shoulder_x' 'L_Shoulder_z' 'L_Elbow_x' 'L_Elbow_z' 'L_Wrist_x' 'L_Wrist_z' 'R_Shoulder_x' 'R_Shoulder_z' 'R_Elbow_z' 'R_Elbow_x'...
                                                    'R_Wrist_x' 'R_Wrist_z' 'L_Hip_x' 'L_Hip_z' 'L_Knee_x' 'L_Knee_z' 'L_Ankle_x' 'L_Ankle_z' 'L_Heel_x' 'L_Heel_z' 'L_Meta_x' 'L_Meta_z' 'L_Toe_II_x' 'L_Toe_II_z'...
                                                    'R_Hip_x' 'R_Hip' 'R_Knee_x' 'R_Knee' 'R_Ankle_x' 'R_Ankle'...
                                                    'R_Heel_x' 'R_Heel_z' 'R_Meta_V_x' 'R_Meta_V_z' 'R_Toe_II_x' 'R_Toe_II_z'};
     

     
     
end