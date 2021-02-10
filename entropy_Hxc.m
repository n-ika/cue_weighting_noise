function H_xc = entropy_Hxc(det1, det2, c_priors)

% This function calculates the entropy of the category given the cue
% vector. 
% 
% ARGUMENTS:
% DET1 and DET2: numbers, representing the determinants of p(x|c1) and 
% p(x|c2), where c1 and c2 are categories and x is the cue vector
% C_PRIORS: a vector with the probabilities of all possible categories,
% i.e. [0.8, 0.2], where the first category has the prior probability of 0.8.
% 
% RETURNS:
% a number (H_xc) - representing the entropy of c given x

% diff_entropy_1 = 1/2 * log2( ((2*pi*exp(1))^n) * det1 );
% diff_entropy_2 = 1/2 * log2( ((2*pi*exp(1))^n) * det2 );

diff_entropy_1 = log2(2*pi*exp(1)) + 1/2*log2(det1);
diff_entropy_2 = log2(2*pi*exp(1)) + 1/2*log2(det2);

H_xc = c_priors(1) * diff_entropy_1 + c_priors(2) * diff_entropy_2;