mkdir('chronux_2_12')
addpath(genpath('chronux_2_12'))
clc; clear;

% get the time and raw data from parsed csv file
tgam_data = readtable('parse_0.csv');
time = tgam_data.Time;
raw_value = tgam_data.Raw_Wave;
raw_value = rmmissing(raw_value);

% plot the eeg signal waveform and spectrogram
params.Fs     = 512;     % sampling rate 
params.fpass  = [0 30];  % limit the frequency range for display 
params.tapers = [2 3];
movingWin = [0.6 0.1];
params.trialave = 0;
params.err = 1;

subplot(2,1,1)
plot(raw_value);
title("Eye open and close");

subplot(2,1,2)
[Sc,t,f]=mtspecgramc(raw_value,movingWin,params);
imagesc(t,f,Sc');
set(gca,'YDir','normal') % flip the graph
colormap("turbo");