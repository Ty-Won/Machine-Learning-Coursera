function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[M,N] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, N);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%


%Iterate through each centroid and find what the new average position is
%for all points associated with centroid k
for k=1:K
    
    %total points associated with centroid k
    Ck=0;
    sum_of_input=zeros(1,N);
    
    %checks and sums all the data point coordinates associated with
    %centroid k
    for m=1:M
        if(idx(m)==k)
            Ck = Ck+1;
            X_coord=X(m,:);
            sum_of_input=sum_of_input + X_coord;
        end
    end
    %sets the new position of centroid k as the avg coordinates of all the
    %points associated with the kth centroid
    
    centroids(k,:)=sum_of_input/abs(Ck);
    
end








% =============================================================


end

