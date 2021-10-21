 function allDrivers = drivers()
 %drivers - Will create the arrays for the inputfile, as well as the driver_00#.txt file
 %
 % Syntax: output = myFun(input)
 %
 % Long description


 %% Deleting previously made files





 %% Bodies
   allDrivers{14, 1} ={[]};
   global head lForArm lArm rForArm rArm trunk lThigh lLeg lFoot lToes rThigh rLeg rFoot rToes



   %% Driver Feeder
   
   [headAxis, headTheta, headCm] = driverStream(head);
   [lForArmAxis, lForArmTheta, lForArmCm] = driverStream(lForArm);
   [lArmAxis, lArmTheta, lArmCm] = driverStream(lArm);
   [rForArmAxis, rForArmTheta, rForArmCm] = driverStream(rForArm);
   [rArmAxis, rArmTheta, rArmCm] = driverStream(rArm);
   [trunkAxis, trunkTheta, trunkCm] = driverStream(trunk);
   [lThighAxis, lThighTheta, lThighCm] = driverStream(lThigh);
   [lLegAxis, lLegTheta, lLegCm] = driverStream(lLeg);
   [lFootAxis, lFootTheta, lFootCm] = driverStream(lFoot);
   [lToesAxis, lToesTheta, lToesCm] = driverStream(lToes);
   [rThighAxis, rThighTheta, rThighCm] = driverStream(rThigh);
   [rLegAxis, rLegTheta, rLegCm] = driverStream(rLeg);
   [rFootAxis, rFootTheta, rFootCm] = driverStream(rFoot);
   [rToesAxis, rToesTheta, rToesCm] = driverStream(rToes);


   %% Time
   time = 0.0:0.1:((length(trunkAxis)-1)/10);

    %% Driver 1 (Head and trunk) %%

   fileID = fopen('Driver_001.txt','w'); %   will overwrite and a will append
   allDrivers{1,1} = [4,1,0,6,0,0,0,0,4,1];
   angleHeadTrunk = angleBetweenVectors(headAxis, trunkAxis); %angles between the head and trunk thorughout time
  for index = 1:length(time)
    fprintf(fileID,'%6.2f %6.2f\r\n',time(index),angleHeadTrunk(index));
  end
   

   fclose(fileID);
   

    %% Driver 2 (lForArms and Trunk) %%

    fileID = fopen('Driver_002.txt','w');
    allDrivers{2,1} = [4,2,0,6,0,0,0,0,4,2];
    anglelFaTrunk = angleBetweenVectors(lForArmAxis, trunkAxis); 
    for index = 1:length(time)
      fprintf(fileID,'%6.2f %6.2f\r\n',time(index),anglelFaTrunk(index));
    end
    
    fclose(fileID);
    


    %% Driver 3 (lArm and lForArm) %%

    fileID = fopen('Driver_003.txt','w');
    allDrivers{3,1} = [4,3,0,2,0,0,0,0,4,3];
    anglelArmlFA = angleBetweenVectors(lArmAxis, lForArmAxis);
    for index = 1:length(time)
      fprintf(fileID,'%6.2f %6.2f\r\n', time(index), anglelArmlFA(index));
    end
    
    fclose(fileID);
    


    %% Driver 4 (rForArm and Trunk) %%

    fileID = fopen('Driver_004.txt','w');
    allDrivers{4,1} = [4,4,0,6,0,0,0,0,4,4];
    anglerFATrunk = angleBetweenVectors(rForArmAxis, trunkAxis);
    for index = 1:length(time)
      fprintf(fileID,'%6.2f %6.2f\r\n', time(index),anglerFATrunk(index));
    end
    
    fclose(fileID);
    


    %% Driver 5 (rArm and rForArm) %%

    fileID = fopen('Driver_005.txt','w');
    allDrivers{5,1} = [4,5,0,4,0,0,0,0,4,5];
    anglerArmrFA = angleBetweenVectors(rArmAxis, rForArmAxis);
    for index = 1:length(time)
      fprintf(fileID,'%6.2f %6.2f\r\n', time(index), anglerArmrFA(index));
    end
    
    fclose(fileID);
    

    %% Driver 6 (trunk) %%

    fileID = fopen('Driver_006.txt','w');
    allDrivers{6,1} = [3,6,1,0,0,0,0,0,4,6];
    
    for index = 1:length(trunkCm)
      fprintf(fileID,'%6.2f %6.2f\r\n',time(index), trunkCm{index,1}(1));
    end
    
    fclose(fileID);
    

    %% Driver 7 (lThigh and Trunk) %%

    fileID = fopen('Driver_007.txt','w');
    allDrivers{7,1} = [4,7,0,6,0,0,0,0,4,7];
    anglelThighTrunk = angleBetweenVectors(lThighAxis, trunkAxis);
    for index = 1:length(time)
      fprintf(fileID,'%6.2f %6.2f\r\n', time(index), anglelThighTrunk(index));
    end
    
    fclose(fileID);
    

    %% Driver 8 (lLeg and lThigh) %%

    fileID = fopen('Driver_008.txt','w');
    allDrivers{8,1} = [4,8,0,7,0,0,0,0,4,8];
    anglelLeglThigh = angleBetweenVectors(lLegAxis, lThighAxis);
    for index = 1:length(time)
      fprintf(fileID,'%6.2f %6.2f\r\n', time(index), anglelLeglThigh(index));
    end
    
    fclose(fileID);
    

    %% Driver 9 (lFoot and lLeg) %%

    fileID = fopen('Driver_009.txt','w');
    allDrivers{9,1} = [4,9,0,8,0,0,0,0,4,9];
    anglelFootlLeg = angleBetweenVectors(lFootAxis, lLegAxis);
    for index = 1:length(time)
      fprintf(fileID,'%6.2f %6.2f\r\n', time(index), anglelFootlLeg(index));
    end
    
    fclose(fileID);
    

    %% Driver 10 (lToes and lFoot) %%

    fileID = fopen('Driver_010.txt','w');
    allDrivers{10,1} = [4,10,0,9,0,0,0,0,4,10];
    anglelToeslFoot = angleBetweenVectors(lToesAxis, lFootAxis);
    for index = 1:length(time)
      fprintf(fileID,'%6.2f %6.2f\r\n', time(index), anglelToeslFoot(index));
    end
    
    fclose(fileID);
    
    %% Driver 11 (rThigh and Trunk) %%

    fileID = fopen('Driver_011.txt','w');
    allDrivers{11,1} = [4,11,0,6,0,0,0,0,4,11];
    anglerThighTrunk = angleBetweenVectors(rThighAxis, trunkAxis);
    for index = 1:length(time)
      fprintf(fileID,'%6.2f %6.2f\r\n',time(index), anglerThighTrunk(index));
    end
    
    fclose(fileID);
       
    
    %% Driver 12 (rLeg and rThigh) %%

    fileID = fopen('Driver_012.txt','w');
    allDrivers{12,1} = [4,12,0,11,0,0,0,0,4,12];
    anglerLegrThigh = angleBetweenVectors(rLegAxis, rThighAxis);
    for index = 1:length(time)
      fprintf(fileID,'%6.2f %6.2f\r\n', time(index),anglerLegrThigh(index));
    end
    
    fclose(fileID);
    

    %% Driver 13 (rFoot and rLeg) %%

    fileID = fopen('Driver_013.txt','w');
    allDrivers{13,1} = [4,13,0,12,0,0,0,0,4,13];
    anglerFootrLeg = angleBetweenVectors(rFootAxis, rLegAxis);
    for index = 1:length(time)
      fprintf(fileID,'%6.2f %6.2f\r\n',time(index), anglerFootrLeg(index));
    end
    
    fclose(fileID);
    

    %% Driver 14 (rToes and rFoot) %%

    fileID = fopen('Driver_014.txt','w');
    allDrivers{14,1} = [3,14,0,13,0,0,0,0,4,14];
    anglerToesrFoot = angleBetweenVectors(rToesAxis, rFootAxis);
    for index = 1:length(time)
      fprintf(fileID,'%6.2f %6.2f\r\n',time(index), anglerToesrFoot(index));
    end
    
    fclose(fileID);
    

 end
 
 
