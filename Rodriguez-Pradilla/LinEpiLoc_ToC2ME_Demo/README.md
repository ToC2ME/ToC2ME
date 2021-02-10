<h2> Summary </h2>

<p> Parallel computing for epicentre location and focal time of seismic events from Surface Microseismic Data. </p>

<p> Runs in MATLAB <a href="https://www.mathworks.com/products/matlab.html">(https://www.mathworks.com/products/matlab.html)</a> <br>
Tested in MATLAB R2016b </p>

<p> Author: Germán Rodríguez-Pradilla, University of Calgary <br>
Email: <a href="mailto:german.rodriguezprad@ucalgary.ca">german.rodriguezprad@ucalgary.ca</a> <br>
Last revision: May 2020 </p>

<h2> Running the code</h2>

<p> To execute, run the script LinEpiLoc_Main.m in MATLAB and select 
the script ending with "_SetInputFiles.m", that contains the Input 
Files with the receivers' coordinates, preliminary earthquake parameters, 
and the picked P- and S-wave arrival times (in seconds) for all the events. </p>

<p> This Demo for the ToC2ME dataset contains the four input files required
to execute the Script for epicentre location, listed in the script
"LinEpiLoc_ToC2ME_Demo_SetInputFiles.m": <br>
  
<ol>
  <li> Receivers' location from the Shallow-Borehole monitoring array <br>
   "NL" network code in IRIS database <br>
   Relative coordinates in metres <br>
   Input File: ToC2ME_Demo_recloc.txt </li>
  <li> Earthquakes' Source Parameters, with the Seg2 file name per seismic event, 
   and moment magnitude (Mw) <br>
   Input File: ToC2ME_Demo_sloc.txt </li>
  <li> Picked P-wave arrivals of all seismic events. <br>
   The stations without manual picking has "zero" in the input files. <br>
   Input File for P-wave picks: ToC2ME_Demo_PP_ReP.txt </li>
  <li> Picked S-wave arrivals of all seismic events. <br>
   The stations without manual picking has "zero" in the input files. <br>
   Input File for S-wave picks: ToC2ME_Demo_SP_ReP.txt </li>
</ol> 
   
<p> Once executed, the script exports a text file with the epicentre locations and 
focal time for all the seismic events that had manual picks for P- and/or S-wave
arrivals, and two figures of the implementation of the linearized epicentre location
method on one event, and a map plot with the obtained epicentres and Mean coefficient
of determination (Mean R2) of the located events. </p>

<p> This script can also be implemented in any other surface seismic monitoring array 
by defining in separate .txt files the receivers location, preliminary source parameters, 
and picked P- and S-wave arrival times, in the same format as the four input files from the Demo, 
and then defining them in a new MATLAB script with its name ending with "_SetInputFiles.m". </p>

<h2> Reference </h2>

<p> This code was used to produce the catalogue published in: </p>

<blockquote> Rodríguez-Pradilla, G. and Eaton, D. W. (2020). Automated Microseismic Processing and Integrated Interpretation of Induced Seismicity during a Multistage Hydraulic‐Fracturing Stimulation, Alberta, Canada. Bulletin of the Seismological Society of America ; 110 (5): 2018–2030. doi: <a href="https://doi.org/10.1785/0120200082">https://doi.org/10.1785/0120200082</a> </blockquote>
  
<p> and </p>

<blockquote> Rodríguez-Pradilla, G. (2019). Microseismic Monitoring of a Duvernay Hydraulic-Fracturing Stimulation, Alberta Canada: Processing and Interpretation assisted by Finite-Difference Synthetic Seismograms. PhD Thesis, University of Calgary, Calgary, AB. </blockquote>
