function ChoosingFile()
    global filteredTable cutFrequencies xShoulders zShoulders xHip zHip TrunkSize isStaticAnalysis; 
    directory = dir('*.tsv');
    possibleFiles = {directory.name};
    [indexChosen, binary] = listdlg('PromptString',{'Select a file.',...
        'Only one file can be selected at a time.',''},...
        'SelectionMode','single','ListString',possibleFiles);
    
    chosenFile = possibleFiles(indexChosen);
    
    
    filteredTableFK = table(); 
    filteredTableGait = table();
    chosenFile = char(chosenFile);
    isStaticAnalysis = false;
    
switch chosenFile
    case "trial_0014_FrontKick_2x.tsv"
        chosenFile = readtsvCustom('trial_0014_FrontKick_2x.tsv');
                   
    case "trial_0011_g05.tsv"
        chosenFile = readtsvCustom('trial_0011_g05.tsv');

    case "trial_0001_static.tsv"  

        isStaticAnalysis = true;
        
       

    colInFiltered = 1; % Position on the new table where we inserted the new filtered coordinates
    for index = 3:3:width(chosenFile)-2 % Will iterate through the x and z of each body part, compile the cutoff frequencies and filtered coordinates into a array and table on global scope

        [final_fc, filtered_coordinates] = ProcessData(100, [chosenFile{:,index}, chosenFile{:,index + 2}]);
        cutFrequencies{1, colInFiltered} = final_fc;
        filteredTable{:,colInFiltered} = filtered_coordinates;
        colInFiltered = colInFiltered + 1;
    end
    filteredTable.Properties.VariableNames = {'Head' 'L_Shoulder' 'L_Elbow' 'L_Wrist' 'R_Shoulder' 'R_Elbow'...
                                                    'R_Wrist' 'L_Hip' 'L_Knee' 'L_Ankle' 'L_Heel' 'L_Meta' 'L_Toe_II' 'R_Hip' 'R_Knee' 'R_Ankle'...
                                                    'R_Heel' 'R_Meta_V' 'R_Toe_II'};
     disp(filteredTable);
                    
    xHead = xShoulders;
    zHead = zShoulders;
    xTrunk = min(xShoulders, xHip) - abs(xShoulders - xHip)/2 ;
    zTrunk = min(zShoulders, zHip) + 0.5*abs(zShoulders - zHip) ;
    xRArm = min(filteredTable{1,10}, filteredTable{1,12}) + 0.564*abs(filteredTable{1,10} - filteredTable{1,12});
    zRArm = min(filteredTable{1,12},filteredTable{1,10}) + 0.564*abs(filteredTable{1,12} - filteredTable{1,10});
    xLArm = min(filteredTable{1,5}, filteredTable{1,3}) + 0.564*(filteredTable{1,3} - filteredTable{1,5});
    zLArm = min(filteredTable{1,6}, filteredTable{1,4})  + 0.564*abs(filteredTable{1,6} - filteredTable{1,4});
    xRForearm = min(filteredTable{1,13}, filteredTable{1,11}) + 0.57*abs(filteredTable{1,11} - filteredTable{1,13});
    zRForearm = min(filteredTable{1,14},filteredTable{1,12}) + 0.57*abs(filteredTable{1,12} - filteredTable{1,14});
    xLForearm = min(filteredTable{1,7}, filteredTable{1,5}) + 0.57*abs(filteredTable{1,5} - filteredTable{1,7});
    zLForearm = min(filteredTable{1,8}, filteredTable{1,6}) + 0.57*abs(filteredTable{1,6} - filteredTable{1,8});
    xRThigh = min(filteredTable{1,29}, filteredTable{1,27}) + 0.567*abs(filteredTable{1,27} - filteredTable{1,29});
    zRThigh = min(filteredTable{1,30}, filteredTable{1,28}) + 0.433*abs(filteredTable{1,28} - filteredTable{1,30});
    xLThigh = min(filteredTable{1,15}, filteredTable{1,17}) + 0.433*abs(filteredTable{1,17} - filteredTable{1,15});
    zLThigh = min(filteredTable{1,18}, filteredTable{1,16}) + 0.567*abs(filteredTable{1,16} - filteredTable{1,18});
    xRLeg = min(filteredTable{1,31}, filteredTable{1,29}) + 0.567*abs(filteredTable{1,29} - filteredTable{1,31});
    zRLeg = min(filteredTable{1,32}, filteredTable{1,30}) + 0.567*abs(filteredTable{1,30} - filteredTable{1,32});
    xLLeg = min(filteredTable{1,17}, filteredTable{1,19}) + 0.433*abs(filteredTable{1,17} - filteredTable{1,19});
    zLLeg = min(filteredTable{1,20}, filteredTable{1,18}) + 0.433*abs(filteredTable{1,18} - filteredTable{1,20});
    xRFoot = min(filteredTable{1,35}, filteredTable{1,31}) + 0.5*abs(filteredTable{1,31} - filteredTable{1,35});
    zRFoot = min(filteredTable{1,36}, filteredTable{1,32}) + 0.5*abs(filteredTable{1,32} - filteredTable{1,36});
    xLFoot = min(filteredTable{1,23}, filteredTable{1,19}) + 0.5*abs(filteredTable{1,19} - filteredTable{1,23});
    zLFoot = min(filteredTable{1,20}, filteredTable{1,24}) + 0.5*abs(filteredTable{1,24} - filteredTable{1,20});
    xRToe = min(filteredTable{1,37}, filteredTable{1,35}) + 0.5*abs(filteredTable{1,35} - filteredTable{1,37});
    zRToe = min(filteredTable{1,36}, filteredTable{1,38}) + 0.5*abs(filteredTable{1,36} - filteredTable{1,38});
    xLToe = min(filteredTable{1,25}, filteredTable{1,23}) + 0.5*abs(filteredTable{1,23} - filteredTable{1,25});
    zLToe = min(filteredTable{1,24}, filteredTable{1,26}) + 0.5*abs(filteredTable{1,26} - filteredTable{1,24});
    

    
=======

switch chosenFile
    case "trial_0014_FrontKick_2x.tsv"
        frontKickFile = readtsvCustom(chosenFile);
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




>>>>>>> Stashed changes
end 
        
    