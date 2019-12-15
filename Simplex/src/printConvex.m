function printConvex(X,b)
loop=length(X);
if b
    fprintf("q(");
else
    fprintf("(1-q)(");
end
    for i=1:loop
        if i==loop
            fprintf("%d",X(loop));
        else
         fprintf("%d,",X(i));
        end
    end
fprintf(")");
if ~b
    fprintf("\t where 0 <= q <= 1 \n");
end
end