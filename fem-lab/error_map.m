function error_map()    % Add all subfolders to working directory    add_fem_lab();        % Initialize necessary constants    MAX_MESH_SIZE_COUNTER = 10;    MAX_POL_DEG = 3;        % Compute matrix Error containing at entry (mesh_size_counter,pol_deg) the error we get for solving    % the finite element method for mesh size = 1/2*mesh_size_counter and polynomial degree = pol_deg.    Error = zeros(MAX_MESH_SIZE_COUNTER, MAX_POL_DEG);    for pol_deg = 1:MAX_POL_DEG        for mesh_size_counter=1:MAX_MESH_SIZE_COUNTER            % Solve FEM problem            [error_L2,runtime] = main(1/(2*mesh_size_counter),pol_deg) ;            % Assign error from the finite element problem solving to the Error matrix.            Error(mesh_size_counter,pol_deg) = error_L2 ;         endfor    endfor    % Plot error map    % x-axis.    for mesh_size_counter = 1:MAX_MESH_SIZE_COUNTER        x(mesh_size_counter) = 1/ (mesh_size_counter*2);    endfor    % y-axis    pol_deg = 1:MAX_POL_DEG;        figure(4);    surf(x,pol_deg ,Error');    set(gca,'zscale','log')    %axis([1 MAX_POL_DEG 0 Error(1,1) ]);    xlabel ("mesh size");    ylabel ("polynomial degree");    zlabel ("error");endfunction