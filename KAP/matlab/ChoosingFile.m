function ChoosingFile()
    global filteredTable cutFrequencies xShoulders zShoulders xHip zHip isStaticAnalysis isGaitAnalysis isKickAnalysis CM...
        xShouldersVector zShouldersVector xHipVector zHipVector; 
    directory = dir('*.tsv');
    possibleFiles = {directory.name};
    [indexChosen, binary] = listdlg('PromptString',{'Select a file.',...
        'Only one file can be selected at a time.',''},...
        'SelectionMode','single','ListString',possibleFiles);
    
    chosenFile = possibleFiles(indexChosen);
    
    
   

     
    chosenFile = char(chosenFile);
    isStaticAnalysis = false; isGaitAnalysis =false; isKickAnalysis =false;
    
    switch chosenFile
        case "trial_0014_FrontKick_2x.tsv"
            filteredTable = table();
            isKickAnalysis = true;
            chosenFile = readtsvCustom('trial_0014_FrontKick_2x.tsv');
            localOrigin = [chosenFile{1,33}, chosenFile{1,35}];

        case "trial_0011_g05.tsv"
            filteredTable = table();
            isGaitAnalysis = true;
            chosenFile = readtsvCustom('trial_0011_g05.tsv');
            localOrigin = [chosenFile{1,33}, chosenFile{1,35}];

        case "trial_0001_static.tsv"  
            isStaticAnalysis = true;
    end     
       
    if ~isStaticAnalysis
        colInFiltered = 1; % Position on the new table where we inserted the new filtered coordinates
        for index = 3:3:width(chosenFile)-2 % Will iterate through the x and z of each body part, compile the cutoff frequencies and filtered coordinates into a array and table on global scope

            [final_fc, filtered_coordinates] = ProcessData(100, [chosenFile{:,index}, chosenFile{:,index + 2}], localOrigin);
            cutFrequencies{1, colInFiltered} = final_fc;
            filteredTable{:,colInFiltered} = filtered_coordinates;
            colInFiltered = colInFiltered + 1;
        end
        filteredTable.Properties.VariableNames = {'Head' 'L_Shoulder' 'L_Elbow' 'L_Wrist' 'R_Shoulder' 'R_Elbow'...
                                                        'R_Wrist' 'L_Hip' 'L_Knee' 'L_Ankle' 'L_Heel' 'L_Meta' 'L_Toe_II' 'R_Hip' 'R_Knee' 'R_Ankle'...
                                                        'R_Heel' 'R_Meta_V' 'R_Toe_II'};
    end
                                                
    xShouldersVector = (filteredTable{:,2}(:,1) + filteredTable{:,5}(:,1))./2;
    zShouldersVector = (filteredTable{:,2}(:,2) + filteredTable{:,5}(:,2))./2;
    xHipVector = (filteredTable{:,8}(:,1) + filteredTable{:,14}(:,1))./2;
    zHipVector = (filteredTable{:,8}(:,2) + filteredTable{:,14}(:,2))./2;
     
    xHead = xShoulders;
    zHead = zShoulders;
    xTrunk = min(xShoulders, xHip) - abs(xShoulders - xHip)/2 ;
    zTrunk = min(zShoulders, zHip) + 0.5*abs(zShoulders - zHip) ;
    xRArm = min(filteredTable{:,5}(1,1), filteredTable{:,6}(1,1)) + 0.564*abs(filteredTable{:,5}(1,1) - filteredTable{:,6}(1,1));
    zRArm = min(filteredTable{:,6}(1,2),filteredTable{:,5}(1,2)) + 0.564*abs(filteredTable{:,6}(1,2) - filteredTable{:,6}(1,2));
    xLArm = min(filteredTable{:,3}(1,1), filteredTable{:,2}(1,1)) + 0.564*(filteredTable{:,2}(1,1) - filteredTable{:,3}(1,1));
    zLArm = min(filteredTable{:,3}(1,2), filteredTable{:,2}(1,2))  + 0.564*abs(filteredTable{:,3}(1,2) - filteredTable{:,2}(1,2));
    xRForearm = min(filteredTable{:,7}(1,1), filteredTable{:,6}(1,1)) + 0.57*abs(filteredTable{:,6}(1,1) - filteredTable{:,7}(1,1));
    zRForearm = min(filteredTable{:,7}(1,2),filteredTable{:,6}(1,2)) + 0.57*abs(filteredTable{:,6}(1,2) - filteredTable{:,7}(1,2));
    xLForearm = min(filteredTable{:,4}(1,1), filteredTable{:,3}(1,1)) + 0.57*abs(filteredTable{:,3}(1,1) - filteredTable{:,4}(1,1));
    zLForearm = min(filteredTable{:,4}(1,2), filteredTable{:,3}(1,2)) + 0.57*abs(filteredTable{:,3}(1,2) - filteredTable{:,4}(1,2));
    xRThigh = min(filteredTable{:,15}(1,1), filteredTable{:,14}(1,1)) + 0.567*abs(filteredTable{:,14}(1,1) - filteredTable{:,15}(1,1));
    zRThigh = min(filteredTable{:,15}(1,2), filteredTable{:,14}(1,2)) + 0.433*abs(filteredTable{:,14}(1,2) - filteredTable{:,15}(1,2));
    xLThigh = min(filteredTable{:,8}(1,1), filteredTable{:,9}(1,1)) + 0.433*abs(filteredTable{:,9}(1,1) - filteredTable{:,8}(1,1));
    zLThigh = min(filteredTable{:,8}(1,2), filteredTable{:,9}(1,2)) + 0.567*abs(filteredTable{:,9}(1,2) - filteredTable{:,8}(1,2));
    xRLeg = min(filteredTable{:,16}(1,1), filteredTable{:,15}(1,1)) + 0.567*abs(filteredTable{:,15}(1,1) - filteredTable{:,16}(1,1));
    zRLeg = min(filteredTable{:,16}(1,2), filteredTable{:,15}(1,2)) + 0.567*abs(filteredTable{:,15}(1,2) - filteredTable{:,16}(1,2));
    xLLeg = min(filteredTable{:,9}(1,1), filteredTable{:,10}(1,1)) + 0.433*abs(filteredTable{:,9}(1,1) - filteredTable{:,10}(1,1));
    zLLeg = min(filteredTable{:,9}(1,2), filteredTable{:,10}(1,2)) + 0.433*abs(filteredTable{:,9}(1,2) - filteredTable{:,10}(1,2));
    xRFoot = min(filteredTable{:,18}(1,1), filteredTable{:,16}(1,1)) + 0.5*abs(filteredTable{:,16}(1,1) - filteredTable{:,18}(1,1));
    zRFoot = min(filteredTable{:,18}(1,2), filteredTable{:,16}(1,2)) + 0.5*abs(filteredTable{:,16}(1,2) - filteredTable{:,18}(1,2));
    xLFoot = min(filteredTable{:,12}(1,1), filteredTable{:,10}(1,1)) + 0.5*abs(filteredTable{:,12}(1,1) - filteredTable{:,10}(1,1));
    zLFoot = min(filteredTable{:,12}(1,2), filteredTable{:,10}(1,2)) + 0.5*abs(filteredTable{:,12}(1,2) - filteredTable{:,10}(1,2));
    xRToe = min(filteredTable{:,18}(1,1), filteredTable{:,19}(1,1)) + 0.5*abs(filteredTable{:,18}(1,1) - filteredTable{:,19}(1,1));
    zRToe = min(filteredTable{:,18}(1,2), filteredTable{:,19}(1,2)) + 0.5*abs(filteredTable{:,18}(1,2) - filteredTable{:,19}(1,2));
    xLToe = min(filteredTable{:,12}(1,1), filteredTable{:,13}(1,1)) + 0.5*abs(filteredTable{:,12}(1,1) - filteredTable{:,13}(1,1));
    zLToe = min(filteredTable{:,12}(1,2), filteredTable{:,13}(1,2)) + 0.5*abs(filteredTable{:,12}(1,2) - filteredTable{:,13}(1,2));

    CM = { [xHead,zHead]; [xLForearm,zLForearm]; [xLArm,zLArm]; [xRForearm,zRForearm]; 
    [xRArm,zRArm]; [xTrunk,zTrunk]; [xLThigh,zLThigh]; [xLLeg,zLLeg]; [xLFoot,zLFoot];
    [xLToe,zLToe]; [xRThigh,zRThigh]; [xRLeg,zRLeg]; [xRFoot,zRFoot]; [xRToe,zRToe]};
    
end 
        
    
