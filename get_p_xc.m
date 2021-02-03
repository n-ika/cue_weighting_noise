function p_xc = get_p_xc(means, variances)

% Get likelihood p(x|c) for the two part cue
% 
% ARGUMENTS:
% MEANS: a vector of means of cue parts and of the category, i.e. [-1,1,5]
% VARIANCES: a vector of variances of cue parts and of the category, i.e.
% [0.9 0.1 0.5]
% 
% RETURNS: a number p(x|c)

x1 = means(1);
x2 = means(2);
mu_c = means(end);

sigma_1 = variances(1);
sigma_2 =variances(2);
sigma_c = variances(end);

det = (sigma_1*sigma_c + sigma_2*sigma_c + sigma_1*sigma_2);

exp_nominator = (x1-x2)^2*sigma_c + (x1-mu_c)^2*sigma_2 + (x2-mu_c)^2*sigma_1;
p_xc = ( 1/(2*pi*sqrt(det)) ) * exp( -1/2*(exp_nominator/det) );