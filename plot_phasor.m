function plot_phasor(N,epsi)
%PLOT_PHASOR Makes surf plot of polarization phasor

phi = linspace(-pi,pi,N);
tau = linspace(-pi/4,pi/4,N);

f = @(p,t) polarization_phasor(p,t);

[X,Y] = meshgrid(phi,tau);
Z = arrayfun(f,X,Y);

figure
surf(X,Y,angle(Z))
title('Phase of p of the Polarization Phasor [1,p]^T')
xticks(-pi:pi/2:pi)
yticks(-pi/4:pi/8:pi/4)
zticks(-pi:pi/2:pi)
xticklabels({'-\pi','-\pi/2','0','\pi/2','\pi'})
yticklabels({'-\pi/4','-\pi/8','0','\pi/8','\pi/4'})
zticklabels({'-\pi','-\pi/2','0','\pi/2','\pi'})
xlabel('\phi [rad]')
ylabel('\tau [rad]')
zlabel('\anglep [rad]')
axis([-pi pi -pi/4 pi/4 -pi pi])

ii = abs(Z) > epsi;
Z(ii) = epsi;

figure
surf(X,Y,abs(Z))
title('Magnitude of p of the Polarization Phasor [1,p]^T')
xticks(-pi:pi/2:pi)
yticks(-pi/4:pi/8:pi/4)
xticklabels({'-\pi','-\pi/2','0','\pi/2','\pi'})
yticklabels({'-\pi/4','-\pi/8','0','\pi/8','\pi/4'})
xlabel('\phi [rad]')
ylabel('\tau [rad]')
zlabel('|p|')

end
