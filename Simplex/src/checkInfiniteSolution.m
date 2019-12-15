function checkInfiniteSolution(nonbasic,deltaj,x,xb,cb,cj,basic,minratio,X,size)
for j=1:size
if nonbasic(j) && deltaj(j) == 0
    fprintf("Infinite Solution indicates by x%d \n",j);
    fprintf("Incoming = %s \n",[ 'x' num2str(j)]);
    incoming = j;
        xi = x(:,incoming);
       % Constructing next table for another point
       minratio = getMinratio(minratio,xb,xi);
       if isnan(minratio)
           checkInfiniteCase(X,basic,xi,size);
       else
           outgoing = getOutgoing(minratio,basic,x,incoming,size);
           [x,xb,cb,basic] = nextTable(incoming,outgoing,x,xb,cb,cj,basic);
           formTable(x,cb,xb,basic);
           Xnew = optimalSolution(basic,xb,size);
            fprintf("Xnew:\n");
            disp(Xnew);
            fprintf("X:\n");
            disp(X);
            fprintf("Convex Combination forming with these points \n");
            printConvex(X,true);
            fprintf("+");
            printConvex(Xnew,false);
       end
end
end
end