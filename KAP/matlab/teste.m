clc;
x = [ 1 2 3 4 5 6 ; 1 2 3 4 5 6 ; 1 2 3 4 5 6 ; 1 2 3 4 5 6];
y = zeros(2,5);
% disp(length(y))
% disp(length(y(:,1)))
z = [ [1,2] ; [3,4] ; [5,6] ; [7,8]];

% C = { {1,1}; {2,2}; {3,3}};
% disp(C{1,1});
% celldisp(C{1,1})

% file = readtsvCustom("trial_0011_g05.tsv");
% %disp(file)
% disp(file(1,6))
% x = file{1,6}
% disp(file(1,15))
% y = file(1,15);
% disp(file{1,6} + file{1,15})

% n = input('Enter a number: ');
% 
% switch n
%     case -1
%         disp('negative one')
%     case 0
%         disp('zero')
%     case 1
%         disp('positive one')
%     otherwise
%         disp('other value')
% end

% 
% fc = (0.1:0.1:10);
% disp(length(fc));
% ty = zeros(1,6)
% ty = [1,2,3,4,5,6];
% disp(ty(2:))


% fs = 100;
% fc = (0.1:0.1:10);
% f=1;
% list = zeros(length(fc), 2);

% while f<length(fc)
% wn = (2 * fc(f)/fs);
% [Ab,Bb] = butter(2,wn, 'low');
% disp(Ab)
% list(f,1) = Ab;
% list(f,2) = Bb;
% f = f + 1;
% end


% fc = 300;
% fs = 1000;
% 
% [b,a] = butter(6,fc/(fs/2));
% % freqz(b,a)
% disp(b)
% disp(a)
% 
% x = filtfilt(b,a,file{:,3});
% z = filtfilt (b,a,file{:,5});
% 
% final = [x, z]
