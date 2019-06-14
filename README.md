# MATLAB Scripts

Contained in this repository are matlab scripts I created using Steve Luck's ERPLAB plugin for EEGLAB.
I wrote these scripts in 2012, during my time as a PhD student in Linguistics.
Their purpose is to automate the processing of raw EEG data into ERP data, which can be later analyzed with statistical software.
There are 5 standard scripts, and they are intended to be run in order, A through E.
I divided them up this way for natural stopping points for decision points and or step-in points for variation in experimental testing.

## File descriptions and how to use them

### A_IMPORTthruFILT.m

This script runs the following steps:
1. Import raw biosemi data (.bdf file) and save it as EEGLAB '.set' file.
2. Load the raw set file.
3. Rename the generic channel names to the International 10-20 EEG channel names, and apply correct coordinate location information.
4. Run standard bandpass filters.

The script ends here allowing the user to choose if they would prefer to "quarter" their experiment to test for task-learning effects.

Should the user decide to quarter their experiment, they should progress to A-a_BoundaryOnset.m, else progress to B_ELISTthruEPOCH.m.

### Optional: Quartering
The datasets are labeled for quartering using the boundary onset information provided by A-a_BoundaryOnset.m. The actual division of the files into quarters must be done manually at this point. Then A-b_DesignateQuarters.m changes all eventcodes to include designated quarter (1st-4th) informaiton. It does require some optimization, ie: could be done better using loops and an array of event codes.

#### A-a_BoundaryOnset.m
Creates a boundary onset that is somehow useful for quartering the datasets...

#### A-b_DesignateQuarters.m

This file will load each of the quartered files, and change the event codes to include 'x0' (where x represents quarter number, e.g. 1st quarter is 10, 2nd is 20, etc) in front of the relevant event code that was specified in the experimental design. The user would need to change the 'TargetCode' and 'NewCode' flags to their specific event codes.

It also re-concatenates the quartered files, in preparation for returning to the main workflow (script B_...).

### B_ELISTthruEPOCH.m

This script runs the following steps:
