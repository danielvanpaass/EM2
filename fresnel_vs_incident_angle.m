epsilon_0 = 8.854e-12;
epsilon_1 = 1;
epsilon_2 = session2.task2.dielectric_prermittivity;
theta_i = 0:0.01:90;

[a, b] = Fresnel_reflection(epsilon_1,epsilon_2,theta_i);

plot(theta_i,abs(b))