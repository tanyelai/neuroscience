% For Question 4

load Q4_Data.mat

whos

EEG

%% a)

% compute the ERP of each channel 
erp = mean(EEG.data,3);

% plot first channel
figure(1), clf, hold on
h = plot(EEG.times, squeeze(EEG.data(1,:,:)), 'linew', .5);
set(h, 'color', [1 1 1]*.75)
plot(EEG.times, squeeze(erp(1,:)), 'k', 'linew', 3);
xlabel('Time (ms)'), ylabel('Activity (\muV)')
%set(gca,'xlim',[xmin xmax])


%% b)



% compute the ERP of each channel 
erp = mean(EEG.data,3);

% create signal
srate = EEG.srate;
time  = EEG.times;
signal  = squeeze(erp(1,:));

% Set up a range of values to explore for the 
% input parameters
window_sizes = [256, 512, 1024];
overlap_ratios = [150, 175];
fft_sizes = [128, 256, 512];

%% hann
figure(1), clf
% plot the signal -> window = 256, overlap = 150, fft = 128
i=1; j=1; k=1; 
[powspect,frex,timevec] = spectrogram(signal,hann(window_sizes(i)),overlap_ratios(j),fft_sizes(k),srate);
subplot(2,1,1)
contourf(timevec,frex,abs(powspect),100,'linecolor','none')
set(gca,'ylim',[0 100])
colormap hot
xlabel('Time (s)'), ylabel('Frequency (Hz)')
title('type = hann, window\_size = 256, overlap = 150, fft = 128')
%%%%%%%%


% plot the signal -> window = 512, overlap = 175, fft = 256
i=2; j=2; k=2;
[powspect,frex,timevec] = spectrogram(signal,hann(window_sizes(i)),overlap_ratios(j),fft_sizes(k),srate);
subplot(2,1,2)
contourf(timevec,frex,abs(powspect),100,'linecolor','none')
set(gca,'ylim',[0 100])
colormap hot
xlabel('Time (s)'), ylabel('Frequency (Hz)')
title('type = hann, window\_size = 512, overlap = 175, fft = 256')
%%%%%%%%

figure(2), clf
% plot the signal -> window = 512, overlap = 175, fft = 128
i=2; j=2; k=1;
[powspect,frex,timevec] = spectrogram(signal,hann(window_sizes(i)),overlap_ratios(j),fft_sizes(k),srate);
subplot(2,1,1)
contourf(timevec,frex,abs(powspect),100,'linecolor','none')
set(gca,'ylim',[0 100])
colormap hot
xlabel('Time (s)'), ylabel('Frequency (Hz)')
title('type = hann, window\_size = 512, overlap = 175, fft = 128')
%%%%%%%%%%



% plot the signal -> window = 512, overlap = 175, fft = 512
i=2; j=2; k=3;
[powspect,frex,timevec] = spectrogram(signal,hann(window_sizes(i)),overlap_ratios(j),fft_sizes(k),srate);
subplot(2,1,2)
contourf(timevec,frex,abs(powspect),100,'linecolor','none')
set(gca,'ylim',[0 100])
colormap hot
xlabel('Time (s)'), ylabel('Frequency (Hz)')
title('type = hann, window\_size = 512, overlap = 175, fft = 512')
%%%%%%%%%%


figure(3), clf
% plot the signal -> window = 256, overlap = 150, fft = 512
i=1; j=1; k=3;
[powspect,frex,timevec] = spectrogram(signal,hann(window_sizes(i)),overlap_ratios(j),fft_sizes(k),srate);
subplot(2,1,1)
contourf(timevec,frex,abs(powspect),100,'linecolor','none')
set(gca,'ylim',[0 100])
colormap hot
xlabel('Time (s)'), ylabel('Frequency (Hz)')
title('type = hann, window\_size = 256, overlap = 150, fft = 512')
%%%%%%%%%%


% -> BEST PLOT: window = 175, overlap = 150, fft = 500 
[powspect,frex,timevec] = spectrogram(signal,hann(175),150,500,srate);
subplot(2,1,2)
contourf(timevec,frex,abs(powspect),100,'linecolor','none')
set(gca,'ylim',[0 100])
colormap hot
xlabel('Time (s)'), ylabel('Frequency (Hz)')
title('type = hann, window\_size = 175, overlap = 150, fft = 500')
%%%%%%%%%%



%% Kaiser
%%%%%


figure(1), clf
% plot the signal -> window = 256, overlap = 150, fft = 128
i=1; j=1; k=1; 
[powspect,frex,timevec] = spectrogram(signal,kaiser(window_sizes(i)),overlap_ratios(j),fft_sizes(k),srate);
subplot(2,1,1)
contourf(timevec,frex,abs(powspect),100,'linecolor','none')
set(gca,'ylim',[0 100])
colormap bone
xlabel('Time (s)'), ylabel('Frequency (Hz)')
title('type = kaiser, window\_size = 256, overlap = 150, fft = 128')
%%%%%%%%


% plot the signal -> window = 512, overlap = 175, fft = 256
i=2; j=2; k=2;
[powspect,frex,timevec] = spectrogram(signal,kaiser(window_sizes(i)),overlap_ratios(j),fft_sizes(k),srate);
subplot(2,1,2)
contourf(timevec,frex,abs(powspect),100,'linecolor','none')
set(gca,'ylim',[0 100])
colormap bone
xlabel('Time (s)'), ylabel('Frequency (Hz)')
title('type = kaiser, window\_size = 512, overlap = 175, fft = 256')
%%%%%%%%

