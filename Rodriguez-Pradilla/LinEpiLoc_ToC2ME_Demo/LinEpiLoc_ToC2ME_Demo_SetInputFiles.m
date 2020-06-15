%% 1. Set Input files - ToC2ME Demo 

% Receivers' location, relative coordinates in metres
InputFile_recloc = 'ToC2ME_Demo_recloc.txt';

% Source file, with Seg2 file name per seismic event, and moment magnitude (Mw)
InputFile_sloc = 'ToC2ME_Demo_sloc.txt';  

% Import picked P- and S-wave arrivals of selected seismic events, in seconds
% The seismic events without manual picking has "zero" in all the receivers
InputFile_PP = 'ToC2ME_Demo_PP_ReP.txt'; 
InputFile_SP = 'ToC2ME_Demo_SP_ReP.txt'; 