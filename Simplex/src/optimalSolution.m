function [X,nonbasic] = optimalSolution(basic,xb,size)
fprintf("Optimal Solution is achieved \n");
fprintf("Basic Variables \n");
disp("x"+sort(basic)');
% Finding solution
X = zeros(1,size);
nonbasic = true(1,size);
for i = 1:length(xb)
    X(basic(i)) = xb(i);
    nonbasic(basic(i)) = false;
end
end