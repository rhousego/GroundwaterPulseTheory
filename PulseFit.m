%% Function fits time series to exponential and outputs pulse theory parameters
%Rachel Housego
%Last edited-4/19/23
% time= vector of times NOTE: must start at t=0
% water_level= time series of water levels you want to use to drive
% pulse model, must be clipped to duration of storm (i.e. do not include
% a lot of pre or post storm data. For best results only use the rising
% limb of the storm
function [A,B,tp]=PulseFit(time,water_level)
ydata=water_level;
h0=ydata(1);
xdata=time;
[~,ind_max]=max(ydata);
tp=xdata(ind_max);
fn=@(x,xdata)h0+x(1).*exp(-x(2).*(xdata-tp).^2);
x = lsqcurvefit(fn,x0,xdata,ydata);
A=x(1)+h0;
B=x(2);
end


