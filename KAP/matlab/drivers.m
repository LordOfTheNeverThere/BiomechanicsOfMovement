 function allDrivers = drivers()
 %drivers - Will create the arrays for the inputfile, as well as the driver_00#.txt file
 %
 % Syntax: output = myFun(input)
 %
 % Long description

 %% Bodies
   allDrivers{14, 1} ={[]};
    %{
    1-Head; 2-lForArm; 3-lArm; 4-rForArm; 5-rArm; 6-Trunk; 7-lThigh;
    8-lLeg; 9-lFoot; 10-lToes; 11-rThigh; 12-rLeg; 13-rFoot; 14-rToes 
    %}
   %% Driver Feeder
   
   [headAxis, headTheta, headCm] = driverStream(BodySelector(1));
   [lForArmAxis, lForArmTheta, lForArmCm] = driverStream(BodySelector(2));
   [lArmAxis, lArmTheta, lArmCm] = driverStream(BodySelector(3));
   [rForArmAxis, rForArmTheta, rForArmCm] = driverStream(BodySelector(4));
   [rArmAxis, rArmTheta, rArmCm] = driverStream(BodySelector(5));
   [trunkAxis, trunkTheta, trunkCm] = driverStream(BodySelector(6));
   [lThighAxis, lThighTheta, lThighCm] = driverStream(BodySelector(7));
   [lLegAxis, lLegTheta, lLegCm] = driverStream(BodySelector(8));
   [lFootAxis, lFootTheta, lFootCm] = driverStream(BodySelector(9));
   [lToesAxis, lToesTheta, lToesCm] = driverStream(BodySelector(10));
   [rThighAxis, rThighTheta, rThighCm] = driverStream(BodySelector(11));
   [rLegAxis, rLegTheta, rLegCm] = driverStream(BodySelector(12));
   [rFootAxis, rFootTheta, rFootCm] = driverStream(BodySelector(13));
   [rToesAxis, rToesTheta, rToesCm] = driverStream(BodySelector(14));


   %% Time
   time = 0.0:0.1:((length(trunkAxis)-1)/10);

    %% Driver 1 (Head and trunk) %%

   fileID = fopen('Driver_001.txt','w'); %   will overwrite and a will append
   allDrivers{1,1} = [4,1,0,6,0,0,0,0,4,1];
   angleHeadTrunk = angleBetweenBodiesMinus(headAxis, trunkAxis); %angles between the head and trunk thorughout time
  for index = 1:length(time)
    fprintf(fileID,'%6.2f %6.2f\r\n',time(index),angleHeadTrunk(index));
  end
   

   fclose(fileID);
   

    %% Driver 2 (lForArms and Trunk) %%

    fileID = fopen('Driver_002.txt','w');
    allDrivers{2,1} = [4,2,0,6,0,0,0,0,4,2];
    anglelFaTrunk = angleBetweenBodies(trunkAxis,lForArmAxis); 
    for index = 1:length(time)
      fprintf(fileID,'%6.2f %6.2f\r\n',time(index),anglelFaTrunk(index));
    end
    
    fclose(fileID);
    


    %% Driver 3 (lArm and lForArm) %%

    fileID = fopen('Driver_003.txt','w');
    allDrivers{3,1} = [4,3,0,2,0,0,0,0,4,3];
    anglelArmlFA = angleBetweenBodiesMinus(lArmAxis, lForArmAxis);
    for index = 1:length(time)
      fprintf(fileID,'%6.2f %6.2f\r\n', time(index), anglelArmlFA(index));
    end
    
    fclose(fileID);
    


    %% Driver 4 (rForArm and Trunk) %%

    fileID = fopen('Driver_004.txt','w');
    allDrivers{4,1} = [4,4,0,6,0,0,0,0,4,4];
    anglerFATrunk = angleBetweenBodiesMinus(trunkAxis,rForArmAxis);
    for index = 1:length(time)
      fprintf(fileID,'%6.2f %6.2f\r\n', time(index),anglerFATrunk(index));
    end
    
    fclose(fileID);
    


    %% Driver 5 (rArm and rForArm) %%

    fileID = fopen('Driver_005.txt','w');
    allDrivers{5,1} = [4,5,0,4,0,0,0,0,4,5];
    anglerArmrFA = angleBetweenBodiesMinus(rArmAxis, rForArmAxis);
    for index = 1:length(time)
      fprintf(fileID,'%6.2f %6.2f\r\n', time(index), anglerArmrFA(index));
    end
    
    fclose(fileID);
    

    %% Driver 6,7,8 (trunk) x, z, Θ  %%

    fileID = fopen('Driver_006.txt','w');
    allDrivers{6,1} = [3,6,1,0,0,0,0,0,4,6];
    
    for index = 1:length(trunkCm)
      fprintf(fileID,'%6.2f %6.2f\r\n',time(index), trunkCm{index,1}(1));
    end
    
    fclose(fileID);


    fileID = fopen('Driver_007.txt','w');
    allDrivers{7,1} = [3,6,2,0,0,0,0,0,4,7];
    
    for index = 1:length(trunkCm)
      fprintf(fileID,'%6.2f %6.2f\r\n',time(index), trunkCm{index,1}(2));
    end
    
    fclose(fileID);


    fileID = fopen('Driver_008.txt','w');
    allDrivers{8,1} = [3,6,3,0,0,0,0,0,4,8];
    
    for index = 1:length(trunkTheta)
      fprintf(fileID,'%6.2f %6.2f\r\n',time(index), trunkTheta(index));
    end
    
    fclose(fileID);
        
    

    %% Driver 9 (lThigh and Trunk) %%

    fileID = fopen('Driver_009.txt','w');
    allDrivers{9,1} = [4,7,0,6,0,0,0,0,4,9];
    anglelThighTrunk = angleBetweenBodies(lThighAxis, trunkAxis);
    for index = 1:length(time)
      fprintf(fileID,'%6.2f %6.2f\r\n', time(index), anglelThighTrunk(index));
    end
    
    fclose(fileID);
    

    %% Driver 10 (lLeg and lThigh) %%

    fileID = fopen('Driver_010.txt','w');
    allDrivers{10,1} = [4,8,0,7,0,0,0,0,4,10];
    anglelLeglThigh = angleBetweenBodies(lLegAxis, lThighAxis);
    for index = 1:length(time)
      fprintf(fileID,'%6.2f %6.2f\r\n', time(index), anglelLeglThigh(index));
    end
    
    fclose(fileID);
    

    %% Driver 11 (lFoot and lLeg) %%

    fileID = fopen('Driver_011.txt','w');
    allDrivers{11,1} = [4,9,0,8,0,0,0,0,4,11];
    anglelFootlLeg = angleBetweenBodies(lFootAxis, lLegAxis);
    for index = 1:length(time)
      fprintf(fileID,'%6.2f %6.2f\r\n', time(index), anglelFootlLeg(index));
    end
    
    fclose(fileID);
    

    %% Driver 12 (lToes and lFoot) %%

    fileID = fopen('Driver_012.txt','w');
    allDrivers{12,1} = [4,10,0,9,0,0,0,0,4,12];
    anglelToeslFoot = angleBetweenBodies(lToesAxis, lFootAxis);
    for index = 1:length(time)
      fprintf(fileID,'%6.2f %6.2f\r\n', time(index), anglelToeslFoot(index));
    end
    
    fclose(fileID);
    
    %% Driver 13 (rThigh and Trunk) %%

    fileID = fopen('Driver_013.txt','w');
    allDrivers{13,1} = [4,11,0,6,0,0,0,0,4,13];
    anglerThighTrunk = angleBetweenBodies(rThighAxis, trunkAxis);
    for index = 1:length(time)
      fprintf(fileID,'%6.2f %6.2f\r\n',time(index), anglerThighTrunk(index));
    end
    
    fclose(fileID);
       
    
    %% Driver 14 (rLeg and rThigh) %%

    fileID = fopen('Driver_014.txt','w');
    allDrivers{14,1} = [4,12,0,11,0,0,0,0,4,14];
    anglerLegrThigh = angleBetweenBodies(rLegAxis, rThighAxis);
    for index = 1:length(time)
      fprintf(fileID,'%6.2f %6.2f\r\n', time(index),anglerLegrThigh(index));
    end
    
    fclose(fileID);
    

    %% Driver 15 (rFoot and rLeg) %%

    fileID = fopen('Driver_015.txt','w');
    allDrivers{15,1} = [4,13,0,12,0,0,0,0,4,15];
    anglerFootrLeg = angleBetweenBodies(rFootAxis, rLegAxis);
    for index = 1:length(time)
      fprintf(fileID,'%6.2f %6.2f\r\n',time(index), anglerFootrLeg(index));
    end
    
    fclose(fileID);
    

    %% Driver 16 (rToes and rFoot) %%

    fileID = fopen('Driver_016.txt','w');
    allDrivers{16,1} = [4,14,0,13,0,0,0,0,4,16];
    anglerToesrFoot = angleBetweenBodies(rToesAxis, rFootAxis);
    for index = 1:length(time)
      fprintf(fileID,'%6.2f %6.2f\r\n',time(index), anglerToesrFoot(index));
    end
    
    fclose(fileID);
    

 end
 
 
