mkdir('chronux_2_12')
addpath(genpath('chronux_2_12'))

clc; clear;

dataset = matfile('subject1.mat');
dataset_N1 = load('dataset_N1.mat');    
dataset_N1 = dataset_N1.dataset_N1;
dataset_N2 = load('dataset_N2.mat');
dataset_N2 = dataset_N2.dataset_N2;      
dataset_N3 = load('dataset_N3.mat');
dataset_N3 = dataset_N3.dataset_N3;      
dataset_REM = load('dataset_REM.mat');
dataset_REM = dataset_REM.dataset_REM;
dataset_1cycle = load('dataset_1cycle.mat');
dataset_1cycle = dataset_1cycle.dataset_1cycle;
stages_1cycle = load('stages_1cycle.mat');
stages_1cycle = stages_1cycle.stages;
% N1:  114 epochs
% N2:  369 epochs
% N3:  178 epochs
% REM: 101 epochs



sample_num = 20;
epoch_N1 = dataset_N1(sample_num, :);
epoch_N2 = dataset_N2(sample_num, :);
epoch_N3 = dataset_N3(sample_num, :);
epoch_REM = dataset_REM(sample_num, :);

%--------------------------------------------------------------------------

params.Fs     = 200;     % sampling rate 
params.fpass  = [0 20];  % limit the frequency range for display 
params.tapers = [25 49];
movingWin = [30 15];
params.trialave = 0;
params.err = 1;

subplot(3,1,1)
plot(dataset_1cycle)
title("1 Cycle");

subplot(3,1,2)
y_values = [1 2 3 4 5];
y_labels = {'N1', 'N2', 'N3', 'REM', "Wake"};
plot(stages_1cycle);
set(gca, 'Ytick', y_values, 'YTickLabel', y_labels);
grid on 

subplot(3,1,3)
[Sc,t,f]=mtspecgramc(dataset_1cycle,movingWin,params);
imagesc(t,f,Sc');
set(gca,'YDir','normal') % flip the graph
colormap("turbo");


%--------------------------------------------------------------------------
%plots for EEG signals and spectrogram 

params.Fs     = 200;     % sampling rate 
params.fpass  = [0 20];  % limit the frequency range for display 
params.tapers = [3 4];   
movingWin = [0.6 0.1];   
params.trialave = 0;
params.err = 1;

subplot(8,1,1)
plot(epoch_N1)
title("N1");
subplot(8,1,2)
[Sc,t,f]=mtspecgramc(epoch_N1,movingWin,params);
imagesc(t,f,Sc');
set(gca,'YDir','normal') % used to inverse the Y-axis of the plot
colormap("turbo");       % change color of the spectrogram 

subplot(8,1,3)
plot(epoch_N2)
title("N2");
subplot(8,1,4)
[Sc,t,f]=mtspecgramc(epoch_N2,movingWin,params);
imagesc(t,f,Sc');
set(gca,'YDir','normal')
colormap("turbo");

subplot(8,1,5)
plot(epoch_N3)
title("N3");
subplot(8,1,6)
[Sc,t,f]=mtspecgramc(epoch_N3,movingWin,params);
imagesc(t,f,Sc');
set(gca,'YDir','normal')
colormap("turbo");

subplot(8,1,7)
plot(epoch_REM)
title("REM");
subplot(8,1,8)
[Sc,t,f]=mtspecgramc(epoch_REM,movingWin,params);
imagesc(t,f,Sc');
set(gca,'YDir','normal')
colormap("turbo");









