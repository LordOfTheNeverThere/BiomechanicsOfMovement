function resultList = oneJoint(numBody1, numBody2)
%resultList = oneJoint(numBody1, numBody2) With two given numbers for each body, it will give the distance from the cm1 to the joint and...
% and -distance of cm2 to the joint between the two bodies, the last one is negative since ζ is from proximal to distal,...
% so the coordinates of the joint in the first body's fixed frame are positive while in the second body's fixed frame it has a negative value
% The result list will be used to create the input file with the coordinates of the joint in relation with each bodies ficed coordinates

body1 = BodySelector(numBody1);
body2 = BodySelector(numBody2);
cm1 = body1.cmVector;  % Cm of each of the two bodies
cm2 = body2.cmVector; 


    jointPosition = [body1.xDjoint(1), body1.zDjoint(1)]; %The joint between two bodies has the coordinates of the Distal joints in relation to the first body




    if length(jointPosition) == (2) &&  length(cm1) == 2 && length(cm2) == 2 

        minusBody1 = jointPosition - cm1;
        minusBody2 = jointPosition - cm2;

        distance1 = norm(minusBody1);
        distance2 = norm(minusBody2);

        resultList = [numBody1, numBody2, distance1, 0, -distance2, 0];

    else
        disp('Verify the lenght of the inputed Vectors, these are wrong');
        
    end

    

end