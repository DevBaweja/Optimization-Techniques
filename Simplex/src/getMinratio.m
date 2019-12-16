function minratio = getMinratio(xb,xi)
% calculating minratio
minratio = zeros(length(xb),1);
for i = 1:length(minratio)
   if xi(i)>0
      minratio(i) = xb(i)/xi(i); 
   else
      minratio(i) = NaN;  
   end
end
end