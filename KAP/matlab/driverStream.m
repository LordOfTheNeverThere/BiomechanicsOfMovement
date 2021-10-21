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

bodyAxis{length(joint1XVector), 1} = {[]}; % Prelocating the vectors for speed
timeTheta = zeros(length(joint1XVector));
timeCm{length(joint1XVector), 1} = {[]};
fixedFrameCM = [-bodyLength*cmFromProx,0];
timeCm{1,1}=bodyCm;


    for frame = 1:length(joint1XVector)
        stick = [joint1XVector(frame), joint1ZVector(frame)]-[joint2XVector(frame), joint2ZVector(frame)]; %Defines the body our stick as a vector from the distal to the proximal joint

        bodyAxis{frame,1} = (stick/sqrt((transpose(stick)*stick)));   %%%This will hold all axis positions throughout each frame, bodyAxis(t) == ξ(t)
        
        if bodyAxis{frame,1}(1) >= 0 && bodyAxis{frame,1}(2) >= 0

            timeTheta(frame) = atan(bodyAxis{frame,1}(1)/bodyAxis{frame,1}(2));

        elseif bodyAxis{frame,1}(1) >= 0 && bodyAxis{frame,1}(2) < 0

            timeTheta(frame) = atan(bodyAxis{frame,1}(1)/bodyAxis{frame,1}(2)) + 2*pi;

        else

            timeTheta(frame) = atan(bodyAxis{frame,1}(1)/bodyAxis{frame,1}(2)) + pi;
        end
        lameMatrix = [cos(timeTheta(frame)), -sin(timeTheta(frame)); ....
                        sin(timeTheta(frame)), cos(timeTheta(frame))];


        timeCm{frame,1} = [joint1XVector(frame),joint1ZVector(frame)] - lameMatrix*fixedFrameCM; %%Updating the CM of our body throughout time with the vector that point to the cm in the local frame

    end



end         