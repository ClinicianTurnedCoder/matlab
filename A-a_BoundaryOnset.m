%clear mem and command window                                                                                                                
clear                                                                                                                                        
clc                                                                                                                                          

%Specify path of parent folder which contains the data for your study
home_path = '/Volumes/Storage/Brads Files/SBU_PHD/PhD/Research/Projects/2011-SynVio and eLAN/Synvio Data/';

%Define the set of subjects and assigns the strings to the variable "subject_list"                                                                                       
    %For example, if your naming convention was DE_01.bdf, DE_02.bdf, DE_n.bdf,                                                                  
    %then your 'subject_list' line would look like the following:                                                                                
    %subject_list = {'DE_01','DE_02','DE_n'};                                                                                                                                                                                                                                            
subject_list = {'SV_01','SV_02','SV_03','SV_04','SV_06','SV_08', 'SV_09','SV_10', 'SV_11', 'SV_12', 'SV_13', 'SV_14', 'SV_15' 'SV_16', 'SV_17', 'SV_18', 'SV_19', 'SV_20', 'SV_22', 'SV_24' 'SV_26', 'SV_28'};                                                                                                                        

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
data_path_quartTXT = [home_path '/4a_quartered/txt/'];
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

%Starts a loop through all subjects                                                                                                                                                                                                                                                               
for s=1:nsubj                                                                                                                                

   %Ensures a fresh start for each subject                                                                                                    
	clear EEG;                                                                                                                                  
	clear ERP;  
    % Run Eventlist, but doesn't save the eventlisted set file.  This is purely for the
    % purpose of accessing the boundary onset information for quartering
    % the data.  We'll want to create the actual eventlisted set file after
    % concatenating the modified quarter files.
    %
    fprintf('\n\n\n**** %s: Creating eventlist.txt for boundary information****\n\n\n', subject_list{s});
	EEG = pop_creabasiceventlist(EEG, 'Eventlist', [data_path_quart subject_list{s} '_eventlist.txt'], 'Newboundary', {-99}, 'Stringboundary', {'boundary'}, 'Warning', 'on');
end
    
fprintf('Text files with the boundary onset information for each participant have been created!');
fprintf('The next step is to manually quarter your filtered data files,\n using the info in the txt file above. See \"readme.txt\" to learn how. \n');
fprintf('After you have the quartered files, run \"B_DesignateQuarters.m\"\n to relabel the eventcodes and concatenate the files. \n');