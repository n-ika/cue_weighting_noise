function Hx = sampling_approximation_Hx(c_priors, means_c1c2, variances_x, variances_c)

% This function calculates the entropy of all the possible cues:
% p(x) = sum_c [ p(c,x) ] = sum_c [ p(c) * p(x|c) ]
% 
% ARGUMENTS:
% C_PRIORS: the probability of the prior over the categories, i.e. [0.8
% 0.2], where p(c1) = 0.8
% MEANS_C1C2: a vector representing the means of two possible categories, i.e. 
% [-5,5], where  mu_c1=-5, mu_c2=5.
% VARIANCES_X: two cue variances stored in a list, i.e. [0.9 0.1]
% VARIANCES_C: two category variances stored in a list (first and 
% the second category respectively), i.e. [0.5 0.5]
% 
% RETURNS:
% a number (Hx) - representing the entropy of x

dt = 0.01; % since this is an approximation of the integral of p(x)*log(p(x)),
% we chose to multiply the height of each p(x)*log(p(x)) value
% with an area of the base and sum over them, i.e. 0.01 

mean_c1 = means_c1c2(1);
mean_c2 = means_c1c2(2);

sigma1 = variances_x(1); 
sigma2 = variances_x(2);
sigma_c1 = variances_c(1);
sigma_c2 = variances_c(2); 

Hx = 0;
x = [-15:dt:15];

for i=1:length(x)
    for j=1:length(x)
        % compute p(x|c) for each category
        p_xc1 = get_p_xc([x(i), x(j), mean_c1], [sigma1, sigma2, sigma_c1]);
        p_xc2 = get_p_xc([x(i), x(j), mean_c2], [sigma1, sigma2, sigma_c2]);
        % compute sum_c [ p(c) * p(x|c) ]
        p_x = c_priors(1) * p_xc1 + c_priors(2) * p_xc2;
        % compute p(x)*log p(x), times the area
        Hxdt = p_x*log2(p_x)*dt^2;
        % compute the sum over x
        Hx = Hx - Hxdt;
    end
end
