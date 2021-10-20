file = readtsvCustom("trial_0011_g05.tsv");
% disp(file{:,3});
% disp(file{:,5});
%disp([file{:,3}, file{:,5}])

function [processed_data] = ProcessData(fs,coord)

fc = (0.1:0.1:10);
wn = (2 * fc)/fs; %normalized cutoff frequency

x = coord(:,1); %posição da coordenada x no file
z = coord(:,2); %posição da coordenada z no file
xf = zeros(length(coord(:,1)),length(fc));
zf = zeros(length(coord(:,2)),length(fc));

i = 1;
while i < length(fc)
    [Ab,Bb] = butter(2,wn, 'low');
    xf(:,i) = filtfilt(Ab,Bb,x);
    disp(xf);
    zf(:,i) = filtfilt(Ab,Bb,z);
    disp(zf);
    Rx = sqrt(sum((x(:) - xf(:,i)).^2)/length(x(:))^2);
    Rz = sqrt(sum((z(:) - zf(:,i)).^2)/length(z(:))^2);
    i = i + 1;
end

minCorr = 0.90; %slides
processed_data = [xf,zf];
disp(processed_data);
%falta fazer a regressão


%falta fazer a regressão
end


disp(Process_Data(100,[file(10:length(file(:,3))-10,3), file(:,5)]))

