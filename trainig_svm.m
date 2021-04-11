X=xlsread('result.xls');
T=zeros(200,1);
for i=100:200
    T(i)=1;
end
T=transpose(T);
mdlSVM = fitcsvm(X,T,'Standardize',true);
nbGauResubErr = resubLoss(mdlSVM);
labels = predict(mdlSVM, X);
labels = transpose(labels);
plotconfusion(T,labels)