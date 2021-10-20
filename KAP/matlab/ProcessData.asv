file = readtsvCustom("trial_0011_g05.tsv");
% disp(file{:,3});
% disp(file{:,5});
%disp([file{:,3}, file{:,5}])

function [processed_data] = ProcessData(fs,coord)

fc = (0.1:0.1:10);
x = coord(:,1); %posição da coordenada x no file
z = coord(:,2); %posição da coordenada z no file
% xf = zeros(length(x),1);
% zf = zeros(length(z),1);
Rx = zeros(length(fc),1);
Rz = zeros(length(fc),1);
f = 1;
while f < length(fc)
    [Ab,Bb] = butter(2,(2 * fc(f))/fs, 'low');
    xf = filtfilt(Ab,Bb,x);    
    zf = filtfilt(Ab,Bb,z);
    Rx(f) = sqrt(sum((x(:) - xf(:)).^2)/length(x)^2);
    Rz(f) = sqrt(sum((z(:) - zf(:)).^2)/length(z)^2);
    f = f + 1;
end

minCorr = 0.90; %slides
r1 = 1;
stop_sign1 = False; 
while r1 < length(fc) && stop_sign1
    [xCorrelation, ~ , xfc] = regress(fc(r1:length(fc)),Rx(r1:length(fc)));
    if xCorrelation > minCorr
        xfc = x_fc;
        stop_sign1 = True;
    else
        r1 = r1 + 2;
    end
end

stop_sign2 = False;
r2=1;
while r2 < length(fc) && stop_sign2
    [zCorrelation, ~ , zfc] = regress(fc(r2:length(fc)),Rx(r2:length(fc)));
    if zCorrelation > minCorr
        zfc = z_fc;
        stop_sign2 = True;
    else
        r2 = r2 + 2;
    end
end

processed_data = [x_fc, z_fc]

%falta fazer a regressão
end


disp(Process_Data(100,[file(10:length(file(:,3))-10,3), file(:,5)]))

