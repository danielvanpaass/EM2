function [fresnel_h,fresnel_v] = Fresnel_reflection(epsilon1,epsilon2,theta_i)
%input theta_i in rad
fresnel_h = (cos(theta_i) - sqrt((epsilon2/epsilon1) - (sin(theta_i)).^2)) / (cos(theta_i) + sqrt((epsilon2/epsilon1) - (sin(theta_i)).^2));
fresnel_v = -(epsilon2*cos(theta_i) - epsilon1*sqrt((epsilon2/epsilon1) - (sin(theta_i)).^2)) / (epsilon2*cos(theta_i) + epsilon1*sqrt((epsilon2/epsilon1) - (sin(theta_i)).^2));

end