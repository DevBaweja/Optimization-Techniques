function checkUnboundedRegion(x,loop)
% For unbounded region
for i=1:loop
   if x(:,i)<=0 % only true when all the element are 0 or -ve along any column
       fprintf("Unbounded region along x%d \n",i);
   end
end
end