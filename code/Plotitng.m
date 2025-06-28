%% initialization:
clear; clc; close all;
addpath("Functions");
%% parameters:
dim = 8;
indicator = [1,2,3];
N = [100, 500];
len_scale = .01:.01:2;
%% Loading:
SampCupe = load("SampCube.mat").SampCube;
Fig_data = load("Results/Fig_data.mat").Fig_data;
MSE = load("Results/MSE.mat").MSE;
%% Plotting:
num = 1;
for i = 1:3
    for k = 1:2
        for j = 1:dim
            Y_predict = Fig_data{j, k, i}(:,1);
            sigma = Fig_data{j, k, i}(:,2);
            X = SampCupe(:,:,j);
            Y_true = F_uv(X);
            x = SampCupe(:,j,j);
            
            figure;
            hold on
            plot(x, Y_true, 'r.', 'MarkerSize', 10, 'DisplayName', 'True value');
            plot(x, Y_predict, 'b-', 'DisplayName', 'GP Mean');
            fill([x; flipud(x)], [Y_predict-sigma; flipud(Y_predict+sigma)], 'b', 'FaceAlpha', 0.3, 'EdgeColor', 'none', 'DisplayName', '±1 std. dev.');
            if(j<=4)
                x_label = '\theta_' + string(j);
            else
                x_label = "L_" + string(j-4);
            end
            xlabel(x_label);
            ylabel('F');
            title('GPR (' + x_label+' varies, others fixed)');
            set(gca, 'FontSize', 20);
            legend('show');
            hold off
            filename = 'Figs/Par'+string(j)+'_ind'+string(i)+'_N'+string(N(k))+'.pdf';
            saveas(gcf, filename);

        end
    end
end



%%
close all
for i=1:2
    figure;
    plot(len_scale, MSE(i,:), 'LineWidth',2);
    xlabel('length scale parameter')
    ylabel('MSE')
    title("Length scale parameter effect");
    set(gca, 'FontSize', 20);
    filename = 'Figs/MSE'+string(i)+'.pdf';
    saveas(gcf, filename);
end
       
