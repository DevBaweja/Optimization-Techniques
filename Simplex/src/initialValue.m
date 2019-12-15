function [cj,cb,xb,x,deltaj,minratio,basic] =  initialValue(f,A,b)
[m,n] = size(A);
cj = [f,zeros(1,m)]; % row vector
cb = zeros(1,m)'; % column vector
xb = b; % column vector

% making basic matrix inside
slack = eye(m);
x = [A,slack]; % matrix
deltaj = zeros(1,(m+n));
basic = (n+1:n+m)'; % initial values
minratio = zeros(m,1);
end