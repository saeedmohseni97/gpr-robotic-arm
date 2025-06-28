function [X_train, Y_train, X_test, Y_test] = DataGenerator(N_train, N_test)
dim = 8;

X_train = lhsdesign(N_train, dim); X_train(:,1:4) = X_train(:,1:4) * 2*pi; 
Y_train = F_uv(X_train);

X_test = lhsdesign(N_test, dim); X_test(:,1:4) = X_test(:,1:4) * 2*pi;
Y_test = F_uv(X_test);
end