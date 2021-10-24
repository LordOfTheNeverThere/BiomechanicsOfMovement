function angleInRadsList = angleBetweenBodies(vector1, vector2)
% Finds the angle in rads between two vectors
%
% Syntax: output = myFun(input)
%
% Long description

    angleInRadsList = zeros(length(vector1),1);
    for index = 1:length(vector1)
        angle =  atan2(vector1{index,1}(1) * vector2{index,1}(2) - vector2{index,1}(1) * vector1{index,1}(2),vector1{index,1}(1) * vector1{index,1}(2) + vector2{index,1}(1) * vector2{index,1}(2));

            angleInRadsList(index) = angle;

        

    end


end