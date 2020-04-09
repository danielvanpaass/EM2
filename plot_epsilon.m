function plot_epsilon(epsilon1,theta_i,phase)

N = 201;

epsilon2 = logspace(1,5,N);
epsilon2 = epsilon2 .* epsilon1 * exp(1j*phase);

fresnel_h = zeros(N,1);
fresnel_v = zeros(N,1);

for i = 1:N
    [fresnel_h(i),fresnel_v(i)] = Fresnel_reflection(epsilon1,epsilon2(i),theta_i);
end

figure
semilogx(abs(epsilon2),abs(fresnel_h))
hold on
semilogx(abs(epsilon2),abs(fresnel_v))
title('Magnitude of the Fresnel Reflection Coefficients')
hold off

figure
semilogx(abs(epsilon2),angle(fresnel_h))
hold on
semilogx(abs(epsilon2),angle(fresnel_v))

yticks(-pi:pi/2:pi)
yticklabels({'-\pi','-\pi/2','0','\pi/2','\pi'})
title('Phase of the Fresnel Reflection Coefficients')
ylim([-pi pi])
hold off

end