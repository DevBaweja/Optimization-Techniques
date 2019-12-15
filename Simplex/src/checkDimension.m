%% Check Dimension
function boolean = checkDimension(f,A,b)
[m,n] = size(A);
[~,ncheck] = size(f);
[mcheck,~] = size(b);
boolean =  (n==ncheck && m==mcheck);
end