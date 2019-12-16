function deltaj = calculateDeltaj(x,cb,cj)
deltaj = zeros(1,length(cj));
for i = 1:length(deltaj)
    deltaj(i) = sum(cb.*x(:,i))-cj(i);
end
fprintf("Deltaj \n");
disp(deltaj);
end