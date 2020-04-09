function angular_pattern(f,R0, H, tau, phiw, epsilon1, epsilon2)
phia = linspace(-pi,pi,100);
theta_i = 0.5*pi - atan(2*H / (R0));
[fresnel_h,fresnel_v] = Fresnel_reflection(epsilon1,epsilon2,theta_i);

c = 299792458;
k = 2*pi / c * f;

R1 = 2*sqrt(H*H+0.25*R0*R0);
dR = R1-R0;

% Polarization ratio of the wave, including reflected wave
p1 = polarization_phasor(phiw, tau);
p1 = p1.*(1 + fresnel_v.*exp(1j.*k.*dR))./(1 + fresnel_h.*exp(1j.*k.*dR));
% Polarization ratio of the receiving antenna
p2 = polarization_phasor(phia,0);

rho = ((1+p1.*p2).*(1+conj(p1).*conj(p2)))./((1+p1.*conj(p1)).*(1+p2.*conj(p2)));

polarplot(phia, rho);
title('Polar Plot of Angular Pattern')

end
