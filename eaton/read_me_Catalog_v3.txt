Catalog_v3_GRL.xls contains the seismic catalog published in Eaton et al. (2018), SRL.

Note: 	1. Duplicate events that were originally in the January 2018 catalog have been deleted and their
	   counterparts are highlighted in blue in the spreadsheet. 
	2. Events from January 2018 catalog that had their depths relocated using the 3D seismic
	   converted waves method (see Andrew Poulin and Ron Weir for details) are highlighted in yellow.


The corresponding event files are available in Catalog_v3/ in .mat format

Event files contain the following information:


				DESCRIPTION				  SIZE
-header		structured array
-params		structured array

-h1		horizontal component of geophones 			[2501 x 69]	 5 seconds long
-h2		horizontal component of geophones 			[2501 x 69] 	 5 seconds long
-z		vertical component of geophones 			[2501 x 69] 	 5 seconds long
-t		time vector corresponding to geophone data 		[1 x 2501] 	 5 seconds long

-bbh1		horizontal component of broadband data 			[3751 x 69] 	15 seconds long
-bbh2		horizontal component of broadband data 			[3751 x 69] 	15 seconds long
-bbz		vertical component of broadband data 			[3751 x 69] 	15 seconds long

-fh1		filtered horizontal component of broadband data 	[3751 x 69] 	15 seconds long
-fh2		filtered horizontal component of broadband data 	[3751 x 69] 	15 seconds long
-fz		filtered vertical component of broadband data 		[3751 x 69] 	15 seconds long
-tbb		time vector corresponding to broadband data 		[1 x 3751] 	15 seconds long



HEADER ARRAY
				DESCRIPTION				  SIZE
-rx		geophone location in UTM eastings			[69 x 1]
-ry		geophone location in UTM northings			[69 x 1]
-rz		geophone location in depth				[69 x 1]
-lat		geophone location in latitude				[69 x 1]
-long		geophone location in longitude				[69 x 1]

-WellA		struct array containing UTM deviations of Well A
-WellB		struct array containing UTM deviations of Well B
-WellC		struct array containing UTM deviations of Well C
-WellD		struct array containing UTM deviations of Well D

-fname		name of event using old naming scheme
-bbrx		broadband location in UTM eastings			[1 x 6]
-bbry		broadband location in UTM northings			[1 x 6]


PARAMS ARRAY

NOTE: parameters denoted with * are related to previous data processing steps and may not be useful. 

				DESCRIPTION				  SIZE
-dt		sampling interval of geophone data			[scalar]
-bbdt		sampling interval of broadband data			[scalar]

-sx0		source location in UTM eastings				[scalar]
-sy0		source location in UTM northings			[scalar]
-sz0		source location in depth				[scalar]

-ppt		P-wave pick times on geophone data			[1 x 69]
-spt		S-wave pick times on geophone data			[1 x 69]
-bbppt		P-wave pick times on broadband data			[1 x 6]
-bbspt		S-wave pick times on broadband data			[1 x 6]

-yy		year							[scalar]
-mo		month							[scalar]
-dd		day							[scalar]
-hh		hour							[scalar]
-mm		minute							[scalar]
-ss		seconds							[scalar]
-jd		Julian day						[scalar]

-xcorr*		Correlation coefficient with template event		[scalar]
-parName*	Name of parent event from cross-correlation using
		old naming scheme


-keep*		Flag used when keeping or discarding events 		[scalar]
		-> 1 = good event (NB: all events in v3.0 are good)
-picksQC	Flag used when picks have been QC'd 			[scalar]
		-> 1 = yes; 0 = no?

-MwP2*		Moment magnitude using geophone P-waves only	 	[scalar]
-dMw*		Difference in moment magnitude between			[scalar]
		parent and child event		
-dMw_depth*	Difference in depth between parent and child event	[scalar]

-Amax*		Maximum amplitude of child event after stacking		[scalar]
-Amax_depth*	Depth of child event corresponding to Amax		[scalar]

-Mag_SRL	struct array containing magnitudes derived in SRL paper


PARAMS.MAG_SRL ARRAY
				DESCRIPTION
-MW		Combined moment magnitude from geophone and		[scalar]
		broadband data (see SRL paper for details)	
-MWBB		Moment magnitude from broadband data			[scalar]
-MWg		Moment magnitude from geophone data			[scalar]
-MLBB		Local magnitude from broadband data			[scalar]
-MLg		Local magnitude from geophone data			[scalar]


