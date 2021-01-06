/*==============================================================================
DO FILE NAME:			02a_outcomes_checks_eth16
PROJECT:				Ethnicity 2nd wave
DATE: 					6th Jan 2020
AUTHOR:					R Mathur
						adapted from A Schultze 	
DESCRIPTION OF FILE:	Produce a table of baseline characteristics, by ethnicity
						Generalised to produce same columns as levels of ethnicity_16
						Output to a textfile for further formatting
DATASETS USED:			$Tempdir\analysis_dataset.dta
DATASETS CREATED: 		None
OTHER OUTPUT: 			Results in txt: $Tabfigdir\table1.txt 
						Log file: $Logdir\02a_eth_table1_descriptives
USER-INSTALLED ADO: 	 
  (place .ado file(s) in analysis folder)	
  
 Notes:
 Table 1 population is people who are alive on indexdate
 It does not exclude anyone who experienced any outcome prior to indexdate
 change the analysis_dataset to exlucde people with any of the following as of Feb 1st 2020:
 COVID identified in primary care
 COVID test result via  SGSS
 ICU admission for COVID-19
 

 ==============================================================================*/

* Open a log file
capture log close
log using ./logs/05_stp_check.log, replace t

use ./output/analysis_dataset.dta, clear
keep if carehome==0
tab stp eth5, row

collapse (count) patient_id, by(stp eth5)
reshape wide patient_id, i(stp) j(eth5)
ren patient_id* eth*


 export delimited using ./output/table3_stp_check.txt, replace
* Close log file 
log close

