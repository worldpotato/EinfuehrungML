function [W1, W2, C] = gradientDescent( W1, W2, alpha, Z0, Y )
% gradientDescent calculates the gradients and performs a gradient
% descent step. It return the modified weights.
%                                                             Sch�ttl 2016

N = size(Z0,1);

%%
% 2.1 compute the forward pass 
% calculate the nodes Z1, Z2 of the layers 
% (sigmoid and softmax) and the cross entropy error C
% TODO: complete the following lines
%%
Z1 = calcSigmoidLayer( Z0, W1);
Z2 = calcSoftmaxLayer( Z1, W2);
C = nCrossEntropy( Z2, Y );
%%

%%
% 2.2 backpropagation
% apply the backpropagation formulas, the results are the backpropagation
% errors (the delta values, dC/du)
% TODO: complete the following lines
%%
delta2 = Z2 - Y;
delta1 = Z1*(1 - Z1) .* W2
%%
delta0 = delta1*W1';  % just for the full picture, is not used

% calculate the gradients
% the loop could be made faster (but is complicated to understand, see below)
dCdW1 = zeros(size(W1,1),size(W1,2));
dCdW2 = zeros(size(W2,1),size(W2,2));
for i=1:N
    dCdW2sample = Z1(i,:)' * delta2(i,:);
    dCdW1sample = Z0(i,:)' * delta1(i,:);
    %% 
    % 2.4 check the gradients by numerically computed gradients
    % TODO: comment in the next line, if the check is successful, comment
    % it out again
    %%
    % checkGradients( dCdW1sample, dCdW2sample, W1, W2, Z0, Y );    
    %%
    dCdW2 = dCdW2 + dCdW2sample;
    dCdW1 = dCdW1 + dCdW1sample;
end
dCdW2 = dCdW2 / N;
dCdW1 = dCdW1 / N;

% note that the whole last section can be tremendously reduced to 
%dCdW2 = Z1' * delta2 / N;
%dCdW1 = Z0' * delta1 / N;

% note (check it!): if we had biases, the gradients with respect to biases 
% would be simply the deltas
% dCdb1 = mean(delta1);
% dCdb2 = mean(delta2);

%%
% 2.3 do gradient descent
% TODO: complete the following lines
%%
W1 = W1- 0.0001* dCdW1;
W2 = W2- 0.0001* dCdW2;
%%
