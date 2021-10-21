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





% freqz(b,a)
% disp(b)
% disp(a)
x = file{:,3};
z = file{:,5};

fs = 100;
fc = (0.1:0.1:20);

Rx = zeros(length(fc),1);
Rz = zeros(length(fc),1);
f=1;
while f<=length(fc)
    [b,a] = butter(2,fc(f)/(fs/2));
    xf = filtfilt(b,a,x);
    zf = filtfilt(b,a,z);
    Rx(f) = sqrt(sum((x(:) - xf(:)).^2)/length(x)^2);
    Rz(f) = sqrt(sum((z(:) - zf(:)).^2)/length(z)^2);
    f = f + 1;
end

minCorr = 0.97; %slides
rx = 1;

while rx <= length(fc)
    [xCorrelation, ~ , bx] = regression(fc(rx:length(fc)),Rx(rx:length(fc))');
    xCorrelation = xCorrelation^2;
    if xCorrelation > minCorr
        bfx = bx;
        break
    else
        rx = rx + 1;
    end
end
disp(bfx)
Rx = plot(fc,Rx)
hold on
fplot(bfx,[fc(1),fc(length(fc))])
xi = intersect(Rx,bfx)

% disp(Rx);
% disp(Rz);
% final = [x, z];
%mdl = fitlm(fc,Rx)
%byz = find(Rx == 29.539409106208710)
