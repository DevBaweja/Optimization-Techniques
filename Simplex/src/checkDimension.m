%% Check Dimension
function boolean = checkDimension(m,n,mcheck,ncheck)
if n==ncheck && m==mcheck
    boolean = true;
else
    boolean = false;
end
end