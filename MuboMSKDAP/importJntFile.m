function modelgaitDAPgroup72turn = importJntfile(filename, startRow, endRow)
%IMPORTFILE Import numeric data from a text file as a matrix.
%   MODELGAITDAPGROUP72TURN = IMPORTFILE(FILENAME) Reads data from text
%   file FILENAME for the default selection.
%
%   MODELGAITDAPGROUP72TURN = IMPORTFILE(FILENAME, STARTROW, ENDROW) Reads
%   data from rows STARTROW through ENDROW of text file FILENAME.
%
% Example:
%   modelgaitDAPgroup72turn = importfile('model_gait_DAP_group7_2turn.jnt', 4, 111);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2021/11/07 16:10:16

%% Initialize variables.
if nargin<=2
    startRow = 4;
    endRow = inf;
end

%% Format for each line of text:
%   column1: double (%f)
%	column2: text (%s)
%   column3: text (%s)
%	column4: text (%s)
%   column5: text (%s)
%	column6: text (%s)
%   column7: text (%s)
%	column8: text (%s)
%   column9: text (%s)
%	column10: text (%s)
%   column11: text (%s)
%	column12: text (%s)
%   column13: text (%s)
%	column14: text (%s)
%   column15: text (%s)
%	column16: text (%s)
%   column17: text (%s)
%	column18: text (%s)
%   column19: text (%s)
%	column20: text (%s)
%   column21: text (%s)
%	column22: text (%s)
%   column23: text (%s)
%	column24: text (%s)
%   column25: text (%s)
%	column26: text (%s)
%   column27: text (%s)
%	column28: text (%s)
%   column29: text (%s)
%	column30: text (%s)
%   column31: text (%s)
%	column32: text (%s)
%   column33: text (%s)
%	column34: text (%s)
%   column35: text (%s)
%	column36: text (%s)
%   column37: text (%s)
%	column38: text (%s)
%   column39: text (%s)
%	column40: text (%s)
%   column41: text (%s)
%	column42: text (%s)
%   column43: text (%s)
%	column44: text (%s)
%   column45: text (%s)
%	column46: text (%s)
%   column47: text (%s)
%	column48: text (%s)
%   column49: text (%s)
%	column50: text (%s)
%   column51: text (%s)
%	column52: text (%s)
%   column53: text (%s)
%	column54: text (%s)
%   column55: text (%s)
%	column56: text (%s)
%   column57: text (%s)
%	column58: text (%s)
%   column59: text (%s)
%	column60: text (%s)
%   column61: text (%s)
%	column62: text (%s)
%   column63: text (%s)
%	column64: text (%s)
%   column65: text (%s)
%	column66: text (%s)
%   column67: text (%s)
%	column68: text (%s)
%   column69: text (%s)
%	column70: text (%s)
%   column71: text (%s)
%	column72: text (%s)
%   column73: text (%s)
%	column74: text (%s)
%   column75: text (%s)
%	column76: text (%s)
%   column77: text (%s)
%	column78: text (%s)
%   column79: text (%s)
%	column80: double (%f)
%   column81: double (%f)
%	column82: text (%s)
%   column83: double (%f)
%	column84: double (%f)
%   column85: text (%s)
%	column86: double (%f)
%   column87: double (%f)
%	column88: text (%s)
%   column89: double (%f)
%	column90: double (%f)
%   column91: text (%s)
%	column92: double (%f)
%   column93: double (%f)
%	column94: text (%s)
%   column95: double (%f)
%	column96: double (%f)
%   column97: text (%s)
%	column98: double (%f)
%   column99: double (%f)
%	column100: text (%s)
%   column101: double (%f)
%	column102: double (%f)
%   column103: text (%s)
%	column104: double (%f)
%   column105: double (%f)
%	column106: text (%s)
%   column107: double (%f)
%	column108: double (%f)
%   column109: text (%s)
%	column110: text (%s)
%   column111: double (%f)
%	column112: double (%f)
%   column113: double (%f)
%	column114: text (%s)
%   column115: double (%f)
%	column116: double (%f)
%   column117: double (%f)
%	column118: text (%s)
%   column119: double (%f)
%	column120: double (%f)
%   column121: text (%s)
%	column122: double (%f)
%   column123: double (%f)
%	column124: text (%s)
%   column125: double (%f)
%	column126: double (%f)
%   column127: text (%s)
%	column128: double (%f)
%   column129: double (%f)
%	column130: text (%s)
%   column131: double (%f)
%	column132: double (%f)
%   column133: text (%s)
%	column134: double (%f)
%   column135: double (%f)
%	column136: text (%s)
%   column137: double (%f)
%	column138: double (%f)
%   column139: text (%s)
%	column140: double (%f)
%   column141: double (%f)
%	column142: text (%s)
%   column143: double (%f)
%	column144: double (%f)
%   column145: text (%s)
%	column146: double (%f)
%   column147: double (%f)
%	column148: text (%s)
%   column149: double (%f)
%	column150: double (%f)
%   column151: text (%s)
%	column152: double (%f)
%   column153: double (%f)
%	column154: text (%s)
%   column155: double (%f)
%	column156: double (%f)
%   column157: text (%s)
%	column158: double (%f)
%   column159: double (%f)
%	column160: text (%s)
%   column161: double (%f)
%	column162: double (%f)
%   column163: text (%s)
%	column164: double (%f)
%   column165: double (%f)
%	column166: text (%s)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%10f%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17s%17f%17f%17s%17f%17f%17s%17f%17f%17s%17f%17f%17s%17f%17f%17s%17f%17f%17s%17f%17f%17s%17f%17f%17s%17f%17f%17s%17f%17f%17s%17s%17f%17f%17f%17s%17f%17f%17f%17s%17f%17f%17s%17f%17f%17s%17f%17f%17s%17f%17f%17s%17f%17f%17s%17f%17f%17s%17f%17f%17s%17f%17f%17s%17f%17f%17s%17f%17f%17s%17f%17f%17s%17f%17f%17s%17f%17f%17s%17f%17f%17s%17f%17f%17s%17f%17f%s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', '', 'WhiteSpace', '', 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines', startRow(1)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', '', 'WhiteSpace', '', 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines', startRow(block)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% Remove white space around all cell columns.
dataArray{2} = strtrim(dataArray{2});
dataArray{3} = strtrim(dataArray{3});
dataArray{4} = strtrim(dataArray{4});
dataArray{5} = strtrim(dataArray{5});
dataArray{6} = strtrim(dataArray{6});
dataArray{7} = strtrim(dataArray{7});
dataArray{8} = strtrim(dataArray{8});
dataArray{9} = strtrim(dataArray{9});
dataArray{10} = strtrim(dataArray{10});
dataArray{11} = strtrim(dataArray{11});
dataArray{12} = strtrim(dataArray{12});
dataArray{13} = strtrim(dataArray{13});
dataArray{14} = strtrim(dataArray{14});
dataArray{15} = strtrim(dataArray{15});
dataArray{16} = strtrim(dataArray{16});
dataArray{17} = strtrim(dataArray{17});
dataArray{18} = strtrim(dataArray{18});
dataArray{19} = strtrim(dataArray{19});
dataArray{20} = strtrim(dataArray{20});
dataArray{21} = strtrim(dataArray{21});
dataArray{22} = strtrim(dataArray{22});
dataArray{23} = strtrim(dataArray{23});
dataArray{24} = strtrim(dataArray{24});
dataArray{25} = strtrim(dataArray{25});
dataArray{26} = strtrim(dataArray{26});
dataArray{27} = strtrim(dataArray{27});
dataArray{28} = strtrim(dataArray{28});
dataArray{29} = strtrim(dataArray{29});
dataArray{30} = strtrim(dataArray{30});
dataArray{31} = strtrim(dataArray{31});
dataArray{32} = strtrim(dataArray{32});
dataArray{33} = strtrim(dataArray{33});
dataArray{34} = strtrim(dataArray{34});
dataArray{35} = strtrim(dataArray{35});
dataArray{36} = strtrim(dataArray{36});
dataArray{37} = strtrim(dataArray{37});
dataArray{38} = strtrim(dataArray{38});
dataArray{39} = strtrim(dataArray{39});
dataArray{40} = strtrim(dataArray{40});
dataArray{41} = strtrim(dataArray{41});
dataArray{42} = strtrim(dataArray{42});
dataArray{43} = strtrim(dataArray{43});
dataArray{44} = strtrim(dataArray{44});
dataArray{45} = strtrim(dataArray{45});
dataArray{46} = strtrim(dataArray{46});
dataArray{47} = strtrim(dataArray{47});
dataArray{48} = strtrim(dataArray{48});
dataArray{49} = strtrim(dataArray{49});
dataArray{50} = strtrim(dataArray{50});
dataArray{51} = strtrim(dataArray{51});
dataArray{52} = strtrim(dataArray{52});
dataArray{53} = strtrim(dataArray{53});
dataArray{54} = strtrim(dataArray{54});
dataArray{55} = strtrim(dataArray{55});
dataArray{56} = strtrim(dataArray{56});
dataArray{57} = strtrim(dataArray{57});
dataArray{58} = strtrim(dataArray{58});
dataArray{59} = strtrim(dataArray{59});
dataArray{60} = strtrim(dataArray{60});
dataArray{61} = strtrim(dataArray{61});
dataArray{62} = strtrim(dataArray{62});
dataArray{63} = strtrim(dataArray{63});
dataArray{64} = strtrim(dataArray{64});
dataArray{65} = strtrim(dataArray{65});
dataArray{66} = strtrim(dataArray{66});
dataArray{67} = strtrim(dataArray{67});
dataArray{68} = strtrim(dataArray{68});
dataArray{69} = strtrim(dataArray{69});
dataArray{70} = strtrim(dataArray{70});
dataArray{71} = strtrim(dataArray{71});
dataArray{72} = strtrim(dataArray{72});
dataArray{73} = strtrim(dataArray{73});
dataArray{74} = strtrim(dataArray{74});
dataArray{75} = strtrim(dataArray{75});
dataArray{76} = strtrim(dataArray{76});
dataArray{77} = strtrim(dataArray{77});
dataArray{78} = strtrim(dataArray{78});
dataArray{79} = strtrim(dataArray{79});
dataArray{82} = strtrim(dataArray{82});
dataArray{85} = strtrim(dataArray{85});
dataArray{88} = strtrim(dataArray{88});
dataArray{91} = strtrim(dataArray{91});
dataArray{94} = strtrim(dataArray{94});
dataArray{97} = strtrim(dataArray{97});
dataArray{100} = strtrim(dataArray{100});
dataArray{103} = strtrim(dataArray{103});
dataArray{106} = strtrim(dataArray{106});
dataArray{109} = strtrim(dataArray{109});
dataArray{110} = strtrim(dataArray{110});
dataArray{114} = strtrim(dataArray{114});
dataArray{118} = strtrim(dataArray{118});
dataArray{121} = strtrim(dataArray{121});
dataArray{124} = strtrim(dataArray{124});
dataArray{127} = strtrim(dataArray{127});
dataArray{130} = strtrim(dataArray{130});
dataArray{133} = strtrim(dataArray{133});
dataArray{136} = strtrim(dataArray{136});
dataArray{139} = strtrim(dataArray{139});
dataArray{142} = strtrim(dataArray{142});
dataArray{145} = strtrim(dataArray{145});
dataArray{148} = strtrim(dataArray{148});
dataArray{151} = strtrim(dataArray{151});
dataArray{154} = strtrim(dataArray{154});
dataArray{157} = strtrim(dataArray{157});
dataArray{160} = strtrim(dataArray{160});
dataArray{163} = strtrim(dataArray{163});
dataArray{166} = strtrim(dataArray{166});

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Create output variable
dataArray([1, 80, 81, 83, 84, 86, 87, 89, 90, 92, 93, 95, 96, 98, 99, 101, 102, 104, 105, 107, 108, 111, 112, 113, 115, 116, 117, 119, 120, 122, 123, 125, 126, 128, 129, 131, 132, 134, 135, 137, 138, 140, 141, 143, 144, 146, 147, 149, 150, 152, 153, 155, 156, 158, 159, 161, 162, 164, 165]) = cellfun(@(x) num2cell(x), dataArray([1, 80, 81, 83, 84, 86, 87, 89, 90, 92, 93, 95, 96, 98, 99, 101, 102, 104, 105, 107, 108, 111, 112, 113, 115, 116, 117, 119, 120, 122, 123, 125, 126, 128, 129, 131, 132, 134, 135, 137, 138, 140, 141, 143, 144, 146, 147, 149, 150, 152, 153, 155, 156, 158, 159, 161, 162, 164, 165]), 'UniformOutput', false);
dataArray([2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 82, 85, 88, 91, 94, 97, 100, 103, 106, 109, 110, 114, 118, 121, 124, 127, 130, 133, 136, 139, 142, 145, 148, 151, 154, 157, 160, 163, 166]) = cellfun(@(x) mat2cell(x, ones(length(x), 1)), dataArray([2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 82, 85, 88, 91, 94, 97, 100, 103, 106, 109, 110, 114, 118, 121, 124, 127, 130, 133, 136, 139, 142, 145, 148, 151, 154, 157, 160, 163, 166]), 'UniformOutput', false);
modelgaitDAPgroup72turn = [dataArray{1:end-1}];
