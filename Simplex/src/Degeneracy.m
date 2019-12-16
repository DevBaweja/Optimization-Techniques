function outgoing = Degeneracy(x,minratio,incoming,outgoing,size)
   fprintf("Degeneracy \n");
   index = eye(length(minratio));
   xinew = x(:,incoming);
   inew = incoming;
   % Need not to calculate for other 
   d = find(minratio == nanmin(minratio));
   pseudo = true(1,length(minratio));
    for p=1:length(d)
        pseudo(d(p)) = false;
    end
   for j=1:(size-1)
       % getting another column
       inew = mod(inew,size)+1;
       xbnew = x(:,inew);
       % another column is part of indentity matrix
       for k = 1:length(index)
           if index(:,k) == xbnew
                minratio = getMinratio(xbnew,xinew);       
                for p=1:length(pseudo)
                    if pseudo(p)
                        minratio(p) = NaN;
                    end
                end
                fprintf("Minratio \n");
                disp(minratio);
                if (sum(minratio == nanmin(minratio)) == 1)
                    [~,outgoing] = nanmin(minratio);
                    return;
                end
           end
       end
   end
end