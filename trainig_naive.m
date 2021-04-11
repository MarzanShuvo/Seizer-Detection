X=xlsread('result.xls');
T=zeros(200,1);
for i=100:200
    T(i)=1;
end
T=transpose(T);
naive_bayes = fitcnb(X,T);
nbGauResubErr = resubLoss(naive_bayes);
labels = predict(naive_bayes, X);
labels = transpose(labels);
plotconfusion(T,labels);