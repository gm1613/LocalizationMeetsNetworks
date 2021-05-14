%% Matlab function to compute 1-D Laplacian with periodic BCs: perlap.m
%% Second spatial derivative for periodic BCs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ** Using 3 point central difference approximation for
% second spatial derivative.
% ** x is a vector of concentrations at the grid points
% across the domain
% ** delx is the interval size for the discretization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function f = perlap(x,delx)
f = (circshift(x,1) - 2*x + circshift(x,-1))/delx^2;
end