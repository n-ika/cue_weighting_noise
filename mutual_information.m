function I = mutual_information(variances_x, variances_c, c_priors, means_c1c2)
% This function serves to find out the most informative cue under the 
% prior of knowing what they are about to hear. That is, it calculates 
% the mutual information of some cue we have chosen and supposing we 
% have stronger priors on some sound categories than on others.
% 
% ARGUMENTS:
% VARIANCES_X: two cue variances stored in a list, i.e. [0.9 0.1]
% VARIANCES_C: two category variances stored in a list (first and 
% the second category respectively), i.e. [0.5 0.5]
% C_PRIORS: a vector with the probabilities of all possible categories,
% i.e. [0.8, 0.2], where the first category has the prior probability of 0.8.
% MEANS_C1C2: a vector representing the means of two possible categories, i.e. 
% [-5,5], where  mu_c1=-5, mu_c2=5.
% 
% RETURNS:
% a number - representing the mutual information: H(x) - H(x|c)

variances_1 = variances_x;
variances_1(end+1) = variances_c(1);

variances_2 = variances_x;
variances_2(end+1) = variances_c(2);

det1 = get_determinant(variances_1);
det2 = get_determinant(variances_2);

Hxc = entropy_Hxc(det1, det2, c_priors);

Hx = sampling_approximation_Hx(c_priors, means_c1c2, variances_x, variances_c);

I = Hx - Hxc;
