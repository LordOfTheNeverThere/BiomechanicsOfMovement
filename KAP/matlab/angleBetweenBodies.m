function angleInRadsList = angleBetweenBodies(vector1, vector2, type)
% Finds the angle in rads between two vectors
%
% Syntax: output = myFun(input)
%
% Long description

    if type == 0 %% No inverse of ζ

    % if length(vector2) == 2
    %     aux=vector2;
    %     vector2={[]};
    %     for index = 1:length(vector1)
    %         vector2{index,1} = aux;
    %     end
    % end
    
    %     if length(vector1) == 2
    %         aux=vector1;
    %         vector1={[]};
    %         for index = 1:length(vector2)
    %             vector1{index,1} = aux;
    %         end
    %     end

        angleInRadsList = zeros(length(vector1),1);
        for index = 1:length(vector1)
            angle = acos(dot(vector1{index,1},vector2{index,1})/(norm(vector1{index,1})*norm(vector2{index,1})));
            if angle > pi
                 angleInRadsList(index) = 2*pi - angle;
            else
                angleInRadsList(index) = angle;
             end




        end

    elseif type == 1 %% First vector is inversed

        % if length(vector2) == 2
        %     aux=vector2;
        %     vector2={[]};
        %     for index = 1:length(vector1)
        %         vector2{index,1} = aux;
        %     end
        % end

        % if length(vector1) == 2
        %     aux=vector1;
        %     vector1={[]};
        %     for index = 1:length(vector2)
        %         vector1{index,1} = -aux;
        %     end
        % end

        angleInRadsList = zeros(length(vector1),1);
        for index = 1:length(vector1)
            angle = acos(dot(vector1{index,1},vector2{index,1})/(norm(vector1{index,1})*norm(vector2{index,1})));
            if angle > pi
                 angleInRadsList(index) = 2*pi - angle;
            else
                angleInRadsList(index) = angle;
             end




        end

    elseif type == 2 %% Second vector is inversed

        % if length(vector2) == 2
        %     aux=vector2;
        %     vector2={[]};
        %     for index = 1:length(vector1)
        %         vector2{index,1} = -aux;
        %     end
        % end

        % if length(vector1) == 2
        %     aux=vector1;
        %     vector1={[]};
        %     for index = 1:length(vector2)
        %         vector1{index,1} = aux;
        %     end
        % end

        angleInRadsList = zeros(length(vector1),1);
        for index = 1:length(vector1)
            angle = acos(dot(vector1{index,1},vector2{index,1})/(norm(vector1{index,1})*norm(vector2{index,1})));
            if angle > pi
                 angleInRadsList(index) = 2*pi - angle;
            else
                angleInRadsList(index) = angle;
             end




        end


    else
        disp('You can only select 0,1,2 types')

    end

end