function SM  = sm_assemble_global(mesh_size,polynomial_deg)    % Initialize properties needed for renumbering the shape function and for the loops    cells_per_row= (1/mesh_size);    number_of_cells = cells_per_row^2;    number_of_nodes = ((polynomial_deg * cells_per_row)+1)^2;    SF = sf_generate(polynomial_deg);    SM = zeros(number_of_nodes,number_of_nodes);    cell_matrix = mesh_cell(mesh_size,polynomial_deg);        % Calculate local stiffness matrix    SM_local = sm_assemble_local(SF,mesh_size);    size_SM_local = length(SM_local);        % Build SM out of the entries of the local stiffness matrix via appropriate renumbering    for i=1:number_of_nodes        for j=1:number_of_nodes            for k=1:number_of_cells                % Check if shape functions with number i and j in the mesh are in the cell k                 if(mesh_renumber(cell_matrix,k,i) != 0 && mesh_renumber(cell_matrix,k,j) !=0 )                    % Add entries of local stiffness matrix which represent the integrals of the local shape functions                     SM(i,j)= SM(i,j) + SM_local(mesh_renumber(cell_matrix,k,i),mesh_renumber(cell_matrix,k,j));                endif            endfor        endfor    endfor    endfunction