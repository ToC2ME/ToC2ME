<body>
    
<h2> The ToC2ME Field Program </h2>

<p> The Tony Creek Dual Microseismic Experiment (ToC2ME) field program was a research-led project by the University of Calgary, in collaboration with a number of industry partners, investigating hydraulic fracturing within the Kaybob-Duvernay horizon in the Fox Creek area, Alberta. The ToC2ME acquisition system consisted of 69 cemented shallow boreholes, each with one three-component geophone at 27 m, and three one-component geophones at 22 m, 17 m and 12 m respectively (all OYO Geospace Seismic Recorder (GSX)-3 sensors with a sampling rate of 0.002 seconds). Furthermore, 6 broadband seismometers (Nanometrics Trillium Compact 20s) and 1 strong-motion accelerometer were co-located to allow enhanced analysis of the recorded seismicity. These sensors continuously monitored a four-well hydraulic fracture experiment for ~40 days in late 2016. </p>

<p> The ToC2ME data set is the focus of ongoing investigation by researchers at the University of Calgary and the University of Alberta. </p>

<figure>
  <p><img src="https://github.com/ToC2ME/ToC2ME/blob/master/Eaton2018_ToC2ME_Setup.png" alt="ToC2ME Geophone setup - Eaton et al., 2018 (SRL)" width="500" height="300px" text-align="center" font-style="italic" font-size="smaller" >
  <figcaption> Geophone Setup, Figure taken from <a href="https://pubs.geoscienceworld.org/ssa/srl/article/543218/induced-seismicity-characterization-during?casa_token=yArCmgQ71zcAAAAA:UXJD2MdzlhdUL5ne-4YOeuTvqB1ErPE0j6u0QSxSscg8X_ddWxPl50OUESPFCUn3MILZgKs"> Eaton et al., 2018 (SRL)</a>. Blue triangles = geophones; red square = co-located accelerometer; green circles = co-located broadband stations. </figcaption>
</figure>

<h2> Overview of Published Catalogues </h2>

<p> Previously published catalogues using data from the ToC2ME field program are archived here. Summaries of the research undertaken, the published catalogue, and a link to the published paper can be found within each corresponding folder and README.md file. </p>
   
<a href="https://pubs.geoscienceworld.org/ssa/srl/article/543218/induced-seismicity-characterization-during?casa_token=yh-OBTD_SpcAAAAA:XQRSqBDz927xBR4HeIaOlpTzCyM4sOfrWpQPRttwfT1J8duyvNi27dKB-Y1HPJ39FPP4Q4c"> <b> Eaton:</b> </a> >25,000 putative event detections using 15 templates (high signal-to-noise) in match-filtering analysis, of which ~14,000 events detected using a stacked amplitude envelope method. Hypocenter locations determined for 4083 high quality events from a global search methodology, and subsequently relocated using cross correlations. Moment magnitudes determined using S-wave displacement spectrum (4083 events).
    
<b> Igonin:</b> 18,040 events located from original match-filter catalogue of <a href="https://pubs.geoscienceworld.org/ssa/srl/article/543218/induced-seismicity-characterization-during?casa_token=yArCmgQ71zcAAAAA:UXJD2MdzlhdUL5ne-4YOeuTvqB1ErPE0j6u0QSxSscg8X_ddWxPl50OUESPFCUn3MILZgKs"> Eaton et al., 2018 (SRL) </a> using a beamforming methodology by stacking waveforms along ray-tracing travel times within a volume. Moment magnitudes determined using S-wave displacement spectrum.

