%%  Requirement For Simplex Method
% max objective function 
% <= constraint
% b is positive

%% Function begin
% objfun is coefficient of objective function (row vector)1xn
% A is coefficient of constraint (matrix)mxn
% b is right hand side of constraint (column vector)mx1

% where n is number of variable
% where m is total number of constraint

function z = simplex(objfun,A,b)
[m,n] = size(A);

cj = [objfun,zeros(1,m)]; % row vector
xb = b; % column vector
cb = zeros(1,m)'; % column vector

% making basic matrix inside
slack = eye(m);
xmain = [A,slack]; % matrix
fprintf("First Simplex Table\n");
disp(xmain);
disp(xb);
deltaj = zeros(1,(m+n));
basic = (n+1:n+m)'; % initial values

for k = 1:5

% calculating deltaj 
    for i = 1:(n+m) 
        deltaj(i) = sum(cb.*xmain(:,i))-cj(i); 
    end
    fprintf("Deltaj \n");
    disp(deltaj);
    
    if(min(deltaj)<0)
         % getting incoming vector
        [~,incoming] = min(deltaj);
        fprintf("Incoming = %d \n",incoming); 
        
        xi = xmain(:,incoming);
        % calculating minratio
       minratio = zeros(m,1);
       for i = 1:m
           if(xi(i)>0)
              minratio(i) = xb(i)/xi(i); 
           else
                minratio(i) = NaN;  
           end
       end
       
        fprintf("Minratio \n");
        disp(minratio);
    
       if(isnan(minratio)) 
           fprintf("Unbounded Solution");
           return;
       else
             % getting outgoing vector
           [~,outgoing] = nanmin(minratio);
           fprintf("Outgoing = %d \n",outgoing);
           
           pivot = xmain(outgoing,incoming);
           fprintf("Pivot = %d \n",pivot);
           
           % Matrix operation
           xmain(outgoing,:) = xmain(outgoing,:)/pivot;
           xb(outgoing) = xb(outgoing)/pivot;
           
           % Making remaining pivot column zero
           for i = 1:m
               if(i~=outgoing) % excluding pivot row
                   tx = xmain(i,incoming);
                   xmain(i,:) = xmain(i,:) - tx*xmain(outgoing,:);
                   xb(i) = xb(i) - tx*xb(outgoing);
               end
           end
           disp(xmain);
           disp(xb);
           cb(outgoing) = cj(incoming);
           basic(outgoing) = incoming;
       end
       
    else
        % reached at optimal solution
        fprintf("Optimal Solution is achieved \n");
        fprintf("Basic Variables \n");
        disp("x"+basic);
        x = zeros(1,n+m);
        for i = 1:m
            x(basic(i)) = xb(i);
        end
        fprintf("Solution \n");
        disp(x)
        fprintf("z = %d \n",sum(cb.*xb));
        return;
    end
    
end

end