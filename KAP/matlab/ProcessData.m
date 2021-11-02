% disp(file{:,3});
% disp(file{:,5});
%disp([file{:,3}, file{:,5}])


function [final_fc, filtered_coordinates] = ProcessData(fs, coord, localOrigin)
global origin;
clc;
fc = (0.1:0.1:10);
origin = localOrigin;
x = (coord(11:((length(coord(:,1))-10)),1) - origin(1))/1000; %posição da coordenada x no file
z = (coord(11:(length(coord(:,1))-10),2) - origin(2)+170)/1000; %posição da coordenada z no file
% xf = zeros(length(x),1);
% zf = zeros(length(z),1);
Rx = zeros(length(fc),1);
Rz = zeros(length(fc),1);
f = 1;
while f <= length(fc)
    [b,a] = butter(2,(2 * fc(f))/fs,'low');
    xf(:,f) = filtfilt(b,a,x);    
    zf(:,f) = filtfilt(b,a,z);
    Rx(f) = sqrt((1/length(x))*sum((x(:) - xf(:,f)).^2));
    Rz(f) = sqrt((1/length(z))*sum((z(:) - zf(:,f)).^2));
    f = f + 1;
end

%disp(filtered_coordinates);

%final_fc = zeros(length(fc),2);
minCorr = 0.90; %slides
rx = 1;
while rx <= length(fc) 
    [xCorrelation, ~ , bx] = regression(fc(rx:length(fc)),Rx(rx:length(fc))');
    xCorrelation = xCorrelation^2;
    if xCorrelation >= minCorr
        break
    else
        rx = rx + 1;
    end
end


rz=1;
while rz <= length(fc) 
    [zCorrelation, ~ , bz] = regression(fc(rz:length(fc)),Rz(rz:length(fc))');
    zCorrelation = zCorrelation^2;
    if zCorrelation >= minCorr
        break
    else
        rz = rz + 1;
    end
end


Rx_temp = Rx - bx;
Rz_temp = Rz - bz;
disp(bx);

min_value_x = min(abs(Rx_temp));
min_value_z = min(abs(Rz_temp));

index_x = find(abs(Rx_temp) == min_value_x);
index_z = find(abs(Rz_temp) == min_value_z);

final_fc = [fc(index_x), fc(index_z)];
filtered_coordinates_x = xf(:,index_x);
filtered_coordinates_z = zf(:,index_z);
filtered_coordinates = [filtered_coordinates_x , filtered_coordinates_z];
%disp(final_fc);
% disp("XF= " + xf);
% disp("ZF= " + zf);

end




