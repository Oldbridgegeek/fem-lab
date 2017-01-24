function node_number_local = mesh_renumber(Cell_nodes, cell_number, node_number_global)    % mesh_renumber(Cell_nodes, cell_number, node_number_global) is an elementary function for building the global stiffness matrix.    % The function takes the node number in the global mesh and gives us the node number in the cell with number cell_number.    % Again we are using lexicographical order for the cells and for the nodes globally and locally.    % This is important for computing the global stiffness matrix out of the local stiffness matrix.        % Input Data    % Cell_nodes is computed by mesh_cell(mesh_size, pol_deg) and is a matrix having in the i-th column the number of the nodes globally.    % Example:    % Cell_nodes_example = [1,2,4,5;2,3,5,6]. So for the first cell the nodes globally are Cell_nodes(1,:).     % cell_number and node_number_global should be natural numbers.    % Output Data    % node_number_local is an integer representing the node number in the cell. So again same example:    % node_number_local = mesh_renumber(Cell_nodes_example,1,5)    % The algorithm would first check if cell 1 contains a node with global number 5 if not node_number_local would be 0.    % If yes then node_number_local would be the row number so in our case 4.            % ----------- Algorithm ------------        location = 0;        for i=1:columns(Cell_nodes)        % Check if node_number_global belongs to cell with number cell_number        if(Cell_nodes(cell_number,i) == node_number_global)                    % If node_number_global belongs to a cell, location should be the row number of the cell_matrix containg node_number_global            location = i;                        % Because each cell can contain each node only once we want to terminate algorithm. We are done.            break        endif    endfor        node_number_local = location;        % -----------------------------------      endfunction