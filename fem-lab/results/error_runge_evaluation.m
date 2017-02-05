function error_runge_evaluation()    add_fem_lab();    % --- Acknowledgments ---    % 'A posteriori analysis for PDE's' by S. Repin, Page 60    % Document can be found here: https://math.aalto.fi/opetus/lme/ApostPDERepin.pdf    % -----------------------        % The Goal of that function is to show that the old fashioned error estimator from C. Runge is actually a good error estimator for our    % case. Therefore we want to have a sequence of mesh sizes like    % (mesh_size, mesh_size/2, mesh_size/4, mesh_size/8, ...)     % and show that the solution is converging with decreasing mesh size.    % So we want to show computationally that the sequence of solutions with decreasing mesh sizes is a cauchy sequence.    % Also we want to show that the convergence order is similar to the convergence order of the L2 error with the analytical solution    % converging to 0 with decreasing mesh size.    % Initialize necessary variables, constants and functions    MIN_MESH_SIZE = 64;    counter = 1;    pol_deg= 1;    SF=sf_generate(pol_deg);        % Initialize vectors containg the errors of L2 and the error estimator with Runge     l2 = zeros(MIN_MESH_SIZE/2,1);    runge = zeros(MIN_MESH_SIZE/2,1);    mesh_size = 1;        while(mesh_size > 1/MIN_MESH_SIZE )                    mesh_size = mesh_size/2;        disp("Mesh size:"),disp(mesh_size) ;        fflush(stdout);        [error_L2 , overall_runtime, u_coeff, error_runge] = main(mesh_size,1);        l2(counter) = error_L2;        runge(counter) = error_runge;        counter++;            endwhile        % Plot results    x = zeros(1,size(l2));    mesh_size = 1;    for i=1:size(l2)        x(i) = mesh_size;        mesh_size = mesh_size/2;    endfor        h = figure(1);    semilogy(x,l2,'r',x,runge,'b');    grid on;    set(gca, "linewidth", 0.5 , "fontsize", 12);    title('Empirical investigation on the accuracy of the runge a posteriori error indicator')    axis([x(length(l2)) 1]);    leg = legend ("Exact error", "Runge error indicator");	legend (leg, "location", "northwest");    xlabel("MESH SIZE");    ylabel("L2 Error");    print(h,'-dpng','-color','error_runge.png')endfunction   