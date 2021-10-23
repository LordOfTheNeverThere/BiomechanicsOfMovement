function ChoosingFile()
c = input('Which file do you want to analyse?');

global filteredTableFK filteredTableGait cutFrequenciesFK cutFrequenciesGait chosenFile; 
filteredTableFK = table(); 
filteredTableGait = table();
chosenFile = char(c);
switch chosenFile
    case "trial_0014_FrontKick_2x.tsv"
        frontKickFile = readtsvCustom('trial_0014_FrontKick_2x.tsv');
        colInFiltered = 1; % Position on the new table where we inserted the new filtered coordinates
        for index = 3:3:width(frontKickFile)-2 % Will iterate through the x and z of each body part, compile the cutoff frequencies and filtered coordinates into a array and table on global scope

            [final_fc, filtered_coordinates] = ProcessData(100, [frontKickFile{:,index}, frontKickFile{:,index + 2}]);
            cutFrequenciesFK{1, colInFiltered} = final_fc;
            filteredTableFK{:,colInFiltered} = filtered_coordinates;
            colInFiltered = colInFiltered + 1;
        end
        filteredTableFK.Properties.VariableNames = {'Head' 'L_Shoulder' 'L_Elbow' 'L_Wrist' 'R_Shoulder' 'R_Elbow'...
                                                        'R_Wrist' 'L_Hip' 'L_Knee' 'L_Ankle' 'L_Heel' 'L_Meta' 'L_Toe_II' 'R_Hip' 'R_Knee' 'R_Ankle'...
                                                        'R_Heel' 'R_Meta_V' 'R_Toe_II'};
       
%         disp(filteredTableFK);
%         disp(cutFrequenciesFK);
%         disp(chosenFile);
                                                  
    case "trial_0011_g05.tsv"
        gaitFile = readtsvCustom('trial_0011_g05.tsv');
        colInFiltered = 1;
        for index = 3:3:width(gaitFile)-2 % Will iterate through the x and z of each body part, compile the cutoff frequencies and filtered coordinates into a array and table on global scope

            [final_fc, filtered_coordinates] = ProcessData(100, [gaitFile{:,index}, gaitFile{:,index + 2}]);
            cutFrequenciesGait{1, colInFiltered} = final_fc;
            filteredTableGait{ :,colInFiltered} = filtered_coordinates;
            colInFiltered = colInFiltered + 1;
        end
        filteredTableGait.Properties.VariableNames = {'Head' 'L_Shoulder' 'L_Elbow' 'L_Wrist' 'R_Shoulder' 'R_Elbow'...
                                                        'R_Wrist' 'L_Hip' 'L_Knee' 'L_Ankle' 'L_Heel' 'L_Meta' 'L_Toe_II' 'R_Hip' 'R_Knee' 'R_Ankle'...
                                                        'R_Heel' 'R_Meta_V' 'R_Toe_II'};
%         disp(filteredTableGait);
%         disp(cutFrequenciesGait);
%         disp(chosenFile);
       
end 
        
    