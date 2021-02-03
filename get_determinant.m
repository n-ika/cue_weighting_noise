function det = get_determinant(variances)
% Get the determinant for the two part cue
% 
% ARGUMENTS:
% VARIANCES: a matrix of variances of cue parts and of the category
% 
% RETURNS: a number corresponding to the determinant

det = (variances(1)*variances(end) + variances(2)*variances(end) + variances(1)*variances(2));