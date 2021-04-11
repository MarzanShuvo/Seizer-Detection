X=xlsread('result.xls');
T=zeros(200,1);
for i=100:200
    T(i)=1;
end
T=transpose(T);
tree = fitctree(X,T);
nbGauResubErr = resubLoss(tree);
labels = predict(tree, X);
labels = transpose(labels);
plotconfusion(T,labels);