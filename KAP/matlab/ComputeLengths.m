function computeLengths()
%myFun - Description
%
% Syntax: output = myFun(input)
%
% Long description

clear all;

global bodyLenghts filteredTableStatic cutFrequenciesStatic origin  xShoulders zShoulders xHip zHip...
    isStaticAnalysis;
filteredTableStatic = table();
staticFile = readtsvCustom("trial_0001_static.tsv");
if isStaticAnalysis
    origin = [staticFile.(33)(1),staticFile.(35)(1)];
end

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
     meanValuesTable.Properties.VariableNames = {'Head_x' 'Head_z' 'L_Shoulder_x' 'L_Shoulder_z' 'L_Elbow_x' 'L_Elbow_z' 'L_Wrist_x' 'L_Wrist_z' 'R_Shoulder_x' 'R_Shoulder_z'  'R_Elbow_x' 'R_Elbow_z'...
                                                    'R_Wrist_x' 'R_Wrist_z' 'L_Hip_x' 'L_Hip_z' 'L_Knee_x' 'L_Knee_z' 'L_Ankle_x' 'L_Ankle_z' 'L_Heel_x' 'L_Heel_z' 'L_Meta_x' 'L_Meta_z' 'L_Toe_II_x' 'L_Toe_II_z'...
                                                    'R_Hip_x' 'R_Hip_z' 'R_Knee_x' 'R_Knee_z' 'R_Ankle_x' 'R_Ankle_z'...
                                                    'R_Heel_x' 'R_Heel_z' 'R_Meta_V_x' 'R_Meta_V_z' 'R_Toe_II_x' 'R_Toe_II_z'};
     

    HeadSize = sqrt((meanValuesTable{1,1} - xShoulders)^2 + (meanValuesTable{1,2} - zShoulders)^2); 
    RArmSize = sqrt((meanValuesTable{1,9} - meanValuesTable{1,11})^2 + (meanValuesTable{1,10} - meanValuesTable{1,12})^2);
    LArmSize = sqrt((meanValuesTable{1,3} - meanValuesTable{1,5})^2 + (meanValuesTable{1,4} - meanValuesTable{1,6})^2);
    RForearmSize = sqrt((meanValuesTable{1,11} - meanValuesTable{1,13})^2 + (meanValuesTable{1,12} - meanValuesTable{1,14})^2);
    LForearmSize = sqrt((meanValuesTable{1,5} - meanValuesTable{1,7})^2 + (meanValuesTable{1,6} - meanValuesTable{1,8})^2);
    TrunkSize = sqrt((xShoulders - xHip)^2 + (zShoulders - zHip)^2);
    RThighSize = sqrt((xHip - meanValuesTable{1,29})^2 + (zHip - meanValuesTable{1,30})^2);
    LThighSize = sqrt((xHip - meanValuesTable{1,17})^2 + (zHip - meanValuesTable{1,18})^2);
    RLegSize = sqrt((meanValuesTable{1,29} - meanValuesTable{1,31})^2 + (meanValuesTable{1,30} - meanValuesTable{1,32})^2);
    LLegSize = sqrt((meanValuesTable{1,17} - meanValuesTable{1,19})^2 + (meanValuesTable{1,18} - meanValuesTable{1,20})^2);
    RFootSize = sqrt((meanValuesTable{1,31} - meanValuesTable{1,35})^2 + (meanValuesTable{1,32} - meanValuesTable{1,36})^2);
    LFootSize = sqrt((meanValuesTable{1,19} - meanValuesTable{1,23})^2 + (meanValuesTable{1,20} - meanValuesTable{1,24})^2);
    RToeSize = sqrt((meanValuesTable{1,35} - meanValuesTable{1,37})^2 + (meanValuesTable{1,36} - meanValuesTable{1,38})^2);
    LToeSize = sqrt((meanValuesTable{1,23} - meanValuesTable{1,25})^2 + (meanValuesTable{1,24} - meanValuesTable{1,26})^2);

bodyLenghts = [HeadSize, LForearmSize, LArmSize, RForearmSize, RArmSize, TrunkSize, LThighSize, LLegSize, LFootSize, LToeSize...
               RThighSize, RLegSize, RFootSize, RToeSize];
 
end