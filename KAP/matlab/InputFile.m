file = readtsvCustom("trial_0011_static.tsv");
global origin
origin = [file{1,30}, file{1,32}];

 %% Starting to write the new file model.txt%%

 fileGait = fopen('model_gait.txt','w');
 fileKick = fopen('model_kick.txt','w');



 %% End of the files %%
 fprintf(fileGait,'%6.2f %6.2f\r\n',[12, 1e-7]);
 fprintf(fileGait,'%6.2f %6.2f %6.2f\r\n', [0, 0.01, 5]);
 fprintf(fileKick,'%6.2f %6.2f\r\n',[12, 1e-7]);
 fprintf(fileKick,'%6.2f %6.2f %6.2f\r\n',[0, 0.01, 5]);


