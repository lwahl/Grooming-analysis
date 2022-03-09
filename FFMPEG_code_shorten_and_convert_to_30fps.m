a = "ffmpeg -ss 00:00:00 -i ";
% b = file;
c = ".avi"
d = " -ss 00:00:00 -t 00:36:36 -c copy ";
% e = file
f = ".mp4"
g = " && "

h = "ffmpeg -y -i ";
% i = file;
j = ".mp4";
k = " -vf ""setpts=0.8333333*PTS"" -r 30 ";
% l = file;
m = "_out_30fps.mp4 && ";

n = "ffmpeg -ss 00:00:25 -r 30 -i ";
% o = file;
p = ".mp4";
q = " -ss 00:00:00 -t 00:30:00 -c copy ";
% r = file;
s = "_30fps.avi";


myFolder = uigetdir(' ','Select folder with videos'); %gets directory with JAABA result files
           
filePattern = fullfile(myFolder, '*.avi'); % Only select files with this extension
theFiles = dir(filePattern); %make list of files

for z=1:length(theFiles)
[folder, baseFileNameNoExt, extension] = fileparts(theFiles(z).name);
nameList{z,1} = baseFileNameNoExt;
b = nameList{z,1};
e = nameList{z,1};
i = nameList{z,1};
l = nameList{z,1};
o = nameList{z,1};
r = nameList{z,1};

part1 = a + b + c + d + e + f + g;
part2 = h + i + j + k + l + m;
part3 = n + o + p + q + r + s;

syntax = part1 + part2 + part3;
nameList{z,2} = syntax;
end




