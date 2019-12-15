function outgoing = getOutgoing(minratio,basic,x,incoming,size)
% Degeneracy
[~,outgoing] = nanmin(minratio); 
if (sum(minratio == nanmin(minratio)) > 1)
    outgoing = Degeneracy(x,minratio,incoming,outgoing,size);
end
fprintf("Outgoing = %s \n", ['x' num2str(basic(outgoing))] ); 
end