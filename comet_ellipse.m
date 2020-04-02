function comet_ellipse(polarization_state)
%PLOT_ELLIPSE Plots polarization ellipse of EM wave at the receiving
%antenna in real time with a trail

n = linspace(0,2*pi,200)';

ellipse = real(polarization_state.*exp(1j*n));

comet(ellipse(:,1),ellipse(:,2))
axis equal
grid on
title('Polarization Ellipse')
xlabel('E_H')
ylabel('E_V')

end

