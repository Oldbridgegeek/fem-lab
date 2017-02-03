function [error_L2 , overall_runtime] = main(mesh_size = 1/4 , pol_deg = 2)
    % Add all subfolders to working directory.
    add_fem_lab();
            
    % Initialize right hand side of strong formulation.
    f = @(x,y) cos(x*pi).*cos(y*pi);
    % Initialize exact solution.
    u_exact=@(x,y) cos(x*pi).*cos(y*pi)*(1/(1+2*pi*pi));
    
    % Start dial gauge.
    t0 = clock();
    
    % Initialize our mesh and our coefficient matrix for the shape functions.
    [Vertex,Cell]=mesh_generate(mesh_size);
    SF=sf_generate(pol_deg);
    
    % ------------------------ FEM -------------------------------
    % sm_assemble_local computes the local stiffness matrix. In our case,the local stiffness matrix looks the same for every cell.
    SM_local=sm_assemble_local_vectorized(mesh_size,SF);
    % sm_assemble_global will give the global stiffness matrix
    SM=sm_assemble_global(mesh_size,SF,SM_local);
    disp("------------------Assembled global matrix------------------");
    fflush(stdout);
    
    % Initialize right hand side of our linear system.
    rhs=rhs_integration_vectorized(Vertex,Cell,SF,f);
    disp("------------------Assembled right hand side------------------");
    fflush(stdout);
    
    % Solve the linear system,
    u_coeff = ls_solve(SM,rhs);
    disp("------------------Solved linear system------------------");
    fflush(stdout);
    
    % hf_eval_solution is used to evaluate the approximation, given the coefficients u_coeff.
    u=@(x,y) hf_eval_solution(x,y,u_coeff,Cell,Vertex,SF);
    
    % ------------------------------------------------------------------
        
    % Measure runtime needed for solving FEM.
    overall_runtime = etime(clock() , t0);

    % ------- Plotting --------
    % m_plot will plot the approximation, the exact solution and the right hand side of the strong form to illustrate, that it is in fact a multiple of the solution
    m_plot_solution(u_coeff,Cell,Vertex,SF);
    % -------------------------
           
    % ------ Error Analysis ------
    % error_L2 computes the error, using the exact solution and the L2-norm
    error_L2 = error_L2(u,u_exact,10);
    % ----------------------------
        
    
endfunction