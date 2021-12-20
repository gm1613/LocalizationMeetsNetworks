# LocalizationMeetsNetworks
Example Matlab code used in G. Menon and J. Krishnan, Spatial Localization meets Biomolecular Networks, 2021

* All the files provided contain Matlab functions.
* The files nfxlap and perlap contain functions that compute the discretized 1-D Laplacian for no-flux boundary conditions and periodic boundary conditions respectively.
* All the other Matlab functions provided contain calls to either nfxlap OR perlap, depending on the boundary conditions used.
* These other Matlab functions are intended for use with a Matlab ODE solver - in this study, all simulations were performed using the stiff-differential equation solver ode15s. 
* The file single_node_localised_activation contains the Matlab function for the two node motif discussed in Fig. 2(C,D).
* The file motif_29a contains the Matlab function describing the system discussed in Fig. 4(E).
* The file single_mod_two_diff3 contains the Matlab function describing the system shown in Fig. 7(D).
* The file iff_with_inh_loc contains the Matlab function describing the incoherent feedforward motif with localisation shown in Figure 8(B).
* These examples provide a template for Matlab functions: the lines of Matlab code provided below (corresponding to each figure) can be incorporated into these templates to create Matlab functions specific to each figure.
