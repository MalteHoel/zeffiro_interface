%Copyright © 2018- Sampsa Pursiainen & ZI Development Team
%See: https://github.com/sampsapursiainen/zeffiro_interface
function [mesh_data_1,mesh_data_2,submesh_data] = zef_get_mesh(file_str,field_id,file_type,varargin)

output_mode = 1;
if not(isempty(varargin))
   output_mode = varargin{1};
end
   
mesh_data_1 = [];
mesh_data_2 = [];
submesh_data = [];

if isequal(output_mode,'full');
   mesh_data_1 = evalin('base',['zef.' field_id '_points;']);
   mesh_data_2 = evalin('base',['zef.' field_id '_triangles;']);
   submesh_data = evalin('base',['zef.' field_id '_submesh_ind;']);
end

evalin('base',['zef.' field_id '_triangles_original_surface_mesh = [];']);
evalin('base',['zef.' field_id '_points_original_surface_mesh = [];']);
evalin('base',['zef.' field_id '_submesh_ind_original_surface_mesh = [];']);

merge_on = evalin('base',['zef.' field_id '_merge']);
invert_on = evalin('base',['zef.' field_id '_invert']);

if isequal(file_type,'points')

if merge_on    
l1_points = evalin('base',['zef.' field_id '_points']);
l2_points = load(file_str); 
mesh_data_1 = [l1_points; l2_points];
else
mesh_data_1 = load(file_str);
end

end

if isequal(file_type,'triangles')

if merge_on
l1_triangles = evalin('base',['zef.' field_id '_triangles']); 
l2_triangles = load(file_str);
if invert_on
    l2_triangles = l2_triangles(:,[2 1 3]);
end
if isempty(l1_triangles)
    max_val = 0;
else
    max_val = max(l1_triangles(:));
end

if isequal(output_mode,'full')
mesh_data_2 = [l1_triangles; l2_triangles+max_val];
else
    mesh_data_1 = [l1_triangles; l2_triangles+max_val];
end
else
    if isequal(output_mode,'full')
mesh_data_2 = load(file_str);
if invert_on
    mesh_data_2 = mesh_data_1(:,[2 1 3]);
end
    else
        mesh_data_1 = load(file_str);
if invert_on
    mesh_data_1 = mesh_data_1(:,[2 1 3]);
end
    end
end

 
if merge_on
    submesh_data = [submesh_data size(mesh_data_2,1)]; 
else
   submesh_data = [size(mesh_data_2,1)]; 
end;       

end


if isequal(file_type,'stl')

stl_data = stlread(file_str);     
    
if merge_on    
l1_points = evalin('base',['zef.' field_id '_points']);
l2_points = stl_data.Points; 
mesh_data_1 = [l1_points; l2_points];
else
mesh_data_1 = stl_data.Points; 
end


if merge_on
l1_triangles = evalin('base',['zef.' field_id '_triangles']); 
l2_triangles = stl_data.ConnectivityList;
if invert_on
    l2_triangles = l2_triangles(:,[2 1 3]);
end
if isempty(l1_triangles)
    max_val = 0;
else
    max_val = max(l1_triangles(:));
end

mesh_data_2 = [l1_triangles; l2_triangles+max_val];

else

mesh_data_2 = stl_data.ConnectivityList;


if invert_on
    mesh_data_2 = mesh_data_1(:,[2 1 3]);
end
    end


if merge_on
    submesh_data = [submesh_data size(mesh_data_2,1)]; 
else
   submesh_data = [size(mesh_data_2,1)]; 
end;       


   
end

end