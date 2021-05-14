%% Complete Matlab function for the motif shown in Figure 4

function f = motif_29a(t, v)
%% Domain parameters
% Channel Length
L = 5;
% Define subdomain of localisation
Lc1 = [zeros(289,1);ones(144,1);zeros(288,1)]; % For localisation at the centre of the domain

%% Parameters
k0 = 1e-3;
k1 = 0.1; %0.7
k2 = 3;
k4 = 2;
k5 = 1.5;
k7 = 0.5;
k8 = 0.08;
K4 = 0.05;
K7 = 0.1;
Dx = 0.01; %Diffusion coefficient for node X
Dy = 0.01; %Diffusion coefficient for node Y
Dz = 0.01; %Diffusion coefficient for node Z

%% Extracting variables
Numgrds = 721; %For no-flux BCs
delx = L/(Numgrds-1);
XM = reshape(v,[],3);
x = XM(:,1);
y = XM(:,2);
z = XM(:,3);

%% Finite differenced equations
fx = (k4*(y.^2).*(1-x)./(K4+y.^2))-k5*x +k0*(1-2*x) + Dx*nfxlap(x,delx);
fy = k1.*x.*(1-y) - k2*z.*y + k0*(1-2*y) + Dy*nfxlap(y,delx);
fz = Lc1.*((k7*(y.^2).*(1-z)./(K7+y.^2)) - k8*z) + Dz*nfxlap(z,delx);

f=[fx;fy;fz];
end