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
	% IF YOU QUARTERED THE EXPERIMENT UNCOMMENT LINES 63, 64, 65
    % AND COMMENT OUT LINES 70, 71, 72
    %
    %
	% Loads the quartered epoched file                                                                                                                      
	%                                                                                                                                           
	%fprintf('\n\n\n**** %s: Loading Dataset ****\n\n\n', subject_list{s});                                                                       
	%EEG = pop_loadset('filename', [subject_list{s} '_filt_cdq_elist_bins_ep.set'], 'filepath', data_path_epoch);                                                         
	%EEG = eeg_checkset( EEG );  
    
    %                                                                                                                                           
	% Loads the epoched file                                                                                                                      
	%                                                                                                                                           
	fprintf('\n\n\n**** %s: Loading Dataset ****\n\n\n', subject_list{s});                                                                       
	EEG = pop_loadset('filename', [subject_list{s} '_filt_elist_bins_ep.set'], 'filepath', data_path_epoch);                                                         
	EEG = eeg_checkset( EEG );                                                                                                                                                                             
    
    
    %
    % Artifact correction
    %
    fprintf('\n\n\n**** %s: EOG Correction ****\n\n\n', subject_list{s});
    EEG = pop_autobsseog( EEG, [577.125], [577.125], 'fastica', {'eigratio', [1000000]}, 'eog_fd', {'range',[2  7]});
    EEG.setname= [EEG.setname '_cor'];
    EEG = pop_saveset(EEG, 'filename', [EEG.setname '.set'], 'filepath', data_path_ica);
    
    %
    % Automated artifact rejecting
    %
    fprintf('\n\n\n**** %s: Rejecting remaining EOG ****\n\n\n', subject_list{s});
    EEG  = pop_artmwppth( EEG , 'Channel', [ 2 29 33 34], 'Flag',  1, 'Threshold',  65, 'Twindow', [ -199.2 1697.3], 'Windowsize',  180, 'Windowstep',  20 );
    EEG.setname= [EEG.setname '_ar'];
    EEG = pop_saveset(EEG, 'filename', [EEG.setname '.set'], 'filepath', data_path_arf);
    
end

fprintf('\n\n\n**** All subject files have been processed through Automated Artifact Rejection ****\n\n\n');
fprintf('\n\n\n The next step is to hand-check/reject epochs for each subject file. \n Then run D_Averaging.m \n\n\n');
fprintf('**** NOTE: Save your hand rejected files as [SUBJECT_FILE_NAME]_handrej.set ****');