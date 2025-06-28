%% This code is by Saeed Mohseni seh deh:
tic
%% initialization:
clear; clc; close all;
addpath("Functions");
%% Parameters:
N_train = [100, 500];
N_test = [100, 500];
indicator = [1,2,3];
len_scale = .01:.01:2;
dim = 8;
%% Data Loading:
X_train_100 = load("Dataset/X_train_100.mat").X_train_100;
X_test_100 = load("Dataset/X_test_100.mat").X_test_100;
Y_train_100 = load("Dataset/Y_train_100.mat").Y_train_100;
Y_test_100 = load("Dataset/Y_test_100.mat").Y_test_100;

X_train_500 = load("Dataset/X_train_500.mat").X_train_500;
X_test_500 = load("Dataset/X_test_500.mat").X_test_500;
Y_train_500 = load("Dataset/Y_train_500.mat").Y_train_500;
Y_test_500 = load("Dataset/Y_test_500.mat").Y_test_500;

SampCupe = load("SampCube.mat").SampCube;
%% Output variables:
MSE_All = zeros(size(N_train,2), size(indicator,2)); 
MSE = zeros(size(N_train,2), size(len_scale,2));
Fig_data = cell(8,2,3);
%% MSE calculation of all methods:
for i = 2:3
    [cov_mat_in, s_opt] = GPR_fit(X_train_100, Y_train_100, indicator(i));
    [Y_predict, ~] = GPR_predict(X_train_100, Y_train_100, X_test_100, cov_mat_in, s_opt, indicator(i));
    MSE_All(1,i) = Evaluate(Y_predict, Y_test_100);
end

for i = 2:3
    [cov_mat_in, s_opt] = GPR_fit(X_train_500, Y_train_500, indicator(i));
    [Y_predict, ~] = GPR_predict(X_train_500, Y_train_500, X_test_500, cov_mat_in, s_opt, indicator(i));
    MSE_All(2,i) = Evaluate(Y_predict, Y_test_500);
end
save("Results/MSE_All","MSE_All");
%% Figure Data:
for i = 1:3
    for j = 1:dim
        [cov_mat_in, s_opt] = GPR_fit(X_train_100, Y_train_100, indicator(i));
        [Y_predict, sigma] = GPR_predict(X_train_100, Y_train_100, SampCupe(:,:,j), cov_mat_in, s_opt, indicator(i));
        Fig_data{j,1,i} = [Y_predict, sigma];
    end
end

for i = 1:3
    for j = 1:dim
        [cov_mat_in, s_opt] = GPR_fit(X_train_500, Y_train_500, indicator(i));
        [Y_predict, sigma] = GPR_predict(X_train_500, Y_train_500, SampCupe(:,:,j), cov_mat_in, s_opt, indicator(i));
        Fig_data{j,2,i} = [Y_predict, sigma];
    end
end
save("Results/Fig_data","Fig_data");
toc
