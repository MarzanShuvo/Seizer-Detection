clc
%CODE FOR APPROXIMATE ENTROPY (main signal) : 
feature = [];
a=textread('S012.txt','%f');
aprroximate = approx_entropy(2,0.5,a);
feature = [feature, aprroximate];
plot(a)
%%
%CODE FOR APPROXIMATE ENTROPY (d3 Sub-band)
i=1;
anNw=zeros(1,1);
a=textread('S012.txt','%f');
[C,L] = wavedec(a,7,'db4');
D3 = wrcoef('d',C,L,'db4',3);
anNw(i)=approx_entropy(2,0.5,D3);
disp( anNw(i)) ;  
i=i+1;
feature = [feature, anNw];
%%
%d4
i=1;
anNw4=zeros(1,1);
a=textread('S012.txt','%f');
[C,L] = wavedec(a,7,'db4');
D4 = wrcoef('d',C,L,'db4',4);
anNw4(i)=approx_entropy(2,0.5,D4);
disp( anNw4(i)) ;  
i=i+1;
feature = [feature, anNw4];
%%
%d5
i=1;
anNw5=zeros(1,1);
a=textread('S012.txt','%f');
[C,L] = wavedec(a,7,'db4');
D5 = wrcoef('d',C,L,'db4',5);
anNw5(i)=approx_entropy(2,0.5,D5);
disp( anNw5(i)) ;  
i=i+1;
feature = [feature, anNw5];
%%
%d
i=1;
anNw=zeros(1,1);
a=textread('S012.txt','%f');
[C,L] = wavedec(a,7,'db4');
D6 = wrcoef('d',C,L,'db4',6);
anNw6(i)=approx_entropy(2,0.5,D6);
disp( anNw6(i)) ;  
i=i+1;
feature = [feature, anNw6];
%%
%d7
i=1;
anNw=zeros(1,1);
a=textread('S012.txt','%f');
[C,L] = wavedec(a,7,'db4');
D7 = wrcoef('d',C,L,'db4',7);
anNw7(i)=approx_entropy(2,0.5,D7);
disp( anNw7(i)) ;  
i=i+1;
feature = [feature, anNw7];

%%
%CODE FOR SAMPLE ENTROPY (main signal) 
amp=zeros(1,1);
i=1;
a=textread('S012.txt','%f');
amp(i)=SampEn(2,0.5,a,1);
i=i+1;
feature = [feature, amp];
%%
%3) CODE FOR RECCURENCE QUANTIFICATION ANALYSIS :
rec=zeros(1,1);
det=zeros(1,1);
entr=zeros(1,1);
lent=zeros(1,1);
i=1;j=1;k=1;y=1;
a=textread('S012.txt','%f');
Q=transpose(a);
[RP,DD] = RPplot(Q,3,1,.5,0);
[RR,DET,ENTR,L] = Recu_RQA(RP,0);
rec(i)= RR; i=i+1; %  recurrence rate, which is the density of recurrence points in a recurrence plot
feature = [feature, rec];
det(j)=DET; j=j+1; %determinism
feature = [feature, det];
entr(k)=ENTR;k=k+1; % 
feature = [feature, entr];
lent(y)=L;y=y+1;
feature = [feature, lent];
%%
%4) CODE FOR SUB BAND ENERGIES :

E3=zeros(1,1);
E4=zeros(1,1);
E5=zeros(1,1);
E6=zeros(1,1);
E7=zeros(1,1);
i=1; j=1; k=1; l=1;m=1;
a=textread('S012.txt','%f');
[C,L] = wavedec(a,7,'db4');
[Ea,Ed] = wenergy(C,L);
E3(i)= Ed(3); i=i+1;
feature = [feature, E3]
E4(j)=Ed(4); j=j+1;
feature = [feature, E4];
E5(k)=Ed(5); k=k+1;
feature = [feature,E5];
E6(l)=Ed(6); l=l+1;
feature = [feature,E6];
E7(m)=Ed(7);m=m+1;
feature = [feature,E7]

disp(feature)

%%
filename = 'testdata.xlsx';
xlswrite(filename,feature)

