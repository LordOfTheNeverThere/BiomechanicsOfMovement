function bodyAxis = oneBodyRepresentation(joint1XVector, joint1ZVector, joint2XVector, joint2ZVector)
%oneBodyRepresentation - All vectors are positions througout time, these positions must be normalized to the origin lAnkle(0)
%
% Syntax: output = myFun(input)
%
% Long description
    
bodyAxis = zeros(length(joint1XVector)); %% Prelocating the vector for speed

for frame = 1:length(joint1XVector)
    stick = [joint1XVector(frame), joint1ZVector(frame)]-[joint2XVector(frame), joint2ZVector(frame)]; %Defines the body our stick as a vector from the distal to the proximal joint

    bodyAxis(frame) = (stick/(transpose(stick)*stick));   %%%This will hold all axis positions throughout each frame, bodyAxis(t) == ξ(t)
end


end