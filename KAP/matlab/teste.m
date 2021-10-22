clc;
%x = [ 1 2 3 4 5 6 ; 1 2 3 4 5 6 ; 1 2 3 4 5 6 ; 1 2 3 4 5 6];
%y = zeros(2,5);
% disp(length(y))
% disp(length(y(:,1)))
%z = [ [1,2] ; [3,4] ; [5,6] ; [7,8]];

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
file = readtsvCustom("trial_0011_g05.tsv");
x = file{:,3};
z = file{:,5};

fs = 100;
fc = (0.1:0.1:10);

Rx = zeros(length(fc),1);
Rz = zeros(length(fc),1);
f=1;
while f <= length(fc)
    [b,a] = butter(2,(2 * fc(f))/fs, 'low');
    xf(:,f) = filtfilt(b,a,x);    
    zf(:,f) = filtfilt(b,a,z);
    Rx(f) = sqrt(sum((x(:) - xf(:,f)).^2)/length(x)^2);
    Rz(f) = sqrt(sum((z(:) - zf(:,f)).^2)/length(z)^2);
    f = f + 1;
end
disp(xf(:,1));
%disp(filtered_coordinates);
filtered_coordinates = zeros(length(x), 2);
final_fc = zeros(1,2);
minCorr = 0.97; %slides
rx = 1;
while rx <= length(fc) 
    [xCorrelation, ~ , bx] = regression(fc(rx:length(fc)),Rx(rx:length(fc))');
    xCorrelation = xCorrelation^2;
    if xCorrelation > minCorr
        break
    else
        rx = rx + 1;
    end
end


rz=1;
while rz <= length(fc) 
    [zCorrelation, ~ , bz] = regression(fc(rz:length(fc)),Rz(rz:length(fc))');
    zCorrelation = zCorrelation^2;
    if zCorrelation > minCorr
        break
    else
        rz = rz + 1;
    end
end

% disp(bz);
% disp(bx);
% disp("RX =" + rx);
% disp("RZ =" + rz);
Rx_temp = Rx - bx;
Rz_temp = Rz - bz;
% disp("Rx =" + Rx);
% disp("Rz =" + Rz);
% disp("Rx_temp=" + Rx_temp);
%disp("Rz_temp" + Rz_temp);
min_value_x = min(abs(Rx_temp));
%disp("ABS=" + min(abs(Rx_temp)));
min_value_z = min(abs(Rz_temp));
% disp("MINVALUE= " + min_value_x);
index_x = find(abs(Rx_temp) == min_value_x)
index_z = find(abs(Rz_temp) == min_value_z);
final_fc(1,1) = fc(index_x);
final_fc(1,2) = fc(index_z);
filtered_coordinates(:,1) = xf(:,index_x);
filtered_coordinates(:,2) = zf(:,index_z);
% disp("XF= " + xf);
% disp("ZF= " + zf);





% 
% minCorr = 0.97; %slides
% rx = 1;
% %signal = false;
% while rx <= length(fc) 
%     [xCorrelation, ~ , bx] = regression(fc(rx:length(fc)),Rx(rx:length(fc))');
%     xCorrelation = xCorrelation^2;
%     if xCorrelation > minCorr
%         
%         bfx = bx;
%         break
%     else
%         rx = rx + 1;
%     end
% end
% disp(bfx)
% %plot(fc,Rx)
% % hold on
% % fplot(bfx,[fc(1),fc(length(fc))])
% % xi = intersect(Rx,bfx)
% xi = find(Rx == bfx)
% % disp(Rx);
% % disp(Rz);
% % final = [x, z];
% %mdl = fitlm(fc,Rx)
% %byz = find(Rx == 29.539409106208710)
