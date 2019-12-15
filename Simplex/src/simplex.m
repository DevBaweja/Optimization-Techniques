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
[m,n] = size(A);
total = m+n;
format compact
% checking for dimension
    if checkDimension(f,A,b)
        [cj,cb,xb,x,deltaj,minratio,basic] = initialValue(f,A,b);
        while true
        % Table
        formTable(x,cb,xb,basic)
        % calculating deltaj
        deltaj = calculateDeltaj(deltaj,x,cb,cj);
            if min(deltaj)<0
                 % Optimal Solution is not obtained
                [incoming,xi] = getIncoming(deltaj,x);
                minratio = getMinratio(minratio,xb,xi);
               if isnan(minratio) 
                   fprintf("Unbounded Solution & Unbounded Region \n");
                   return;
               else
                    % getting outgoing vector
                    % Degeneracy
                   outgoing = getOutgoing(minratio,basic);
                   [x,xb,cb,basic] = nextTable(incoming,outgoing,x,xb,cb,cj,basic);
               end
            else
                % reached at optimal solution
                [X,nonbasic] = optimalSolution(basic,xb,total);
                % For Unbounded Region
                checkUnboundedRegion(x,total);       
                fprintf("X : ");
                disp(X);
                % For infinite solution
                checkInfiniteSolution(nonbasic,deltaj,x,xb,cb,cj,basic,minratio,X,total);
                fprintf("z : %d \n",sum(cb.*xb));
                return;
            end 
        end
    else
        fprintf("Dimension Mismatch Error \n");
    end
end