	%clear mem and command window                                                                                                                
clear                                                                                                                                        
clc                                                                                                                                          

%Specify path of parent folder which contains the data for your study
home_path = '/Users/Brad/Desktop/MATLAB_TUTORIAL/';

%Define the set of subjects and assigns the strings to the variable "subject_list"                                                                                       
    %For example, if your naming convention was DE_01.bdf, DE_02.bdf, DE_n.bdf,                                                                  
    %then your 'subject_list' line would look like the following:                                                                                
    %subject_list = {'DE_01','DE_02','DE_n'};       
subject_list = {'SV_05', 'SV_07'};

%Gets the number of subjects from the subject list variable   
nsubj = length(subject_list); 

%Path to folder containing the current subject's data
%In your study's home path, make a folder for each of the lines below.
%
%Put your raw eeg data in the "/rawBDF/" folder.
%The script will save the files into the correct folder respective to the
%step.
data_path_rawBDF = [home_path '/0_rawBDF/'];
data_path_rawSET = [home_path '/1_rawSET/'];  
data_path_ren = [home_path '/2_relabeled/'];
data_path_loc = [home_path '/3_located/'];
data_path_filt = [home_path '/4_filtered/'];
data_path_quart = [home_path '/4a_quartered/'];
data_path_quartTXT = [home_path '/4a_quartered/txt'];
data_path_dq = [home_path '/4b_designatedquarts/'];
data_path_cq = [home_path '/4c_concatenatedquarters/'];
data_path_elist = [home_path '/5_eventlisted/'];
data_path_elisttxt = [home_path '/5_eventlisted/txt/'];
data_path_bins = [home_path '/6_binlisted/'];
data_path_bintxt = [home_path '/6_binlisted/txt/'];
data_path_epoch = [home_path '/7_epoched/'];
data_path_ica = [home_path '/8_artcorr/'];
data_path_arf = [home_path '/9_artrej/'];
data_path_harf = [home_path '/10_handrej/'];
data_path_avg = [home_path '/11_averaged/'];
data_path_gavg = [home_path '/12_GAVG/'];

%Starts a loop through all subjects                                                                                                                                                                                                                                                               
for s=1:nsubj                                                                                                                                

   	%Ensures a fresh start for each subject                                                                                                    
	clear mem;
    	clear memory;
    	clear EEG;                                                                                                                                  
	clear ERP;     
    
	%print processing information in command window                                                                                             
	fprintf('\n\n\n**** %s: Processing Subject ****\n\n\n', subject_list{s});

    %                                                                                                                                           
    % IF YOU QUARTERED THE EXPERIMENT UNCOMMENT LINES 62, 63, 64
    % AND COMMENT OUT LINES 69, 70, 71
    %
    	%
    	% Load the concatenated file                                                                                                                      
	%                                                                                                                                           
	%fprintf('\n\n\n**** %s: Loading Dataset ****\n\n\n', subject_list{s});                                                                       
	%EEG = pop_loadset('filename', [subject_list{s} '_filt_cdq.set'], 'filepath', data_path_cq);                                                         
	%EEG = eeg_checkset( EEG ); 
    
    	%
   	% Load the filtered file                                                                                                                      
	%                                                                                                                                           
	fprintf('\n\n\n**** %s: Loading Dataset ****\n\n\n', subject_list{s});                                                                       
	EEG = pop_loadset('filename', [subject_list{s} '_filt.set'], 'filepath', data_path_filt);                                                         
	EEG = eeg_checkset( EEG ); 
    
    	%
	% Create EVENTLIST
	%
    	fprintf('\n\n\n**** %s: Creating eventlist ****\n\n\n', subject_list{s});
	EEG = pop_creabasiceventlist(EEG, 'Eventlist', [data_path_elisttxt subject_list{s} '_eventlist.txt'], 'Newboundary', {-99}, 'Stringboundary', {'boundary'}, 'Warning', 'on');
	EEG.setname = [EEG.setname '_elist'];
	EEG = pop_saveset(EEG, 'filename', [EEG.setname '.set'], 'filepath', data_path_elist); 
    
    	%                                                                                                
    	% Create BINLIST
    	%
    	fprintf('\n\n\n**** %s: Running BinLister ****\n\n\n', subject_list{s});
    	EEG  = pop_binlister( EEG , 'BDF', [home_path  '/_Scripts/SynViol_binlist.txt'], 'ExportEL', [data_path_bintxt subject_list{s} '_eventlist_bin.txt'], 'ImportEL', 'no', 'Saveas', 'on', 'SendEL2', 'EEG&Text', 'UpdateEEG', 'on', 'Warning', 'on' );  
    	EEG.setname = [EEG.setname '_bins'];
    	EEG = pop_saveset(EEG, 'filename',[EEG.setname '.set'], 'filepath', data_path_bins);                                                                                                                                                                                      
    
    	%
    	% Epoching (200ms pre-stim, 1700ms post-stim
    	%
    	fprintf('\n\n\n**** %s: Bin-based epoching ****\n\n\n', subject_list{s});
    	EEG = pop_epochbin( EEG , [-200.0  1700.0],  'pre');
    	EEG.setname= [EEG.setname '_ep'];
    	EEG = pop_saveset(EEG, 'filename', [EEG.setname '.set'], 'filepath', data_path_epoch);
    
    
    
    
end

fprintf('\n\n\n**** All subject files have been processed through EPOPCHING ****\n\n\n');
fprintf('\n\n\n**** Run script C_ARcorr_reject.m next. ****\n\n\n');
