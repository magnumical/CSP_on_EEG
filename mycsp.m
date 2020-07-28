function W=mycsp(COVa,COVb)

C=COVb+COVa
[M,P]=eig(C); 
%  m: eigen vector
%  p : eigen vaule
U=(P^-0.5)*M';%whitening
Ra=U*COVa*U';
Rb=U*COVb*U';

%%
i=0; 
[M1,P1]=eig(Ra);%eigen vc(B) & val(L1) baraye Ra
%%
[P1,i]=sort(diag(P1),'descend'); 
M1=M1(:,i); 
P1=diag(P1);%P1 ghotriye . diag ghotr tabdil be bordar mishe
%diag: vec be matris ghotri & matris be vec
P2=eye(size(Ra,1))-P1;
% B eigen vec of both Ra and Rb
%% CSP
W=M1'*U;
