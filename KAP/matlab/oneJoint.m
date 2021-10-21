function resultList = oneJoint(numBody1, numBody2, origin, cm1, jointPosition, cm2)
%myFun - Description
%
% Syntax: output = myFun(input)
%
% Long description
    if length(jointPosition) == (2) &  length(cm1) == 2 & length(cm2) == 2 & length(origin) == 2 
        resultList = [numBody1, numBody2];
        cm1 = cm1 - origin;
        cm2 = cm2 - origin;
        jointPosition = jointPosition - origin;

        minusBody1 = jointPosition - cm1;
        minusBody2 = jointPosition - cm2;

        distance1 = norm(minusBody1);
        distance2 = norm(minusBody2);

        resultList = [numBody1, numBody2, resultList, distance1, 0, -distance2, 0, 0];

    else
        disp('Verify the lenght of the inputed Vectors, these are wrong');
        
    end

    

end