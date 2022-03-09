
a = "ffmpeg -ss 00:00:00 -i ";
% b = file;
c = ".avi";
d = " -ss 00:00:25 -t 00:30:00 -c copy ";
% e = file
f = "_shortened.avi";
g = " & ";

myFolder = uigetdir(' ','Select folder with videos'); %gets directory with JAABA result files
           
filePattern = fullfile(myFolder, '*.avi'); % Only select files with this extension
theFiles = dir(filePattern); %make list of files

for z=1:length(theFiles)
[folder, baseFileNameNoExt, extension] = fileparts(theFiles(z).name);
nameList{z,1} = baseFileNameNoExt;
b = nameList{z,1};
e = nameList{z,1};


syntax = a + b + c + d + e + f + g;

nameList{z,2} = syntax;
end




