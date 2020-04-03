%% Requirement For Big-M
% max objective function 
% <= constraint
% b can be positive or negative

%% Function begin
% f is coefficient of objective function (row vector)1xn
% A is coefficient of less than constraint (matrix)pxn
% b is right hand side of less than constraint (column vector)px1
% Aeq is coefficient of equality constraint (matrix)qxn
% beq is right hand side of constraint (column vector)qx1

% where n is number of variable
% where p is total number of less than constraint
% where q is total number of equality constraint

% 
function big_m(f,A,b,Aeq,beq)
n = length(f);
p = length(b);
q = length(beq);
% Total number of basic variables
[] = initialValue()
total = p+q;
[b,y] = sort(b);
B = zeros(length(b));
for i=1:length(b)
B(i,:) = A(y(i),:);
end
disp(B);
bneg = sum(b<0)

% Pattern greater than,
end