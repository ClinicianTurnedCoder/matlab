# MATLAB Scripts

Contained in this repository are matlab scripts I created using Steve Luck's ERPLAB plugin for EEGLAB.
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

#### A-a_BoundaryOnset.m

#### A-b_DesignateQuarters.m

### B_ELISTthruEPOCH.m

This script runs the following steps:
