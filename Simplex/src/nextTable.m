function [x,xb,cb,basic] = nextTable(incoming,outgoing,x,xb,cb,cj,basic)
pivot = x(outgoing,incoming);
fprintf("Pivot = {%d} at",pivot);
fprintf("(%d,%d) \n",basic(outgoing),incoming);
% Matrix operation
x(outgoing,:) = x(outgoing,:)/pivot;
xb(outgoing) = xb(outgoing)/pivot;
% Making remaining pivot column zero
for i = 1:length(cb)
    if i~=outgoing % excluding pivot row
        tx = x(i,incoming);
        x(i,:) = x(i,:) - tx*x(outgoing,:);
        xb(i) = xb(i) - tx*xb(outgoing);
    end
end
% Making change in cb and basic variables
cb(outgoing) = cj(incoming);
basic(outgoing) = incoming;
end