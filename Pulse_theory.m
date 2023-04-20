%%% Function to solve pulse theory presented by Li et al. 2004 
%Rachel Housego
%Last edited: 4/19/23
% x=vector of cross shore postions (relative to driving fluctuation)
% t=vector of time (must be relative to tp)
% A=(amplitude) of driving fluctuation
% B=parameter of exponential fit
% tp=time of max head/ocean level
% A,B, and tp are obtained by running PulseFit.m to whatever
% fluctuation (ocean or gw head being used to drive the model)
% D=diffusivity (K*z/Sy K=hydraulic conductivity, z=aquifer
% depth, Sy=specific yield
% All of the variables defined above can be in any unit but length
% and time unit must be consistent across all parameters

function h=Pulse_theory(x,t,A,B,tp,D)

q=NaN(length(x),length(t));
h=NaN(length(x),length(t));
for i=1:length(t)
    fun = @(tau) (tau-tp).*exp((-B.*(tau-tp).^2)).*erfc(x(j)./(2.*sqrt(D.*(t(i)-tau))));
    q(i)=integral(fun,0,t(i),'RelTol',0,'AbsTol',1e-12);
    h(j,i)=q(i).*-2*A*B';
end 
end