Parallel computing for epicentre location and focal time
of seismic events from Surface Microseismic Data.

Runs in MATLAB (https://www.mathworks.com/products/matlab.html)
Tested in MATLAB R2016b

Author: Germán Rodríguez-Pradilla, University of Calgary
german.rodriguezprad@ucalgary.ca
Last revision: May 2020

---

To execute, run the script LinEpiLoc_Main.m in MATLAB and select 
the script ending with "_SetInputFiles.m", that contains the Input 
Files with the receivers' coordinates, preliminary earthquake parameters, 
and the picked P- and S-wave arrival times (in seconds) for all the events.

This Demo for the ToC2ME dataset contains the four input files required
to execute the Script for epicentre location, listed in the script
"LinEpiLoc_ToC2ME_Demo_SetInputFiles.m":

1. Receivers' location from the Shallow-Borehole monitoring array
   "NL" network code in IRIS database
   Relative coordinates in metres
   Input File: ToC2ME_Demo_recloc.txt


2. Earthquakes' Source Parameters, with the Seg2 file name per seismic event, 
   and moment magnitude (Mw)
   Input File: ToC2ME_Demo_sloc.txt

3 and 4. Picked P- and S-wave arrivals of all seismic events.
   The stations without manual picking has "zero" in the input files.
   Input File for P-wave picks: ToC2ME_Demo_PP_ReP.txt
   Input File for S-wave picks: ToC2ME_Demo_SP_ReP.txt
   
Once executed, the script exports a text file with the epicentre locations and 
focal time for all the seismic events that had manual picks for P- and/or S-wave
arrivals, and two figures of the implementation of the linearozed epicentre location
method on one event, and a map plot with the obtained epicentres and Mean coefficient
of determination (Mean R2) of the located events.

This script can also be implemented in any other surface seismic monitoring array 
by defining in separate .txt files the receivers location, preliminary source parameters, 
and picked P- and S-wave arrival times, in the same format as the four input files from the Demo, 
and then defining them in a new MATLAB script with its name ending with "_SetInputFiles.m".

---

References
-  Rodríguez-Pradilla, G. (2019). Microseismic monitoring of a Duvernay hydraulic-fracturing 
   stimulation, Alberta Canada: Processing and interpretation assisted by finite-difference 
   synthetic seismograms. PhD Thesis, University of Calgary, Calgary, AB. 
   https://prism.ucalgary.ca/handle/1880/111335