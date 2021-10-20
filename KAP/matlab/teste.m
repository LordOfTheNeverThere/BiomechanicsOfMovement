clc;
x = [ 1 2 3 4 5 6 ; 1 2 3 4 5 6 ; 1 2 3 4 5 6 ; 1 2 3 4 5 6];
y = [zeros(2,5)];
% disp(length(y))
% disp(length(y(:,1)))
z = [ [1,2] ; [3,4] ; [5,6] ; [7,8]];

% C = { {1,1}; {2,2}; {3,3}};
% disp(C{1,1});
% celldisp(C{1,1})

file = readtsvCustom("trial_0011_g05.tsv");
%disp(file)
disp(file(1,6))
x = file{1,6}
% disp(file(1,15))
% y = file(1,15);
disp(file{1,6} + file{1,15})
