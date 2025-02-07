%Copyright © 2018- Sampsa Pursiainen & ZI Development Team
%See: https://github.com/sampsapursiainen/zeffiro_interface
if not(isfield(zef,'inv_rec_source')); 
    zef.inv_rec_source = [0 0 0 0 0 0 0 3 1]; 
end; 
if not(isfield(zef,'inv_roi_mode')); 
    zef.inv_roi_mode = 1; 
end; 
if not(isfield(zef,'inv_roi_sphere')); 
    zef.inv_roi_sphere = [0; 0; 0; 15]; 
end; 
if not(isfield(zef,'inv_roi_threshold')); 
    zef.inv_roi_threshold = 0.5; 
end; 
if not(isfield(zef,'inv_n_burn_in')); 
    zef.inv_n_burn_in = 1000; 
end; 
if not(isfield(zef,'inv_hyperprior')); 
    zef.inv_hyperprior = 1; 
end; 
if not(isfield(zef,'inv_beta')); 
    zef.inv_beta = 1.5; 
end;
if not(isfield(zef,'inv_theta0')); 
    zef.inv_theta0 = 0.001; 
end;
if not(isfield(zef,'inv_likelihood_std')); 
    zef.inv_likelihood_std = 0.01; 
end;
if not(isfield(zef,'inv_n_map_iterations')); 
    zef.inv_n_sampler = 10000; 
end;
if not(isfield(zef,'inv_pcg_tol')); 
    zef.inv_pcg_tol = 1e-8; 
end;
if not(isfield(zef,'inv_sampling_frequency')); 
    zef.inv_sampling_frequency = 1025; 
end;
if not(isfield(zef,'inv_low_cut_frequency')); 
    zef.inv_low_cut_frequency = 7; 
end;
if not(isfield(zef,'inv_high_cut_frequency')); 
    zef.inv_high_cut_frequency = 9; 
end;
if not(isfield(zef,'inv_data_segment')); 
    zef.inv_data_segment = 1; 
end;
if not(isfield(zef,'normalize_data')); 
    zef.normalize_data = 1; 
end;

if not(isfield(zef,'inv_time_1')); 
    zef.inv_time_1 = 0; 
end;
if not(isfield(zef,'inv_time_2')); 
    zef.inv_time_2 = 0; 
end;
if not(isfield(zef,'inv_time_3')); 
    zef.inv_time_3 = 0; 
end;
if not(isfield(zef,'number_of_frames')); 
    zef.number_of_frames = 1; 
end;

set(zef.h_inv_rec_source_8 ,'string',num2str(zef.inv_rec_source(1,8)));
set(zef.h_inv_rec_source_9 ,'value',zef.inv_rec_source(1,9));
set(zef.h_inv_roi_mode ,'value',zef.inv_roi_mode);
set(zef.h_inv_roi_sphere_1 ,'string',num2str(zef.inv_roi_sphere(:,1)'));
set(zef.h_inv_roi_sphere_2 ,'string',num2str(zef.inv_roi_sphere(:,2)'));
set(zef.h_inv_roi_sphere_3 ,'string',num2str(zef.inv_roi_sphere(:,3)'));
set(zef.h_inv_roi_sphere_4 ,'string',num2str(zef.inv_roi_sphere(:,4)'));
set(zef.h_inv_n_sampler ,'string',num2str(zef.inv_n_sampler));
set(zef.h_inv_n_burn_in ,'string',num2str(zef.inv_n_burn_in));
set(zef.h_inv_hyperprior ,'value',zef.inv_hyperprior);
set(zef.h_inv_beta ,'string',num2str(zef.inv_beta));
set(zef.h_inv_theta0 ,'string',num2str(zef.inv_theta0));
set(zef.h_inv_likelihood_std ,'string',num2str(zef.inv_likelihood_std));
% set(zef.h_inv_pcg_tol ,'string',num2str(zef.inv_pcg_tol));
set(zef.h_inv_sampling_frequency ,'string',num2str(zef.inv_sampling_frequency));
set(zef.h_inv_low_cut_frequency ,'string',num2str(zef.inv_low_cut_frequency));
set(zef.h_inv_high_cut_frequency ,'string',num2str(zef.inv_high_cut_frequency));
set(zef.h_inv_data_segment ,'string',num2str(zef.inv_data_segment));
set(zef.h_normalize_data ,'value',zef.normalize_data);
set(zef.h_inv_time_1 ,'string',num2str(zef.inv_time_1));
set(zef.h_inv_time_2 ,'string',num2str(zef.inv_time_2));
set(zef.h_inv_time_3 ,'string',num2str(zef.inv_time_3));
set(zef.h_number_of_frames ,'string',num2str(zef.number_of_frames));

if get(zef.h_inv_roi_mode,'value')==1; 
    set(zef.h_inv_plot_roi,'enable','on');
    set(zef.h_inv_plot_source,'enable','on'); 
    set(zef.h_inv_roi_sphere_1,'enable','on');
    set(zef.h_inv_roi_sphere_2,'enable','on');
    set(zef.h_inv_roi_sphere_3,'enable','on');
    set(zef.h_inv_roi_sphere_4,'enable','on');
    set(zef.h_inv_rec_source_8,'enable','on');
    set(zef.h_inv_rec_source_9,'enable','on');
    set(zef.h_inv_roi_threshold,'enable','off');
else;
    set(zef.h_inv_roi_sphere_1,'enable','off');
    set(zef.h_inv_roi_sphere_2,'enable','off');
    set(zef.h_inv_roi_sphere_3,'enable','off');
    set(zef.h_inv_roi_sphere_4,'enable','off');
    set(zef.h_inv_rec_source_8,'enable','off');
    set(zef.h_inv_rec_source_9,'enable','off');
    set(zef.h_inv_plot_roi,'enable','off');
    set(zef.h_inv_plot_source,'enable','off');
end; 
if get(zef.h_inv_roi_mode,'value')==2; 
    set(zef.h_inv_roi_threshold,'enable','on');
else; 
    set(zef.h_inv_roi_threshold,'enable','off');
end;