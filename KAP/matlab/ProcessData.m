 
function [processed_data] = ProcessData(fs,coord)


wn = (2 * fc)/fs %normalized cutoff frequency
fc = (1:0.5:100)

i = 1
j = 3
while i < length(fc)
    x = coord(:,j) %posição da coordenada x no file
    z = coord(:,j+2) %posição da coordenada z no file
    [Ab,Bb] = butter(2,wn)
    xf(:,i) = filtfilt(Ab,Bb,x)
    zf(:,i) = filtfilt(Ab,Bb,z)
    Rx = sqrt(sum((x(:) - xf(:,i)).^2)/length(x(:))^2)
    Rz = sqrt(sum((z(:) - zf(:,i).^2)/length(z(:))^2)
    i = i + 1
    j = j + 3
end

