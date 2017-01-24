function [Vertex,Cell] = mesh_generate(mesh_size)    % We want as output of this function two matrices. One matrix, namely Vertex, should contain the vertices with x and y values    % of each vertex in the mesh. The 2nd matrix, namely cell, should give us for each cell the vertices numbers forming the cell.	% The generated mesh is always on the unit square.    % Example for mesh_size 0.5 on the unit square:    % vertex = [0,0;0.5,0;1,0;0,0.5;0.5,0.5;1,0.5;0,1;0.5,1;1,1]    % cell = [1,2,4,5;2,3,5,6;4,5,7,8;5,6,8,9]        % ------- Calculate vertex matrix ---------    side_length = mesh_size;                vertex_nr = 1;             % initialise matrix saving all vertices. 1st column represents x value and 2nd column y value.    % fill vertex matrix with its values orderd in lexicographical order.    for y_val=0:side_length:1        for x_val=0:side_length:1            vertex(vertex_nr,1:2) = [x_val,y_val];            vertex_nr++;        endfor    endfor        % ------- Calculate cell matrix ------------    % Fill cell matrix with its values in lexicographical order.    % Cell matrix is defined by the vertices. 1st column represents the first vertex of the cell. 2nd column the 2nd vertex of the cell and so on.    % vertex_i defines the number of the vertex in the vertex matrix.    vertices_per_row = (1/side_length)+1;    vertex_1 = 1;    counter = 1;    vertex_nr = length(vertex);    while vertex_1+3 <= vertex_nr         vertex_2 = vertex_1+1;        vertex_3 = vertex_1+vertices_per_row;        vertex_4 = vertex_3+1;        cell(counter,1:4) = [vertex_1,vertex_2,vertex_3,vertex_4];        counter++;                % Check if vertex_2 is at boundary in x direction        if(vertex(vertex_2,1)<1)            % vertex_2 is not at the boundary            vertex_1=vertex_2;        else            % vertex_2 is on the boundary            vertex_1 = vertex_2+1;        endif    endwhile        % -------------------------------------endfunction