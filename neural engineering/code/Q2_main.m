% For Question 2

load Q2_Data.mat

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



%% b) power spectrums


%%%
% Power spectrum of the first trial of channel 1.
% Use the x-axis limits as [0 100] Hz
hz = linspace(0,EEG.srate,EEG.pnts);
pw = (2*abs(fft(squeeze(EEG.data(1,:,1)),[],1)/EEG.pnts)).^2;
subplot(311), hold on
plot(hz,pw,'linew',2)
set(gca,'xlim',[0 100])
xlabel('Frequency (Hz)'), ylabel('Power')
title('Task1: Static power spectrum')

%%%

%%%
% Power spectrum of the averaged trials in time domain 
% for channel 1. Use the x-axis limits as [0 100] Hz.
hz = linspace(0,EEG.srate,EEG.pnts);
pw = (2*abs(fft(squeeze(mean(EEG.data(1,:,:),3)),[],1)/EEG.pnts)).^2;
subplot(312)
plot(hz,pw,'linew',2)
set(gca,'xlim',[0 100])
xlabel('Frequency (Hz)'), ylabel('Power')
title('Task2: Static power spectrum')


%%%
% Power spectrum calculated by averaging the
% Fourier representations of individual trials for channel 1. 
% Use the xaxis limits as [0 100] Hz.

hz = linspace(0,EEG.srate,EEG.pnts);
pw = mean((2*abs(fft(squeeze(EEG.data(1,:,:)),[],1)/EEG.pnts)).^2,2);
subplot(313)
plot(hz,pw,'linew',2)
set(gca,'xlim',[0 100])
xlabel('Frequency (Hz)'), ylabel('Power')
title('Task3: Static power spectrum')


