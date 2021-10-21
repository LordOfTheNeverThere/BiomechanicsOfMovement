% disp(file{:,3});
% disp(file{:,5});
%disp([file{:,3}, file{:,5}])


function [final_fc] = ProcessData(fs,coord)
clc
file = readtsvCustom("trial_0011_g05.tsv");
fc = (0.1:0.1:10);
x = coord{:,1}; %posição da coordenada x no file
z = coord{:,2}; %posição da coordenada z no file
% xf = zeros(length(x),1);
% zf = zeros(length(z),1);
Rx = zeros(length(fc),1);
Rz = zeros(length(fc),1);
f = 1;
while f <= length(fc)
    [b,a] = butter(2,(2 * fc(f))/fs, 'low');
    xf = filtfilt(b,a,x);    
    zf = filtfilt(b,a,z);
    Rx(f) = sqrt(sum((x(:) - xf(:)).^2)/length(x)^2);
    Rz(f) = sqrt(sum((z(:) - zf(:)).^2)/length(z)^2);
    f = f + 1;
end

final_fc = zeros(1,2);
minCorr = 0.97; %slides
rx = 1;
stop_signx = false; 
while rx < length(fc) && stop_signx
    [xCorrelation, ~ , bx] = regression(fc(rx:length(fc)),Rx(rx:length(fc))');
    xCorrelation = xCorrelation^2;
    if xCorrelation > minCorr
        bfx = bx;
        stop_signx = true;
        xi = intersect(Rx,bx);
        final_fc(1,1) = xi; 
    else
        rx = rx + 2;
    end
end

stop_signz = false;
rz=1;
while rz < length(fc) && stop_signz
    [zCorrelation, ~ , bz] = regress(fc(rz:length(fc)),Rx(rz:length(fc))');
    zCorrelation = zCorrelation^2;
    if zCorrelation > minCorr
        bfz = bz;
        stop_signz = true;
        zi = intercept(Rz,bz);
        final_fc(1,2) = zi;
    else
        rz = rz + 2;
    end
end


disp(final_fc);
end




