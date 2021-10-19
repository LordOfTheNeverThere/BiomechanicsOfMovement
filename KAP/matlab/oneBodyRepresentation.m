function bodyAxis, timeTheta, timeCm  = oneBodyRepresentation(joint1XVector, joint1ZVector, joint2XVector, joint2ZVector, bodyLength, bodyCm)
%oneBodyRepresentation - All vectors are positions througout time, these positions must be normalized to the origin lAnkle(0)
%
% Syntax: output = myFun(input)
%
% Long description
    
bodyAxis{length(joint1XVector), 1} = {[]}; %% Prelocating the vector for speed

timeCm{length(joint1XVector), 1} = {[]};

Global 

    for frame = 1:length(joint1XVector)
        stick = [joint1XVector(frame), joint1ZVector(frame)]-[joint2XVector(frame), joint2ZVector(frame)]; %Defines the body our stick as a vector from the distal to the proximal joint

        bodyAxis{frame,1} = (stick/(transpose(stick)*stick));   %%%This will hold all axis positions throughout each frame, bodyAxis(t) == ξ(t)

        timeCm{frame,1} = [joint1XVector(frame),joint1ZVector(frame)] + bodyCm*bodyLength*bodyAxis(frame); %%Updating the CM of our body throughout ti
        
        if bodyAxis{frame,1}(1) >= 0
            theta(frame) = atan(bodyAxis{frame,1}(1)/bodyAxis{frame,1}(2))

        else
            theta(frame) = atan(bodyAxis{frame,1}(1)/bodyAxis{frame,1}(2)) + pi
        end

    end



end         