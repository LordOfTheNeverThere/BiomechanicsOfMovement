function output = myFun(input)
%myFun - Description
%
% Syntax: output = myFun(input)
%
% Long description

    %% Load Files %%

    [forcePlate1, forcePlate2, forcePlate3] = tsv2mat(0,0,0);
    

    
    
    %% getting rid of the y data %%
%     forcePlate1(:,1:2) = forcePlate1(:,1:2:3);
%     forcePlate2(:,1:2) = forcePlate2(:,1:2:3);
%     forcePlate3(:,1:2) = forcePlate3(:,1:2:3);
%     
%     forcePlate1(:,3:4) = forcePlate1(:,4:2:6)/1000;
%     forcePlate2(:,3:4) = forcePlate2(:,4:2:6)/1000;
%     forcePlate3(:,3:4) = forcePlate3(:,4:2:6)/1000;
    disp(forcePlate1);
    %Remove unused colunms
    forcePlate1(:,2:3:5) = [];
    forcePlate2(:,2:3:5) = [];
    forcePlate3(:,2:3:5) = [];
    
    forcePlate1(:,3:4) = forcePlate1(:,3:4)/1000;
    forcePlate2(:,3:4) = forcePlate2(:,3:4)/1000;
    forcePlate3(:,3:4) = forcePlate3(:,3:4)/1000;
    
    disp(forcePlate1);
    
    forcePlates = {forcePlate1, forcePlate2, forcePlate3};
    for forcePlateIndex = 1:length(forcePlates)
        forcePlate = forcePlates{1,forcePlateIndex};
        contactTimeSteps = find(forcePlate(:,1) > 5);
        
        %% Pre-Filtering Forces %%
        for col = 1:2

            for row = 1:length(forcePlate1(:,1))
                
                if forcePlate(row, col) < 5 
                    forcePlate(row, col) = 0;
                else
                    forcePlate(row, col) = forcePlate(row , col);
                end
            end
        end

        

        %% Pre-Filtering CoP %%
        for col = 3:4
            for row = 1:length(forcePlate1(:,1))
                if 1 < contactTimeSteps(1) && contactTimeSteps(length(contactTimeSteps)) < row %% In the special case the contact only happens in mid movement, having no contact after and before
                    if ismember(row, contactTimeSteps) %%In the middle where contact happens
                        
                        forcePlate(row, col) = forcePlate(row, col);
                    elseif row < contactTimeSteps(1) %Before the middle contact
                        
                        forcePlate(row, col) = forcePlate(contactTimeSteps(1), col);
                    else  %after the middle contact
                        
                        forcePlate(row, col) = forcePlate(row-1, col);
                    end
                    

               elseif  1 < contactTimeSteps(1) %If the first contact timestep is not the first iteration means that contact is made in mid way before the final frame, so until the contact frame all the values will be as if contact was first made
                    if row < contactTimeSteps(1)
                        
                       forcePlate(row, col) = forcePlate(contactTimeSteps(1), col); 
                    else
                        
                       forcePlate(row, col) = forcePlate(row, col);
                    end
                    

                else %Contact is no longer made in mid movement
                    
                    if ismember(row, contactTimeSteps)
                        
                        forcePlate(row, col) = forcePlate(row, col);
                    else
                        
                        forcePlate(row, col) = forcePlate(contactTimeSteps(length(contactTimeSteps)), col);
                    end
                end
            end
        end
        forcePlates{1, forcePlateIndex} = forcePlate;
    end
    forcePlate1 = forcePlates{1, 1};
    forcePlate2 = forcePlates{1, 2};
    forcePlate3 = forcePlates{1, 3};
    
%     hold on;
%     plot(forcePlate1(:,4),'DisplayName','forcePlate1')
    
    [b10,a10] = butter(2,(2 * 10)/100,'low');
    [b20,a20] = butter(2,(2 * 20)/100,'low');

    for col = 1:2
    
    forcePlate1(:,col) = filtfilt(b20,a20,forcePlate1(:,col));
    forcePlate1(:,col) = filtfilt(b20,a20,forcePlate1(:,col));
    forcePlate1(:,col) = filtfilt(b20,a20,forcePlate1(:,col));
    forcePlate2(:,col) = filtfilt(b20,a20,forcePlate2(:,col));
    forcePlate2(:,col) = filtfilt(b20,a20,forcePlate2(:,col));
    forcePlate2(:,col) = filtfilt(b20,a20,forcePlate2(:,col));
    forcePlate3(:,col) = filtfilt(b20,a20,forcePlate3(:,col));
    forcePlate3(:,col) = filtfilt(b20,a20,forcePlate3(:,col));
    forcePlate3(:,col) = filtfilt(b20,a20,forcePlate3(:,col));

    end
    for col = 3:4
    forcePlate1(:,col) = filtfilt(b10,a10,forcePlate1(:,col));
    forcePlate1(:,col) = filtfilt(b10,a10,forcePlate1(:,col));
    forcePlate1(:,col) = filtfilt(b10,a10,forcePlate1(:,col));
    forcePlate2(:,col) = filtfilt(b10,a10,forcePlate2(:,col));
    forcePlate2(:,col) = filtfilt(b10,a10,forcePlate2(:,col));
    forcePlate2(:,col) = filtfilt(b10,a10,forcePlate2(:,col));
    forcePlate3(:,col) = filtfilt(b10,a10,forcePlate3(:,col));
    forcePlate3(:,col) = filtfilt(b10,a10,forcePlate3(:,col));
    forcePlate3(:,col) = filtfilt(b10,a10,forcePlate3(:,col));
    end
    
%     plot(forcePlate1(:,4),'DisplayName','forcePlate1')
%     
%     hold off;


end