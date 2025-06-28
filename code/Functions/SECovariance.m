function cov_mat = SECovariance(X_train, theta)
num_train = size(X_train,1);
cov_mat = zeros(num_train, num_train);
for i = 1:num_train
    for j = 1:num_train
        cov_mat(i,j) = exp((-norm((X_train(i,:) - X_train(j,:)))^2)*theta);
    end
end
end

