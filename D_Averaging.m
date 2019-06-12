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
	clear EEG;                                                                                                                                  
	clear ERP;     
    
    %
    % Load HandRej file
    %
    fprintf('\n\n\n**** %s: Loading Dataset ****\n\n\n', subject_list{s});
    EEG = pop_loadset('filename', [subject_list{s} '_handrej.set'], 'filepath', data_path_harf); 
    EEG = eeg_checkset( EEG ); 
    
    %
    % Summarize AR results in txt file
    %
    fprintf('\n\n\n**** %s: Summarizing AR results ****\n\n\n', subject_list{s});
    EEG = pop_summary_AR_eeg_detection(EEG, [data_path_harfsum subject_list{s} '_ARsummary.txt']);
                                                                                                                          
    % 
    % Epoch averaging
    %
    fprintf('\n\n\n**** %s: Averaging epochs ****\n\n\n', subject_list{s});
    ERP = pop_averager( EEG , 'Criterion', 'good', 'DSindex',1, 'SEM', 'on', 'Warning', 'on' );
    ERP = pop_savemyerp(ERP, 'erpname', subject_list{s}, 'filename', [subject_list{s} '.erp'], 'filepath', data_path_avg, 'warning', 'on');
    
    %
    % ERP Bin operations, to add difference waves and the like
    % This will vary by experiment.
    %
    %ERP = pop_binoperator( ERP, {  'bin169 = bin4 - bin1 label the_*verb',  'bin170 = bin2 - bin3 label to_*noun',  'bin171 = bin2 - bin1 label noun_context','bin172 = bin4 - bin3 label verb_context',  'bin173 = bin6 - bin5 label NV',  'bin174 = bin8 - bin7 label NV-12','bin175 = bin10 - bin9 label NV-34',  'bin176 = b138 - b137 label ADJ-obj',  'bin177 = b56 - b55 label ADJ-obj-12',  'bin178 = b58 - b57 label ADJ-obj-34','bin179 = b140 - b139 label ADJ-subj',  'bin180 = b60 - b59 label ADJ-subj-12',  'bin181 = b62 - b61 label ADJ-subj-34','bin182 = b54 - b53 label ADJ',  'bin183 = b64 - b63 label ADJ-12',  'bin184 = b66 - b65 label ADJ-34',  'bin185 = b122 - b121 label FUN','bin186 = b124 - b123 label FUN-12',  'bin187 = b126 - b125 label FUN-34',  'bin188 = b146 - b145 label SEM',  'bin189 = b148 - 147 label SEM-12','bin190 = b150 - 149 label SEM-34'});
    %ERP = pop_savemyerp(ERP, 'erpname', subject_list{s}, 'filename', [subject_list{s} '.erp'], 'filepath', data_path_avg, 'warning', 'on');
    
    
                                                                                                                                                                                                                                                                
    

end

fprintf('\n\n\n**** All subject files have been averaged. ****\n\n\n');