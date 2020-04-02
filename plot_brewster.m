function [minTheta,minFv] = plot_brewster(epsilon1,epsilon2)
%PLOT_BREWSTER Plots the Fresnel reflection coefficients vs the incident
%angle

N = 200;
N = N+1;

theta = linspace(0,0.5*pi,N);

fresnel_h = zeros(N,1);
fresnel_v = zeros(N,1);

for i = 1:N
    [fresnel_h(i),fresnel_v(i)] = Fresnel_reflection(epsilon1,epsilon2,theta(i));
end

[minFv,mini] = min(abs(fresnel_v));
minTheta = theta(mini);

figure
plot(theta,abs(fresnel_h))
hold on
plot(theta,abs(fresnel_v))
xline(minTheta)
yline(0)
scatter(minTheta,minFv,'r','LineWidth',2)
hold off
xticks(0:pi/8:pi/2)
xticklabels({'0','\pi/8','\pi/4','3\pi/8','\pi/2'})
axis([0 pi/2 0 1])
title('Magnitude of the Fresnel Reflection Coefficients')
xlabel('\theta_i [rad]')
ylabel('|\Gamma|')
legend({'|\Gamma_H|','|\Gamma_V|'})
text(minTheta+0.02,minFv+0.05,['Brewster''s Angle = ',num2str(minTheta/pi),'\pi rad'])

figure
plot(theta,angle(fresnel_h))
hold on
plot(theta,angle(fresnel_v))
xline(minTheta)
yline(0)
hold off
xticks(0:pi/8:pi/2)
yticks(-pi:pi/2:pi)
xticklabels({'0','\pi/8','\pi/4','3\pi/8','\pi/2'})
yticklabels({'-\pi','-\pi/2','0','\pi/2','\pi'})
axis([0 pi/2 -pi pi])
title('Phase of the Fresnel Reflection Coefficients')
xlabel('\theta_i [rad]')
ylabel('\angle\Gamma [rad]')
legend({'\angle\Gamma_H','\angle\Gamma_V'})

end

