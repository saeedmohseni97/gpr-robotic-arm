function [cov_mat, s_opt] = GPR_fit(X_train, Y_train, indicator)
num_train = size(X_train,1);
cov_mat = zeros(num_train, num_train);
if(indicator == 1)
    
    fun = @(theta) (0.5) * Y_train' / inv(SECovariance(X_train, theta)) * Y_train + (0.5) * log (det(SECovariance(X_train, theta)));
    s_opt = fmincon(fun, .01, -1, 0, [], [], .01, .45);
    
    for i = 1:num_train
        for j = 1:num_train
            cov_mat(i,j) = exp((-norm((X_train(i,:) - X_train(j,:)))^2) * s_opt);
        end
    end

elseif(indicator == 2)
        for i = 1:num_train
            for j = 1:num_train
                cov_mat(i,j) = X_train(i,:) * X_train(j,:)';
            end
        end
        s_opt = 0;
else
    for i = 1:num_train
        for j = 1:num_train
            cov_mat(i,j) = double(isequal(X_train(i,:), X_train(j,:)));
        end
    end
    s_opt = 0;
end

