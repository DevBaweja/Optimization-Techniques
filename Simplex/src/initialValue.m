function [x,cb,xb,basic,cj] =  initialValue(f,A,b)
[m,n] = size(A);
cj = [f,zeros(1,m)]; % row vector
cb = zeros(1,m)'; % column vector
xb = b; % column vector

% making basic matrix inside
slack = eye(m);
x = [A,slack]; % matrix
basic = (n+1:n+m)'; % initial values
end