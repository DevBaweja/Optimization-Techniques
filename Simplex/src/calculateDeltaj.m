function deltaj = calculateDeltaj(deltaj,x,cb,cj)
for i = 1:length(deltaj)
    deltaj(i) = sum(cb.*x(:,i))-cj(i);
end
fprintf("Deltaj \n");
disp(deltaj);
end