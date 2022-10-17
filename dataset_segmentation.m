clc; clear;

N1 = readvars('1_1.xlsx','Sheet','Sheet1','Range','P1:P925');
N1 = rmmissing(N1);
N2 = readvars('1_1.xlsx','Sheet','Sheet1','Range','Q1:Q925');
N2 = rmmissing(N2);
N3 = readvars('1_1.xlsx','Sheet','Sheet1','Range','R1:R925');
N3 = rmmissing(N3);
REM = readvars('1_1.xlsx','Sheet','Sheet1','Range','S1:S925');
REM = rmmissing(REM);
% N1:  114 epochs
% N2:  369 epochs
% N3:  178 epochs
% REM: 101 epochs

% extract a full cycle from original dataset: 326-525 in 1_1
dataset = matfile('subject1.mat');
dataset_1cycle = [];
for i = 326:525
    dataset_1cycle = [dataset_1cycle, dataset.C3_A2(i, :)];
end



