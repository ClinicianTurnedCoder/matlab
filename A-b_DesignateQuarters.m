%clear mem and command window                                                                                                                
clear                                                                                                                                        
clc                                                                                                                                          

%Specify path of parent folder which contains the data for your study
home_path = '/Volumes/Storage/Brads_Files/SBU_PHD/PhD/Research/Projects/2011-SynVio and eLAN/SynVio Data';

%Define the set of subjects and assigns the strings to the variable "subject_list"                                                                                       
    %For example, if your naming convention was DE_01.bdf, DE_02.bdf, DE_n.bdf,                                                                  
    %then your 'subject_list' line would look like the following:                                                                                
    %subject_list = {'DE_01','DE_02','DE_n'};                                                                                                                                                                                                                                            
subject_list = {'SV_01','SV_02','SV_03','SV_04','SV_06','SV_08', 'SV_09','SV_10', 'SV_11', 'SV_12', 'SV_13', 'SV_14', 'SV_15' 'SV_16', 'SV_17', 'SV_18', 'SV_19', 'SV_20', 'SV_22', 'SV_24' 'SV_26', 'SV_28'};                                                                                                                        
%subject_list = {'SV_01'};

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
data_path_elistTXT = [home_path '/5_eventlisted/txt/'];
data_path_bins = [home_path '/6_binlisted/'];
data_path_epoch = [home_path '/7_epoched/'];
data_path_ica = [home_path '/8_artcorr/'];
data_path_arf = [home_path '/9_artrej/'];
data_path_harf = [home_path '/10_handrej/'];
data_path_avg = [home_path '/11_averaged/'];
data_path_gavg = [home_path '/12_GAVG/'];


for s=1:nsubj                                                                                                                                

   %Ensures a fresh start for each subject                                                                                                    
   clear EEG;                                                                                                                                  
   clear ERP;                                                                                                                                             
                                                                                                                                                                                                                                                         	                                                                                                                                       
   fprintf('\n\n\n**** %s: Processing 1st Quarter ****\n\n\n', subject_list{s}); 
   
   fprintf('\n\n\n**** %s: Loading 1st Quarter ****\n\n\n', subject_list{s});                                                                       
   EEG = pop_loadset('filename', [subject_list{s} '_filt_1.set'], 'filepath', data_path_quart);                                                         
   EEG = eeg_checkset( EEG ); 
    
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1011, 'TargetCode', {'11' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1012, 'TargetCode', {'12' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1013, 'TargetCode', {'13' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1014, 'TargetCode', {'14' } );
   
   EEG = eeg_checkset( EEG );
   EEG.setname = [subject_list{s} '_filt_1_dq'];
   EEG = pop_saveset(EEG, 'filename', [EEG.setname '.set'], 'filepath', data_path_dq);
    
end   
    
for s=1:nsubj    
   	clear EEG;
	clear ERP; 
    
   fprintf('\n\n\n**** %s: Processing 2nd Quarter ****\n\n\n', subject_list{s}); 
    
   fprintf('\n\n\n**** %s: Loading 2nd Quarter ****\n\n\n', subject_list{s});                                                                       
   EEG = pop_loadset('filename', [subject_list{s} '_filt_2.set'], 'filepath', data_path_quart);                                                         
   EEG = eeg_checkset( EEG ); 

   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2011, 'TargetCode', {'11' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2012, 'TargetCode', {'12' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2013, 'TargetCode', {'13' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2014, 'TargetCode', {'14' } );
   
   EEG = eeg_checkset( EEG );
   EEG.setname = [subject_list{s} '_filt_2_dq'];
   EEG = pop_saveset(EEG, 'filename', [EEG.setname '.set'], 'filepath', data_path_dq);
    
    
end  
   
for s=1:nsubj
    
   clear EEG;                                                                                                                                  
   clear ERP; 
    
   fprintf('\n\n\n**** %s: Processing 3rd Quarter ****\n\n\n', subject_list{s}); 
    
   fprintf('\n\n\n**** %s: Loading 3rd Quarter ****\n\n\n', subject_list{s});                                                                       
   EEG = pop_loadset('filename', [subject_list{s} '_filt_3.set'], 'filepath', data_path_quart);                                                         
   EEG = eeg_checkset( EEG ); 
    
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3011, 'TargetCode', {'11' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3012, 'TargetCode', {'12' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3013, 'TargetCode', {'13' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3014, 'TargetCode', {'14' } );
   

   EEG = eeg_checkset( EEG );
   EEG.setname = [subject_list{s} '_filt_3_dq'];
   EEG = pop_saveset(EEG, 'filename', [EEG.setname '.set'], 'filepath', data_path_dq);
    
end
    
for s=1:nsubj   
    
    clear EEG;                                                                                                                                  
	clear ERP; 
    
   fprintf('\n\n\n**** %s: Processing 4th Quarter ****\n\n\n', subject_list{s}); 
    
   fprintf('\n\n\n**** %s: Loading 4th Quarter ****\n\n\n', subject_list{s});                                                                       
   EEG = pop_loadset('filename', [subject_list{s} '_filt_4.set'], 'filepath', data_path_quart);                                                         
   EEG = eeg_checkset( EEG );
    
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4011, 'TargetCode', {'11' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4012, 'TargetCode', {'12' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4013, 'TargetCode', {'13' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4014, 'TargetCode', {'14' } );
   
   EEG = eeg_checkset( EEG );
   EEG.setname = [subject_list{s} '_filt_4_dq'];
   EEG = pop_saveset(EEG, 'filename', [EEG.setname '.set'], 'filepath', data_path_dq);
    
    
end

fprintf('**** All quartered subject files have been designated. **** \n \n \n');
fprintf('The next step is to run the script labeled \"C_ELISTthruAAR.m\"');
