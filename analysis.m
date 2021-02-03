
clear all

%% Define test parameters

means = [-5, 5]; % means for c1 and c2
c_priors = [0.8 0.2]; % p(c1) and p(c2)

% Define variances
variances_c = [0.5 0.5];
variances_x1 = [0.1 0.9]; 
variances_x2 = [0.9 0.1];
variances_x_eq = [0.5 0.5];

% Define noise value
noise = 0.5;

% Define variances with added noise of 0.5 to the 1st variance
variances_x1_noise = variances_x1;
variances_x1_noise(1) = variances_x1_noise(1) + noise;

variances_x2_noise = variances_x2;
variances_x2_noise(1) = variances_x2_noise(1) + noise;

variances_x_eq_noise = variances_x_eq;
variances_x_eq_noise(1) = variances_x_eq_noise(1) + noise;

% Define variances with added noise of 0.5 to the 2nd variance
variances_x1_noise2 = variances_x1;
variances_x1_noise2(2) = variances_x1_noise2(2) + noise;

variances_x2_noise2 = variances_x2;
variances_x2_noise2(2) = variances_x2_noise2(2) + noise;

variances_x_eq_noise2 = variances_x_eq;
variances_x_eq_noise2(2) = variances_x_eq_noise2(2) + noise;

% Compute the MI for each case
I1 = mutual_information(variances_x1, variances_c, c_priors, means);
I2 = mutual_information(variances_x2, variances_c, c_priors, means);
I_eq = mutual_information(variances_x_eq, variances_c, c_priors, means);

I1_noise = mutual_information(variances_x1_noise, variances_c, c_priors, means);
I2_noise = mutual_information(variances_x2_noise, variances_c, c_priors, means);
I_eq_noise = mutual_information(variances_x_eq_noise, variances_c, c_priors, means);

I1_noise2 = mutual_information(variances_x1_noise2, variances_c, c_priors, means);
I2_noise2 = mutual_information(variances_x2_noise2, variances_c, c_priors, means);
I_eq_noise2 = mutual_information(variances_x_eq_noise2, variances_c, c_priors, means);



%% Plot w/ respect to mutual information
no_noise = [I1, I_eq, I2];
noise_sigma1 = [I1_noise, I_eq_noise, I2_noise];
noise_sigma2 = [I1_noise2, I_eq_noise2, I2_noise2];

f = figure;
labels = {'\sigma_1^2=0.1','\sigma_1^2=0.5','\sigma_1^2=0.9'};
plot([1, 2, 3], no_noise, 'LineWidth',2.0);
hold on
plot([1, 2, 3], noise_sigma1, 'LineWidth',2.0);
hold on
plot([1, 2, 3], noise_sigma2, 'LineWidth', 2.0);
legend('no noise','noise in cue 1','noise in cue 2');
hold off
set(gca, 'xtick',1:3)
set(gca, 'xticklabel', labels)
ylabel('Mutual Information');
title('Optimal cue weights with respect to noise');