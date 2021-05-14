%% Complete Matlab function for FIGURE 2 (C,D):
function f = single_node_localised_activation(t, v)
% v is a vector containing concentration profiles
% for all the species in the model.
%% Spatial domain:
%Domain Size
L = 1;
% Define subdomain of localisation
Lc1 = [zeros(163,1);ones(36,1);zeros(162,1)];
%Lc1 = [zeros(18,1);ones(36,1);zeros(307,1)];
%% PARAMETER VALUES:
k1 = 5;
k2 = 0.4;
k3 = 1;
k4 = 0.5;
Yt = 1;
Xt = 1;
Dx = 0;    %Diffusion coefficient of node X
Dy = 0.01; %Diffusion coefficient of node Y
% Finite difference parameters
Numgrds = 361; %For no-flux BCs
delx = L/(Numgrds-1);
%% Extracting concentration profiles of individual species from vector v
XM = reshape(v,[],2);
X = XM(:,1);
Y = XM(:,2);
%% Finite differenced equations
fX = (k3*(Xt-X) - k4*X).*Lc1 + Dx*nfxlap(X,delx);
fY = (k1*X.*(Yt-Y)).*Lc1 - k2*Y + Dy*nfxlap(Y,delx);
f =