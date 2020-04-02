function polarization_state = polarization_state(f,R0,H,epsilon1,epsilon2,phi,tau)
%POLARIZATION STATE Gives the amplitudes of the electric field a polarized
%EM wave. Is a vector of the horizontal and vertical components.
%    [f] = Hz, [R0],[H] = m, [epsilon] = absolute, [phi],[tau] = rad

theta_i = 0.5*pi - atan(2*H/R0);

[fresnel_h,fresnel_v] = Fresnel_reflection(epsilon1,epsilon2,theta_i);

c = 299792458;
k = 2*pi / c * f;

R1 = 2*sqrt(H*H+0.25*R0*R0);
dR = R1-R0;

% Horizontal
polarization_state(1) = 1 + fresnel_h*exp(1j*k*dR);

% Vertical
pt = polarization_phasor(phi,tau);

polarization_state(2) = pt * (1 + fresnel_v*exp(1j*k*dR));

end
