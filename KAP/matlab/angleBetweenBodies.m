function angleInRadsList = angleBetweenBodies(vector1, vector2)
% Finds the angle in rads between two vectors
%
% Syntax: output = myFun(input)
%
% Long description
    
    angleInRadsList = zeros(length(vector1),1);
    for index = 1:length(vector1)

        angleInRadsList(index) = pi - (acos((dot(vector1{index,1}, vector2{index,1}))/(norm(vector1{index,1})*norm(vector2{index,1}))));

    end


end