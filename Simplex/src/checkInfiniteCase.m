function checkInfiniteCase(X,basic,xi,size)
fprintf("Infinite Case \n");
fprintf("X:\t");
Xnew = X;
for i=1:length(basic)
   Xnew(basic(i)) = X(basic(i))-xi(i);
end
for i=1:size
   if Xnew(i)-X(i) == 0
       fprintf("%d\t",X(i));
   else
       fprintf("%d+%dq\t",X(i),Xnew(i)-X(i));
   end
end
fprintf("\t where q >= 0 \n");
end