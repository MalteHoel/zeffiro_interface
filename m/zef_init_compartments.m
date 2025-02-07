 zef.h_compartment_table.Data = [];

zef_data.compartment_activity = {'Inactive','Constrained field','Unconstrained field','Active surface'};

zef_data.compartment_tags = cell(0);
zef_data.compartment_tags_aux = {'d1','d2','d3','d4','d5','d6','d7','d8','d9','d10','d11','d12','d13','d14','d15','d16','d17','d18','d19','d20','d21','d22','w','g','c','sk','sc'};

zef_data.color_cell_aux = { [0.7 0.7 1],[1 0 1],[0 0.5 0.5],[1 0.5 0.2],[0.5000 0 1.0000], [0.4000 0.6000 0.1000], [0 1 0], [1 0 0], [0 0.3 1], [0.35 0.75 1], [0 1 0.8], [1 0.85 0], [0.8 0.3 0.6], [0.5000 0 1.0000], [0.4000 0.6000 0.1000], [0 1 0], [1 0 0], [0 0.3 1], [0.35 0.75 1], [0 1 0.8], [1 0.85 0], [0.8 0.3 0.6], [0.8 0.8 0.8], [0.35 0.35 0.35], 0.6*[0.7 0.8 0.7], [0.7 0.7 0.6], 0.7*[0.83 0.67 0.49]};
zef_data.sources_cell_aux = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,1,0,0,0}; 
zef_data.name_cell_aux = {'Detail 1','Detail 2','Detail 3','Detail 4','Detail 5','Detail 6','Detail 7','Detail 8','Detail 9', 'Detail 10', 'Detail 11', 'Detail 12', 'Detail 13', 'Detail 14','Detail 15','Detail 16','Detail 17','Detail 18','Detail 19','Detail 20','Detail 21','Detail 22','White matter','Grey matter','Cerebrospinal fluid','Skull','Scalp'};
zef_data.sigma_cell_aux = {0.33,0.33,0.33,0.33,0.33,0.33,0.33,0.33,0.33,0.33,0.33,0.33,0.33,0.33,0.33,0.33,0.33,0.33,0.33,0.33,0.33,0.33,0.14,0.33,1.79,0.0064,0.43};
zef_data.priority_cell_aux = {6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,5,4,3,2,1};
zef_data.compartment_transform_name = cell(0);



for zef_i = 1 : length(zef_data.compartment_tags_aux)

    zef_create_compartment(zef_data.compartment_tags_aux{zef_i},'zef_data',{{'name',['''' zef_data.name_cell_aux{zef_i} '''']},{'sigma',num2str(zef_data.sigma_cell_aux{zef_i})},{'priority',num2str(zef_data.priority_cell_aux{zef_i})},{'color',num2str(zef_data.color_cell_aux{zef_i})},{'sources',num2str(zef_data.sources_cell_aux{zef_i})}});

end


zef_data = rmfield(zef_data,{'color_cell_aux','sources_cell_aux','name_cell_aux','sigma_cell_aux','priority_cell_aux','compartment_tags_aux'});

clear zef_i;
          

       
       
       

          
           