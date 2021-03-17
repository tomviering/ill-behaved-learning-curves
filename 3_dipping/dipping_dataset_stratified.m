function [Xall, Yall] = dipping_dataset_stratified(N)
% generates N positive samples and N negative samples from the dipping
% dataset

Npos = N;
Nneg = N;

p = rand(Npos,1);
X = rand(Npos,1)-0.5;
Y = ones(Npos,1);

p2 = rand(Nneg,1);
X2 = rand(Nneg,1)-0.5;
Y2 = -ones(Nneg,1);

X2(p2 < 0.5) = X2(p2 < 0.5)+2;
X2(p2 >= 0.5) = X2(p2 >= 0.5)-2;

Xall = [X;X2];
Yall = [Y;Y2];

