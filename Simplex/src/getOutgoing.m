function outgoing = getOutgoing(minratio,basic)
[~,outgoing] = nanmin(minratio);
fprintf("Outgoing = %s \n", ['x' num2str(basic(outgoing))] );    
end