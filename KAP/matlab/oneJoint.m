function resultList = oneJoint(numBody1, numBody2, cm1, jointPosition, cm2)
%myFun - Description
%
% Syntax: output = myFun(input)
%
% Long description
global origin;
    if length(jointPosition) == (2) &&  length(cm1) == 2 && length(cm2) == 2 && length(origin) == 2 

        minusBody1 = jointPosition - cm1;
        minusBody2 = jointPosition - cm2;

        distance1 = norm(minusBody1);
        distance2 = norm(minusBody2);

        resultList = [numBody1, numBody2, distance1, 0, -distance2, 0];

    else
        disp('Verify the lenght of the inputed Vectors, these are wrong');
        
    end

    

end