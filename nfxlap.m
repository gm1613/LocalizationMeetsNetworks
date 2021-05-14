%% Matlab function to compute 1-D Laplacian with no-flux BCs: nfxlap.m
%% Second spatial derivative for no-flux BCs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ** Using 3 point central difference approximation for
% second spatial derivative.
% ** No-flux boundary conditions imposed using a 2 point
% central difference approximation and a fictitious node
% at each boundary.
% ** x is a vector of concentrations at the grid points
% across the domain
% ** delx is the interval size for the discretization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function f = nfxlap(x,delx)
f = ([x(2:end);x(end-1)] - 2*x + [x(2);x(1:end-1)])/delx^2;
end