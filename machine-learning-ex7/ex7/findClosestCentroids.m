function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.


M=size(X,1);
%Iterate through each test set in the input
for m=1:M
    %an array to keep track of all distances from one test point to all the
    %centroids
    dist_array = zeros(1,K);
    
    %For every test point 1:M, Iterates through K centroids and store the
    %distances between every centroid with respect to the current m test
    %example thats being tested
    for k=1:K
        dist_array(1,k)= sqrt(sum(power(X(m,:)-centroids(k,:),2)));
    end
    
    %find the minimum distance and return the index which is also the
    %centroid number that presents the lowest distance
    [value,centroid_number]=min(dist_array);
    idx(m,1)=centroid_number;
end







% =============================================================

end

