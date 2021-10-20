 
function [processed_data] = ProcessData(fs,coord)

fc = (0.1:0.1:10)
wn = (2 * fc)/fs %normalized cutoff frequency

x = coord(:,1) %posição da coordenada x no file
z = coord(:,2) %posição da coordenada z no file
xf = zeros(length(coord(:,1)),length(fc))
zf = zeros(length(coord(:,2)),length(fc))
Rx = zeros(
i = 1
while i < length(fc)
    [Ab,Bb] = butter(2,wn)
    xf(:,i) = filtfilt(Ab,Bb,x)
    zf(:,i) = filtfilt(Ab,Bb,z)
    Rx = sqrt(sum((x(:) - xf(:,i)).^2)/length(x(:))^2)
    Rz = sqrt(sum((z(:) - zf(:,i)).^2)/length(z(:))^2)
    i = i + 1
end

minCorr = 0.97 %slides

%falta fazer a regressão



%falta fazer a regressão
