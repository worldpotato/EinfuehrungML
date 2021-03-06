X = createBlob()
N = size(X,1);

% 1.
%figure(1)
clf
% TODO: plot the data in X, comment in the following line
%%
%plot3(X(:,1), X(:,2), X(:,3), '*')
%%
%grid on
%axis equal

% 2.
% TODO: comment in and complete the following lines to normalize the data
% in X. Do not add a semicolon at the end of the first two lines. Xbar
% shall contain one row with the mean value of all features, Xsig shall
% contain one row with the standard deviation of all features
%%
Xbar = mean(X)
Xsig = std(X)
Xnormalized = (X - Xbar)./Xsig;
%%
% 3.
% TODO: comment in the following lines, add the code for plotting the
% normalized data
%%
%figure(2)
%clf
%plot3(Xnormalized(:,1), X(:,2), X(:,3), '*') 
%grid on
%%

% 4.
% TODO: comment in the following lines, add the code to choose initial
% centroid values and to call the kmeans algorithm. The variable k defines
% the number of requested clusters. The initial centroids can be defined
% by normal distributed random numbers with standard deviation 0.1 and
% mean value 0. Use the function randn.
%%
k = 6;
centroidsguess = rand(k,3)
c = kmeans(Xnormalized, k, centroidsguess, 400, 100 );
col = 'bgryckbgryckbgryckbgryckbgryck';
%figure(3)
clf
for i=1:k
    I = find(c==i);
    plot3(Xnormalized(I,1), Xnormalized(I,2), Xnormalized(I,3), ['.' col(i)] );
    hold on
end
grid on
%%
