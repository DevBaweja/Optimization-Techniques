function minratio = getMinratio(minratio,xb,xi)
% calculating minratio
for i = 1:length(minratio)
   if xi(i)>0
      minratio(i) = xb(i)/xi(i); 
   else
      minratio(i) = NaN;  
   end
end
end