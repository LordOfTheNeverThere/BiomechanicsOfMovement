function [bodyAxis, timeTheta, timeCm]  = driverStream(body)
%oneBodyRepresentation - receives a body from the BodySelector and will evaluate its Position and angle throughout time
%
% Syntax: output = myFun(input)
%
% Long description
    
bodyLength = body.size; %Lenght of the Body
bodyCm = body.cmVector; %Initial CM vector
cmFromProx = body.cmFromProx; %Percentage of the lenght the CM is from the Proximal Joint
joint1XVector = body.xPjoint; % x position of the Proximal Joint
joint1ZVector = body.zPjoint; % z position of the Proximal Joint
joint2XVector = body.xDjoint; % x position of the Distal Joint
joint2ZVector = body.zDjoint; % z position of the Distal Joint

if strcmp(body.name, 'Head')
    joint1XVector = body.xDjoint;
    joint1ZVector = body.zDjoint;
    joint2XVector = body.xPjoint;
    joint2ZVector = body.zPjoint;
end

bodyAxis{length(joint1XVector), 1} = {[]}; % Prelocating the vectors for speed
timeTheta = zeros(length(joint1XVector),1);
timeCm{length(joint1XVector), 1} = {[]};

fixedFramePJoint = [-bodyLength*cmFromProx,0];
timeCm{1,1}=bodyCm;


    for frame = 1:length(joint1XVector)

        joint2XVector(frame) = 2*(joint2XVector(frame) - 1) +1;
        joint2ZVector(frame) = 2*(joint2ZVector(frame) - 1) +1;
        joint1XVector(frame) = 2*(joint1XVector(frame) - 1) +1;
        joint1ZVector(frame) = 2*(joint1ZVector(frame) - 1) +1;


        stick = [joint2XVector(frame), joint2ZVector(frame)]-[joint1XVector(frame), joint1ZVector(frame)]; %Defines the body our stick as a vector from the distal to the proximal joint

        bodyAxis{frame,1} = (stick/sqrt((stick*transpose(stick))));   %%%This will hold all axis positions throughout each frame, bodyAxis(t) == ξ(t)
        
%         if bodyAxis{frame,1}(1) >= 0 && bodyAxis{frame,1}(2) >= 0
% 
%             timeTheta(frame) = atan(bodyAxis{frame,1}(2)/bodyAxis{frame,1}(1));
% 
%         elseif bodyAxis{frame,1}(1) >= 0 && bodyAxis{frame,1}(2) < 0
% 
%             timeTheta(frame) = atan(bodyAxis{frame,1}(2)/bodyAxis{frame,1}(1)) + 2*pi;
% 
%         else
% 
%             timeTheta(frame) = atan(bodyAxis{frame,1}(2)/bodyAxis{frame,1}(1)) + pi;
%         end
%         
%         if timeTheta(frame)<0
%             timeTheta(frame) = timeTheta(frame) + 2*pi;
%         end
        horizontal = [1,0];
        timeTheta(frame) = acos(dot(horizontal,bodyAxis{frame,1})/(norm(horizontal)*norm(bodyAxis{frame,1})));
        if bodyAxis{frame,1}(2) < 0
            timeTheta(frame) = 2*pi - timeTheta(frame);
        end
        
        lameMatrix = [cos(timeTheta(frame)), -sin(timeTheta(frame)); ....
                        sin(timeTheta(frame)), cos(timeTheta(frame))];

        if frame ~= length(joint1XVector)
           if strcmp(body.name,'Head')
            timeCm{frame + 1,1} = [joint1XVector(frame+1),joint1ZVector(frame+1)];
           else
             % frame+1 because we start with inputing the CM before hand, and likewise the last CM is discarded since said point won't be evaluatred               
            timeCm{frame + 1,1} = [joint1XVector(frame+1),joint1ZVector(frame+1)] - transpose(lameMatrix*transpose(fixedFramePJoint)); %%Updating the CM of our body throughout time with the vector that point to the cm in the local frame

           end


        end

    end
timeTheta = unwrap(timeTheta);
end         