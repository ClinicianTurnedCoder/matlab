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
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1021, 'TargetCode', {'21' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1022, 'TargetCode', {'22' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1023, 'TargetCode', {'23' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1024, 'TargetCode', {'24' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1031, 'TargetCode', {'31' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1032, 'TargetCode', {'32' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1033, 'TargetCode', {'33' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1034, 'TargetCode', {'34' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1041, 'TargetCode', {'41' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1042, 'TargetCode', {'42' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1043, 'TargetCode', {'43' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1044, 'TargetCode', {'44' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1051, 'TargetCode', {'51' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1052, 'TargetCode', {'52' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1053, 'TargetCode', {'53' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1054, 'TargetCode', {'54' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1061, 'TargetCode', {'61' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1062, 'TargetCode', {'62' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1063, 'TargetCode', {'63' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1064, 'TargetCode', {'64' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1071, 'TargetCode', {'71' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1072, 'TargetCode', {'72' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1073, 'TargetCode', {'73' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1074, 'TargetCode', {'74' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1081, 'TargetCode', {'81' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1082, 'TargetCode', {'82' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1083, 'TargetCode', {'83' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1084, 'TargetCode', {'84' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1091, 'TargetCode', {'91' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1092, 'TargetCode', {'92' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1093, 'TargetCode', {'93' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1094, 'TargetCode', {'94' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1101, 'TargetCode', {'101' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1102, 'TargetCode', {'102' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1103, 'TargetCode', {'103' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1104, 'TargetCode', {'104' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1111, 'TargetCode', {'111' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1112, 'TargetCode', {'112' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1113, 'TargetCode', {'113' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1114, 'TargetCode', {'114' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1121, 'TargetCode', {'121' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1122, 'TargetCode', {'122' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1123, 'TargetCode', {'123' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1124, 'TargetCode', {'124' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1131, 'TargetCode', {'131' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1132, 'TargetCode', {'132' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1133, 'TargetCode', {'133' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1134, 'TargetCode', {'134' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1141, 'TargetCode', {'141' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1142, 'TargetCode', {'142' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1143, 'TargetCode', {'143' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  1144, 'TargetCode', {'144' } );
   
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
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2021, 'TargetCode', {'21' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2022, 'TargetCode', {'22' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2023, 'TargetCode', {'23' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2024, 'TargetCode', {'24' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2031, 'TargetCode', {'31' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2032, 'TargetCode', {'32' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2033, 'TargetCode', {'33' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2034, 'TargetCode', {'34' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2041, 'TargetCode', {'41' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2042, 'TargetCode', {'42' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2043, 'TargetCode', {'43' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2044, 'TargetCode', {'44' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2051, 'TargetCode', {'51' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2052, 'TargetCode', {'52' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2053, 'TargetCode', {'53' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2054, 'TargetCode', {'54' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2061, 'TargetCode', {'61' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2062, 'TargetCode', {'62' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2063, 'TargetCode', {'63' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2064, 'TargetCode', {'64' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2071, 'TargetCode', {'71' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2072, 'TargetCode', {'72' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2073, 'TargetCode', {'73' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2074, 'TargetCode', {'74' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2081, 'TargetCode', {'81' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2082, 'TargetCode', {'82' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2083, 'TargetCode', {'83' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2084, 'TargetCode', {'84' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2091, 'TargetCode', {'91' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2092, 'TargetCode', {'92' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2093, 'TargetCode', {'93' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2094, 'TargetCode', {'94' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2101, 'TargetCode', {'101' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2102, 'TargetCode', {'102' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2103, 'TargetCode', {'103' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2104, 'TargetCode', {'104' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2111, 'TargetCode', {'111' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2112, 'TargetCode', {'112' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2113, 'TargetCode', {'113' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2114, 'TargetCode', {'114' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2121, 'TargetCode', {'121' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2122, 'TargetCode', {'122' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2123, 'TargetCode', {'123' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2124, 'TargetCode', {'124' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2131, 'TargetCode', {'131' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2132, 'TargetCode', {'132' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2133, 'TargetCode', {'133' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2134, 'TargetCode', {'134' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2141, 'TargetCode', {'141' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2142, 'TargetCode', {'142' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2143, 'TargetCode', {'143' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  2144, 'TargetCode', {'144' } );
   
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
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3021, 'TargetCode', {'21' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3022, 'TargetCode', {'22' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3023, 'TargetCode', {'23' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3024, 'TargetCode', {'24' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3031, 'TargetCode', {'31' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3032, 'TargetCode', {'32' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3033, 'TargetCode', {'33' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3034, 'TargetCode', {'34' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3041, 'TargetCode', {'41' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3042, 'TargetCode', {'42' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3043, 'TargetCode', {'43' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3044, 'TargetCode', {'44' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3051, 'TargetCode', {'51' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3052, 'TargetCode', {'52' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3053, 'TargetCode', {'53' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3054, 'TargetCode', {'54' } );
  
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3061, 'TargetCode', {'61' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3062, 'TargetCode', {'62' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3063, 'TargetCode', {'63' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3064, 'TargetCode', {'64' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3071, 'TargetCode', {'71' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3072, 'TargetCode', {'72' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3073, 'TargetCode', {'73' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3074, 'TargetCode', {'74' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3081, 'TargetCode', {'81' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3082, 'TargetCode', {'82' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3083, 'TargetCode', {'83' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3084, 'TargetCode', {'84' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3091, 'TargetCode', {'91' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3092, 'TargetCode', {'92' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3093, 'TargetCode', {'93' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3094, 'TargetCode', {'94' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3101, 'TargetCode', {'101' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3102, 'TargetCode', {'102' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3103, 'TargetCode', {'103' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3104, 'TargetCode', {'104' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3111, 'TargetCode', {'111' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3112, 'TargetCode', {'112' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3113, 'TargetCode', {'113' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3114, 'TargetCode', {'114' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3121, 'TargetCode', {'121' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3122, 'TargetCode', {'122' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3123, 'TargetCode', {'123' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3124, 'TargetCode', {'124' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3131, 'TargetCode', {'131' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3132, 'TargetCode', {'132' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3133, 'TargetCode', {'133' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3134, 'TargetCode', {'134' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3141, 'TargetCode', {'141' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3142, 'TargetCode', {'142' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3143, 'TargetCode', {'143' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  3144, 'TargetCode', {'144' } );
    
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
 
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4021, 'TargetCode', {'21' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4022, 'TargetCode', {'22' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4023, 'TargetCode', {'23' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4024, 'TargetCode', {'24' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4031, 'TargetCode', {'31' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4032, 'TargetCode', {'32' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4033, 'TargetCode', {'33' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4034, 'TargetCode', {'34' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4041, 'TargetCode', {'41' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4042, 'TargetCode', {'42' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4043, 'TargetCode', {'43' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4044, 'TargetCode', {'44' } );
 
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4051, 'TargetCode', {'51' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4052, 'TargetCode', {'52' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4053, 'TargetCode', {'53' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4054, 'TargetCode', {'54' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4061, 'TargetCode', {'61' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4062, 'TargetCode', {'62' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4063, 'TargetCode', {'63' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4064, 'TargetCode', {'64' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4071, 'TargetCode', {'71' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4072, 'TargetCode', {'72' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4073, 'TargetCode', {'73' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4074, 'TargetCode', {'74' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4081, 'TargetCode', {'81' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4082, 'TargetCode', {'82' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4083, 'TargetCode', {'83' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4084, 'TargetCode', {'84' } );
  
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4091, 'TargetCode', {'91' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4092, 'TargetCode', {'92' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4093, 'TargetCode', {'93' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4094, 'TargetCode', {'94' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4101, 'TargetCode', {'101' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4102, 'TargetCode', {'102' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4103, 'TargetCode', {'103' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4104, 'TargetCode', {'104' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4111, 'TargetCode', {'111' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4112, 'TargetCode', {'112' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4113, 'TargetCode', {'113' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4114, 'TargetCode', {'114' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4121, 'TargetCode', {'121' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4122, 'TargetCode', {'122' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4123, 'TargetCode', {'123' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4124, 'TargetCode', {'124' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4131, 'TargetCode', {'131' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4132, 'TargetCode', {'132' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4133, 'TargetCode', {'133' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4134, 'TargetCode', {'134' } );
   
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4141, 'TargetCode', {'141' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4142, 'TargetCode', {'142' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4143, 'TargetCode', {'143' } );
   EEG = pop_insertcodearound( EEG , 'Latency',  0, 'NewCode',  4144, 'TargetCode', {'144' } );
   
    EEG = eeg_checkset( EEG );
    EEG.setname = [subject_list{s} '_filt_4_dq'];
    EEG = pop_saveset(EEG, 'filename', [EEG.setname '.set'], 'filepath', data_path_dq);
    
    
end

fprintf('**** All quartered subject files have been designated. **** \n \n \n');
fprintf('The next step is to run the script labeled \"C_ELISTthruAAR.m\"');