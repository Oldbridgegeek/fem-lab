function m_plot_solution(solution_vector,polynomial_deg,mesh_size)    SF = sf_generate(polynomial_deg);    [vertex,cell] = mesh_generate(mesh_size);    f = @(x,y) (1/(1+2*pi^2)).*cos(pi.*x).*cos(pi.*y);    x=0:0.1:1;    y=x;    Z = zeros(length(x),length(y));    A = zeros(length(x),length(y));    for i=1:length(x)        for j=1:length(y)            Z(i,j)=hf_eval_solution(x(i),y(j),solution_vector,cell,vertex,polynomial_deg,SF);        endfor    endfor        for i=1:length(x)        for j=1:length(y)            A(j,i)= f(x(i),y(j));        endfor    endfor        figure(1);    mesh(x,y,A);    xlabel ("x");    ylabel ("y");    zlabel ("u_h(x,y)");        figure(2);    mesh(x,y,Z);    xlabel ("x");    ylabel ("y");    zlabel ("u_h(x,y)");endfunction