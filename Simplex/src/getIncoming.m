function [incoming,xi] = getIncoming(deltaj,x)
% getting incoming vector
[~,incoming] = min(deltaj);
fprintf("Incoming = %s \n",[ 'x' num2str(incoming)]); 
xi = x(:,incoming);
end