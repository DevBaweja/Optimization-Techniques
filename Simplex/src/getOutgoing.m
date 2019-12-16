function outgoing = getOutgoing(minratio,basic,x,incoming)
% Degeneracy
[~,outgoing] = nanmin(minratio); 
if (sum(minratio == nanmin(minratio)) > 1)
    outgoing = Degeneracy(x,minratio,incoming,outgoing);
end
fprintf("Outgoing = %s \n", ['x' num2str(basic(outgoing))] ); 
end