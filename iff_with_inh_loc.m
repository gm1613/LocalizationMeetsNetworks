%% Complete Matlab function for the Incoherent feedforward motif with localisation
%% shown in Figure 8(B):

function f = iff_with_inh_loc(t, v,avg,amp)
%% Domain parameters
% Channel Length
L = 1;
% Patch location and size
Lc1 = [zeros(162,1);ones(36,1);zeros(163,1)]; %
%% Parameters
kz = 0.1;
kdz = 10;
ky = 0.1;
kdy = 10;
kd = 1e-3;
zt = 1;
yt = 10; %1 when uniform; 10 when localised
Dy = 0;
Dz = 10;
%% Extracting variables
Numgrds = 361; %For no-flux BCs
delx = L/(Numgrds-1);
pos = 0:delx:L;
XM = reshape(v,[],2);
z = XM(:,1);
y = XM(:,2);
%Input signal
S = avg*(1+amp*cos(2*pi*pos));
%% Finite differenced equations
fz = kz*S'.*(zt-z) - kdz*z.*y -kd*z + Dz*nfxlap(z,delx);
fy = Lc1.*(ky*S'.*(yt-y) - kdy*y) + Dy*nfxlap(y,delx);
f=[fz;fy];
end