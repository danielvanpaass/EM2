function plot_ellipse(polarization_state)
%PLOT_ELLIPSE Plots polarization ellipse of EM wave at the receiving
%antenna

n = linspace(0,2*pi,200)';

ellipse = real(polarization_state.*exp(1j*n));

plot(ellipse(:,1),ellipse(:,2))
axis equal
grid on
title('Polarization Ellipse')
xlabel('E_H')
ylabel('E_V')

end
