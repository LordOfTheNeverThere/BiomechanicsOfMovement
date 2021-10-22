function computeLengths()
%myFun - Description
%
% Syntax: output = myFun(input)
%
% Long description

clear all;

global bodyLenghts filteredTableStatic cutFrequenciesStatic origin;
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

end