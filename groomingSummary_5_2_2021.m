myFolder = uigetdir(); % Specify the folder with  all of the separate result output files

% Get a list of all files in the folder with the desired file name pattern.
filePattern = fullfile(myFolder, '*min.mat'); % Change to whatever pattern your files have in your classifier output.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
  
  load(fullFileName);
  
  groomingBoutStartFrames = allScores.t0s;
  groomingBoutStopFrames = allScores.t1s;
  
   a = size(allScores.t0s{1,1});
  amountOfGroomings = a(1,2);
%   clear a;
  
  grooming_scores_summary{1,1} = 'File Name';
  grooming_scores_summary{1,2} = 'Amount of groomings';
  
  grooming_scores_summary{(3*k),3} = 'Start frames of groomings';
  grooming_scores_summary{1+(3*k),3} = 'Stop frames of groomings';
  grooming_scores_summary{2+(3*k),3} = 'Bout duration';
  
   grooming_scores_summary{(3*k),1} = baseFileName;
   
%    grooming_scores_summary{1+(2*k),1} = baseFileName;
   grooming_scores_summary{(3*k),2} = amountOfGroomings;
%    grooming_scores_summary{1+(2*k),2} = amountOfGroomings;

%   
     for m = 1 : length(groomingBoutStartFrames{1,1})
%   
     grooming_scores_summary{3*k,3+m} =   groomingBoutStartFrames{1,1}(1,m);
     grooming_scores_summary{1+(3*k),3+m} =   groomingBoutStopFrames{1,1}(1,m);
    
     
     startStopframes = {groomingBoutStartFrames{1,1};groomingBoutStopFrames{1,1}};
   
     boutDurations = startStopframes{2,1}-startStopframes{1,1};
     averageBoutDuration = mean(boutDurations);
     totalBoutDuration = sum(boutDurations);

     grooming_scores_summary{2+(3*k),3+m} =   boutDurations(1,m);
     
     end  
     
   grooming_scores_summary{2+(3*k),5+m} =   mean(boutDurations);  
   grooming_scores_summary{2+(3*k),6+m} =   sum(boutDurations);  
   
  
   %summary data tab
   data_summary{1,1} = 'File Name';
   data_summary{1,2} = 'Amount of bouts';
   data_summary{1,3} = 'Average bout duration';
   data_summary{1,4} = 'Total bout duration';
   
   data_summary{(1+k),1} = baseFileName;
   data_summary{(1+k),2} = amountOfGroomings;
   data_summary{(1+k),3} = mean(boutDurations);  
   data_summary{(1+k),4} = sum(boutDurations); 
   
   
end


%saving data
writecell(grooming_scores_summary,myFolder + "\" + "Grooming_scores_summary.xls",'sheet',1)
writecell(data_summary,myFolder + "\" + "Grooming_scores_summary.xls",'sheet',2)


%saving all data in an excel file
%nameOfVariable = 'grooming_scores_summary';
%outputFolder = uigetdir();
%fullPath=fullfile([char(outputFolder)], [nameOfVariable '.xls']);
%xlswrite(fullPath, grooming_scores_summary);



msgbox('Done!');
clear
