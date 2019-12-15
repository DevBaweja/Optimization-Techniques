function formTable(x,cb,xb,basic)
tx = array2table(x);
t = table(cb,xb);
tnew = horzcat(t,tx);
tnew.Properties.RowNames = string(basic);

disp(tnew);
end