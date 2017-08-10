function [colo]= cspmain(data1,data2,n)
R1=0;R2=0;
for i=1:n
    
R11 = ([data1(:,i) data1(:,i+n)])*([data1(:,i) data1(:,i+n)])';
R1 = R1+R11/trace(R11);
R22 = ([data2(:,i) data2(:,i+n)])*([data2(:,i) data2(:,i+n)])';
R2 = R2+R22/trace(R22);
end
R1=R1/n;
R2=R2/n;
Rsum = R1+R2;

% Find Eigenvalues and Eigenvectors of RC
% Sort eigenvalues in descending order
[EVecsum,EValsum] = eig(Rsum);
[EValsum,ind] = sort(diag(EValsum),'descend');
EVecsum = EVecsum(:,ind);

% Find Whitening Transformation Matrix - Ramoser Equation (3)
W = sqrt(pinv(diag(EValsum))) * EVecsum';

% Whiten Data Using Whiting Transform - Ramoser Equation (4)
S1 = W * R1 * W';
S2 = W * R2 * W';

% Ramoser equation (5)
%[U1,Psi1] = eig(S1);
%[U2,Psi2] = eig(S2);

%generalized eigenvectors/values
[B,D] = eig(S1,S2);

% Simultanous diagonalization
% Should be equivalent to [B,D]=eig(S1);

% verify algorithim
%disp('test1:Psi1+Psi2=I')
%Psi1+Psi2

% sort ascending by default
%[Psi1,ind] = sort(diag(Psi1)); U1 = U1(:,ind);
%[Psi2,ind] = sort(diag(Psi2)); U2 = U2(:,ind);
[D,ind]=sort(diag(D));
B=B(:,ind);

% Resulting Projection Matrix-these are the spatial filter coefficients
colo = B'*W;
dat1=log(var(colo*data1));
dat2=log(var(colo*data2));
dat1=dat1';
dat2=dat2';
dat1=[dat1(1:n) dat1(n+1:(2*n))];
dat2=[dat2(1:n) dat2(n+1:(2*n))];
end
