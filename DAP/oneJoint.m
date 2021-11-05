function resultList = oneJoint(numBody1, numBody2)
%resultList = oneJoint(numBody1, numBody2) With two given numbers for each body, it will give the distance from the cm1 to the joint and...
% and -distance of cm2 to the joint between the two bodies, the last one is negative since ζ is from proximal to distal,...
% so the coordinates of the joint in the first body's fixed frame are positive while in the second body's fixed frame it has a negative value
% The result list will be used to create the input file with the coordinates of the joint in relation with each bodies ficed coordinates

body1 = BodySelector(numBody1);
body2 = BodySelector(numBody2);

%     jointPosition = [body1.xDjoint(1), body1.zDjoint(1)]; %The joint between two bodies has the coordinates of the Distal joints in relation to the first body
    distance1 = abs(body1.size * (1-body1.cmFromProx));
    distance2 = abs(body2.size * body2.cmFromProx);
    if numBody1 == 1
        distance1 = body1.size;
    end
    resultList = [numBody1, numBody2, distance1, 0, -distance2, 0];
end