function [bestEpsilon, bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;

stepsize = (max(pval) - min(pval)) / 1000;

%Epsilon for loop cycles through values until the best F1 score is found
for epsilon = min(pval):stepsize:max(pval)
    
    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the F1 score of choosing epsilon as the
    %               threshold and place the value in F1. The code at the
    %               end of the loop will compare the F1 score for this
    %               choice of epsilon and set it to be the best epsilon if
    %               it is better than the current choice of epsilon.
    %               
    % Note: You can use predictions = (pval < epsilon) to get a binary vector
    %       of 0's and 1's of the outlier predictions

    %Stores an array of values between 0 or 1 based on pval<epsilon
    % as a prediction to it being an anomalty or not
    predictions = (pval<epsilon);
    
    %Computing the total number of false positives, true positives and
    %false negatives
    fp = sum((predictions == 1) & (yval == 0));
    tp = sum((predictions == 1) & (yval == 1));
    fn = sum((predictions == 0) & (yval == 1));
    
    %Calculating the precision and recall values
    prec = tp/(tp+fp);
    rec = tp/(tp+fn);
    
    %Determining the F1 score to measure performance of the chosen epsilon
    F1 = (2*prec*rec)/(prec + rec);










    % =============================================================

    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
    end
end

end
