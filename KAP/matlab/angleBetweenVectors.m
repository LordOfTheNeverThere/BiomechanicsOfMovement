function angleInRadsList = myFun(vector1, vector2)
% Finds the angle in rads between two vectors
%
% Syntax: output = myFun(input)
%
% Long description
    
    angleInRadsList = zeros(length(vector1));
    for index = 1:length(vector1)

        angleInRadsList(index) = acos((dot(vector1{index,1}, vector2{index,1}))/(mod(vector1{index,1})*mod(vector2{index,1})));

    end


end