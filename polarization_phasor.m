function polarization = polarization_phasor(phi,tau)
    polarization = (tan(phi) + j.*tan(tau))./(1 - j.*tan(phi).*tan(tau));
end