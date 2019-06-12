%open eeglab
eeglab

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
data_path_ica = [home_path '/5_artcorr/'];
data_path_elist = [home_path '/6_eventlisted/'];
data_path_elistTXT = [home_path '/6_eventlisted/txt/'];
data_path_bins = [home_path '/7_binlisted/'];
data_path_bintxt = [home_path '/7_binlisted/txt/'];
data_path_epoch = [home_path '/8_epoched/'];
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
	%Imports Biosemi Files                                                                                                                      
	%
    fprintf('\n\n\n**** %s: Importing BIOSEMI File ****\n\n\n', subject_list{s});
    EEG = pop_biosig([data_path_rawBDF subject_list{s} '.bdf'], 'ref',[35 36] ,'refoptions',{'keepref' 'off'});
    EEG.setname= subject_list{s};
    EEG = eeg_checkset( EEG );                                                                     
	EEG = pop_saveset(EEG, 'filename', [EEG.setname '.set'], 'filepath', data_path_rawSET);
   
	%                                                                                                                                           
	%Loads the rawSET file                                                                                                                      
	%                                                                                                                                           
	%fprintf('\n\n\n**** %s: Loading as dataset ****\n\n\n', subject_list{s});                                                                       
	%EEG = pop_loadset('filename', [subject_list{s} '.set'], 'filepath', data_path_rawSET);                                                         
	%EEG = eeg_checkset( EEG );                                                                                                                  
	                                                                                                                                            
	%                                                                                                                                           
	% Renames the channels and includes location information for the channels                                                                      
	%
	fprintf('\n\n\n**** %s: Renaming channels ****\n\n\n', subject_list{s});                                                                                                                                         
	EEG = pop_eegchanoperator( EEG, [home_path '/_SCRIPTS/_ChanRename.txt']);
    EEG.setname= [subject_list{s} 'r'];
    EEG = pop_saveset(EEG, 'filename', [EEG.setname '.set'], 'filepath', data_path_ren);
    
	fprintf('\n\n\n**** %s: Including channel location info ****\n\n\n', subject_list{s});                                                                                                                                 
	EEG=pop_chanedit(EEG, 'lookup',[home_path '/_SCRIPTS/_standard-10-5-cap385.elp']);  
	EEG.setname = [EEG.setname 'l'];
	EEG = pop_saveset(EEG, 'filename', [EEG.setname '.set'], 'filepath', data_path_loc);
    
	%
	% Run band filters
	%
    % 
	fprintf('\n\n\n**** %s: Running Band Filters ****\n\n\n', subject_list{s});
	EEG  = pop_basicfilter( EEG,  1:34 , 'Cutoff', [ 0.1 30], 'Design', 'butter', 'Filter', 'bandpass', 'Order',  2, 'RemoveDC', 'on' );
    EEG.setname = [subject_list{s} '_filt'];                                                    
	EEG = pop_saveset(EEG, 'filename', [EEG.setname '.set'], 'filepath', data_path_filt);
    
    
end

fprintf('\n\n\n**** All subject files have been processed through BANDFILTERING **** \n\n\n');
fprintf('If you are not quartering your experiment, The next step is to run B_ELISTthruEPOCH.m \n Else, open the \"Quartering\" folder and begin with A_BoundaryOnset.m \n\n\n' );