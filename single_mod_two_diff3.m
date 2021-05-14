%% Complete Matlab function for the spatially distributed motif with 
%% localised interaction shown in Figure 7(D):
%% 
function f = single_mod_two_diff3(t, v)
%% Domain parameters
% Channel Length
L = 1;
% Patch location and size
L1 = [zeros(135,1);ones(90,1);zeros(136,1)];
% L2 = flipud(L1);
% Lc2 = circshift(Lc1,216);
%% Parameters
k0 = 0.01;
kdz = 2; %2;
kdx = 0.5;
Kz = 15;
Kx = 0.2;
k2 = 0.6; %0.5,0.6
kd = 0.3;
%kz1 = 1;
Dx = 0.001;
Dy = 10;
Dz = 1;
h1 = @(x) (kdz.*x.^8)./(Kz+x.^8);
h2 = @(z) (kdx.*z.^4)./(Kx+z.^4);

%% Extracting variables
Numgrds = 361; %For no-flux BCs
delx = L/(Numgrds-1);
XM = reshape(v,[],3);
x = XM(:,1); %X*:slow diffusing
y = XM(:,2); %X: fast diffusing
z = XM(:,3);
%% Finite differenced equations
fx = -h2(z).*x.*L1 - k0*x + k2*y.*1 + Dx*nfxlap(x,delx);
fy = -k2*y.*1 + h2(z).*x.*L1 + k0*x + Dy*nfxlap(y,delx);
fz = h1(x).*(1-z) - kd*z + Dz*nfxlap(z,delx);
f=[fx;fy; fz];
end