% For Question 1 
%% a) Please give the specification details of each dataset 
%    including the sampling rate, number of channels, number of 
%     trials and the length of each trial (in seconds).

load Q1_Data1.mat

% To figure out how we can reach inside of the data
whos

% whos provide "EEG" as name to explore data file
EEG

%% 

load Q1_Data2.mat
whos
EEG

%%

load Q1_Data3.mat
whos
EEG


%% b) plot ERPs and topographical maps
% task: compute the ERP of first channel 

% ERP is the time-domain average across 
% all trials at each time point
erp = mean(EEG.data,3); % how we can get erp

% the function below takes at least one argument (EEG),
% and optionally a second argument (channel number),
% and optionally a third argument (figure number)
plot_simEEG(EEG,1,1)
plot_simEEG(EEG,1,2)
plot_simEEG(EEG,1,3)