figure(2), clf
% plot the signal -> window = 512, overlap = 175, fft = 128
i=2; j=2; k=1;
[powspect,frex,timevec] = spectrogram(signal,kaiser(window_sizes(i)),overlap_ratios(j),fft_sizes(k),srate);
subplot(2,1,1)
contourf(timevec,frex,abs(powspect),100,'linecolor','none')
set(gca,'ylim',[0 100])
colormap bone
xlabel('Time (s)'), ylabel('Frequency (Hz)')
title('type = kaiser, window\_size = 512, overlap = 175, fft = 128')
%%%%%%%%%%



% plot the signal -> window = 512, overlap = 175, fft = 512
i=2; j=2; k=3;
[powspect,frex,timevec] = spectrogram(signal,kaiser(window_sizes(i)),overlap_ratios(j),fft_sizes(k),srate);
subplot(2,1,2)
contourf(timevec,frex,abs(powspect),100,'linecolor','none')
set(gca,'ylim',[0 100])
colormap bone
xlabel('Time (s)'), ylabel('Frequency (Hz)')
title('type = kaiser, window\_size = 512, overlap = 175, fft = 512')
%%%%%%%%%%


figure(3), clf
% plot the signal -> window = 256, overlap = 150, fft = 512
i=1; j=1; k=3;
[powspect,frex,timevec] = spectrogram(signal,kaiser(window_sizes(i)),overlap_ratios(j),fft_sizes(k),srate);
subplot(2,1,1)
contourf(timevec,frex,abs(powspect),100,'linecolor','none')
set(gca,'ylim',[0 100])
colormap bone
xlabel('Time (s)'), ylabel('Frequency (Hz)')
title('type = kaiser, window\_size = 256, overlap = 150, fft = 512')
%%%%%%%%%%


% -> BEST PLOT: window = 175, overlap = 150, fft = 500 
[powspect,frex,timevec] = spectrogram(signal,kaiser(175),150,500,srate);
subplot(2,1,2)
contourf(timevec,frex,abs(powspect),100,'linecolor','none')
set(gca,'ylim',[0 100])
colormap bone
xlabel('Time (s)'), ylabel('Frequency (Hz)')
title('type = kaiser, window\_size = 175, overlap = 150, fft = 500')
%%%%%%%%%%


%% flattopwin



figure(1), clf
% plot the signal -> window = 256, overlap = 150, fft = 128
i=1; j=1; k=1; 
[powspect,frex,timevec] = spectrogram(signal,flattopwin(window_sizes(i)),overlap_ratios(j),fft_sizes(k),srate);
subplot(2,1,1)
contourf(timevec,frex,abs(powspect),100,'linecolor','none')
set(gca,'ylim',[0 100])
colormap jet
xlabel('Time (s)'), ylabel('Frequency (Hz)')
title('type = flattopwin, window\_size = 256, overlap = 150, fft = 128')
%%%%%%%%


% plot the signal -> window = 512, overlap = 175, fft = 256
i=2; j=2; k=2;
[powspect,frex,timevec] = spectrogram(signal,flattopwin(window_sizes(i)),overlap_ratios(j),fft_sizes(k),srate);
subplot(2,1,2)
contourf(timevec,frex,abs(powspect),100,'linecolor','none')
set(gca,'ylim',[0 100])
colormap jet
xlabel('Time (s)'), ylabel('Frequency (Hz)')
title('type = flattopwin, window\_size = 512, overlap = 175, fft = 256')
%%%%%%%%

figure(2), clf
% plot the signal -> window = 512, overlap = 175, fft = 128
i=2; j=2; k=1;
[powspect,frex,timevec] = spectrogram(signal,flattopwin(window_sizes(i)),overlap_ratios(j),fft_sizes(k),srate);
subplot(2,1,1)
contourf(timevec,frex,abs(powspect),100,'linecolor','none')
set(gca,'ylim',[0 100])
colormap jet
xlabel('Time (s)'), ylabel('Frequency (Hz)')
title('type = flattopwin, window\_size = 512, overlap = 175, fft = 128')
%%%%%%%%%%



% plot the signal -> window = 512, overlap = 175, fft = 512
i=2; j=2; k=3;
[powspect,frex,timevec] = spectrogram(signal,flattopwin(window_sizes(i)),overlap_ratios(j),fft_sizes(k),srate);
subplot(2,1,2)
contourf(timevec,frex,abs(powspect),100,'linecolor','none')
set(gca,'ylim',[0 100])
colormap jet
xlabel('Time (s)'), ylabel('Frequency (Hz)')
title('type = flattopwin, window\_size = 512, overlap = 175, fft = 512')
%%%%%%%%%%


figure(3), clf
% plot the signal -> window = 256, overlap = 150, fft = 512
i=1; j=1; k=3;
[powspect,frex,timevec] = spectrogram(signal,flattopwin(window_sizes(i)),overlap_ratios(j),fft_sizes(k),srate);
subplot(2,1,1)
contourf(timevec,frex,abs(powspect),100,'linecolor','none')
set(gca,'ylim',[0 100])
colormap jet
xlabel('Time (s)'), ylabel('Frequency (Hz)')
title('type = flattopwin, window\_size = 256, overlap = 150, fft = 512')
%%%%%%%%%%


% -> BEST PLOT: window = 175, overlap = 150, fft = 500 
[powspect,frex,timevec] = spectrogram(signal,flattopwin(175),150,500,srate);
subplot(2,1,2)
contourf(timevec,frex,abs(powspect),100,'linecolor','none')
set(gca,'ylim',[0 100])
colormap jet
xlabel('Time (s)'), ylabel('Frequency (Hz)')
title('type = flattopwin, window\_size = 175, overlap = 150, fft = 500')
%%%%%%%%%%


