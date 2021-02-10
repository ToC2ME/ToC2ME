<h2> References </h2>

<blockquote> Rodríguez-Pradilla, G. and Eaton, D. W. (2020). Automated Microseismic Processing and Integrated Interpretation of Induced Seismicity during a Multistage Hydraulic‐Fracturing Stimulation, Alberta, Canada. Bulletin of the Seismological Society of America ; 110 (5): 2018–2030. doi: <a href="https://doi.org/10.1785/0120200082">https://doi.org/10.1785/0120200082</a> </blockquote>
  
<p> Catalog_Rodriguez-Pradilla2019_PhDThesis.csv contains the seismic catalogue published in the PhD Thesis by G. Rodriguez-Pradilla, Univeristy of Calgary, which can be found </p>

<blockquote> Rodríguez-Pradilla, G. (2019). <a href="https://prism.ucalgary.ca/handle/1880/111335"> Microseismic Monitoring of a Duvernay Hydraulic-Fracturing Stimulation, Alberta Canada: Processing and Interpretation assisted by Finite-Difference Synthetic Seismograms. </a> PhD Thesis, University of Calgary, Calgary, AB. </blockquote>


<h2> Summary </h2>

<p> Total number of events detected: 10,691. </p>

<p> 17 high Signal-to-noise events (ML > 1.5) were chosen as template events for match filtering method for the automatic detection and phase picking of seismic events. P- and S-wave phase picks determined by an STA/LTA method using the squared amplitude of the recorded waveforms <a href="https://pubs.geoscienceworld.org/geophysics/article/81/2/KS71/293715/A-review-and-appraisal-of-arrival-time-picking">(Akram and Eaton, 2016)</a>. P- and S- wave picks were "cleaned" by removing picks that fall outside one standard deviation of the best-fitting Gaussian distributions for the template event. Epicentre location calculated using the normal move-out equation. Focal depths obtained by finding the depth that minimizes the root-mean-square (RMS) of the travel-time residuals, based on a 1-D isotropic velocity model derived from nearby P- and S-wave sonic logs.  </p>

<h2> Notes </h2>

<ul>
  <li> Locations are given within a reference frame, rather than as absolute co-ordinates, with the reference being the minimum of the receiver locations. </li>
 </ul> 
 
<h2> Use of developed code </h2>

The codes developed here for the determination of epicentre location and focal time of seismic events are provided within the folder <a href="https://github.com/ToC2ME/ToC2ME/tree/master/Rodriguez-Pradilla/LinEpiLoc_ToC2ME_Demo">"LinEpiLoc_ToC2ME_Demo"</a>. Please see the <a href="https://github.com/ToC2ME/ToC2ME/blob/master/Rodriguez-Pradilla/LinEpiLoc_ToC2ME_Demo/README.md"> README.md </a> within this folder for detailed usage, and an example script of how to implement this code.  
