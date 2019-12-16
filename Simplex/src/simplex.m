%%  Requirement For Simplex Method
% max objective function 
% <= constraint
% b is positive

%% Function begin
% f is coefficient of objective function (row vector)1xn
% A is coefficient of constraint (matrix)mxn
% b is right hand side of constraint (column vector)mx1

% where n is number of variable
% where m is total number of constraint

function simplex(f,A,b)
format compact
if b>=0 % In Case of Standard Form
% checking for dimension
    if checkDimension(f,A,b)
        [x,cb,xb,basic,cj] = initialValue(f,A,b);
        while true
        % Table
        formTable(x,cb,xb,basic);
        % calculating deltaj
        deltaj = calculateDeltaj(x,cb,cj);
            if min(deltaj)<0
                 % Optimal Solution is not obtained
                [incoming,xi] = getIncoming(deltaj,x);
                minratio = getMinratio(xb,xi);
                fprintf("Minratio \n");
                disp(minratio);
               if isnan(minratio) 
                   fprintf("Unbounded Solution & Unbounded Region \n");
                   return;
               else
                   % getting outgoing vector
                   outgoing = getOutgoing(minratio,basic,x,incoming);
                   [x,xb,cb,basic] = nextTable(incoming,outgoing,x,xb,cb,cj,basic);
               end
            else
                % reached at optimal solution
                [X,nonbasic] = optimalSolution(basic,xb,sum(size(A)));
                % For Unbounded Region
                checkUnboundedRegion(x);       
                fprintf("X : ");
                disp(X);
                % For infinite solution
                checkInfiniteSolution(nonbasic,deltaj,x,xb,cb,cj,basic,X);
                fprintf("z : %d \n",sum(cb.*xb));
                return;
            end 
        end
    else
        fprintf("Dimension Mismatch Error \n");
    end
else
    fprintf("Simplex Cannot be applied\n");
end
end