<a href="https://library.seg.org/doi/full/10.1190/geo2019-0046.1"> <b> Poulin:</b> </a> 12,663 events located from original stacked-amplitude catalogue of <a href="https://pubs.geoscienceworld.org/ssa/srl/article/543218/induced-seismicity-characterization-during?casa_token=yArCmgQ71zcAAAAA:UXJD2MdzlhdUL5ne-4YOeuTvqB1ErPE0j6u0QSxSscg8X_ddWxPl50OUESPFCUn3MILZgKs"> Eaton et al., 2018 (SRL) </a> using P- and S-wave time picks being correlated to P-P and P-S reflections to provide VP and VS time-depth control. 

 <a href="https://doi.org/10.1785/0120200082"> <b> Rodriguez-Pradilla:</b> </a> 10,691 events detected using 17 templates (high signal-to-noise) in match filtering analysis and automatic phase picking determined by an STA/LTA algorithm. Events located in X and Y using the normal move-out equation; depths obtained by finding the depth that minimizes the root-mean-square (RMS) of the travel time residuals.

<h2> Data Download from IRIS </h2>

<p> Continuous seismic data from the ToC2ME field program was released through IRIS on 1 July 2020, and can be requested using the BREQ_FAST tool <a href="https://ds.iris.edu/ds/nodes/dmc/forms/breqfast-request/"> here</a>. Users will need the following information to download the full dataset: </p>

<ul>
  <li>Network Code: 5B </li>
  <li>Stations begin with: 1* (to avoid conflict with data from the NCEDC network which was also operational in the Fall of 2016) </li>
  <li>Data Start: 2016-10-25 </li>
  <li>Data End: 2016-12-01 </li>
  <li>Broadband Stations: 1109, 1112, 1141, 1147, 1166, 1178. Location code: -- </li>
  <li>Accelerometer: 1158. Location code: -- </li>
</ul>

<p> Please be aware that the network code 5B has been used for a number of other temporary seismic deployments over the years with data housed at IRIS. In order to download the ToC2ME data, the correct dates in 2016 need to be inserted. The full station list and associated metadata can be found <a href="https://ds.iris.edu/mda/5B/?starttime=2016-01-01T00:00:00&endtime=2017-12-31T23:59:59"> here</a>. </p>

<h2> *** Known Issues *** </h2>

<ul>
    <li> The instrument response information for the <b>geophones</b> available through IRIS is <b><i>incorrect</i></b> - We are working as quickly as possible to resolve the issue and get the correct response information to IRIS. If you have already downloaded any part of the ToC2ME dataset from IRIS, please send an email to <a href="mailto:toc2me@ucalgary.ca">toc2me@ucalgary.ca</a> so that we can provide you with the correct information as soon as we have it. 
</ul>

<h2> References </h2>

<p> We ask that any publications arising from this dataset reference <a href="https://pubs.geoscienceworld.org/ssa/srl/article/543218/induced-seismicity-characterization-during?casa_token=yArCmgQ71zcAAAAA:UXJD2MdzlhdUL5ne-4YOeuTvqB1ErPE0j6u0QSxSscg8X_ddWxPl50OUESPFCUn3MILZgKs"> Eaton et al., 2018 (SRL)</a>: </p>

<p><blockquote> Eaton, D.W., Igonin, N., Poulin, A., Weir, R., Zhang, H., Pellegrino, S. and Rodriguez, G., 2018. Induced seismicity characterization during hydraulic‐fracture monitoring with a shallow‐wellbore geophone array and broadband sensors. <i> Seismological Research Letters</i>, 89(5), pp.1641-1651. </blockquote></p>

<p> If you take advantage of the published catalogues listed here, see the folder README.md file for details of the additional references you will need. </p>

<h2> Contact </h2>

<p> Questions regarding the catalogue, the download of data and/or previous work utilizing the ToC2ME datasets can be directed to <a href="mailto:toc2me@ucalgary.ca">toc2me@ucalgary.ca</a>. </p>

<p> Github site maintained by the University of Calgary. </p>

<h2> Acknowledgements </h2>

<p> The ToC2ME program was enabled by generous support from two anonymous companies. Continuous geophone data were collected by Terra-Sine Resources and recorded under license from Microseismic Inc. for use of the BuriedArray method. We thank IRIS for their continued efforts for data management, which fosters collaboration such as this one. </p>

</body>
