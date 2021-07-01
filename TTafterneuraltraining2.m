Ypredict = sim(net,X')';
plot(Ypredict,'DisplayName','Ypredict');hold on; plot(y,'DisplayName','y');hold off;
r = y-Ypredict;
mape = nanmean(abs(r./y*100))