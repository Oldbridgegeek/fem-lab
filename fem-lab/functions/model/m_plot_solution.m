function m_plot_solution(u_coeff,Cell,Vertex,SF)    % We want to plot our approximated solution and the analytical solution.    % ---- Mesh and shape function properties -----    % ---------------------------------------------    % Analytical solution    f = @(x,y) (1/(1+2*pi^2)).*cos(pi.*x).*cos(pi.*y);        % Right hand side of the initial problem    g = @(x,y) cos(pi.*x).*cos(pi.*y);        % Plotting properties    x=0:1/10:1;    y=x;        % Initialize matrices saving the value of the function for specific x and y values.    Z = zeros(length(x),length(y));    A = zeros(length(x),length(y));        % Calculate matrix saving the value of the approximated function for values x(i) and y(j)    for i=1:length(x)        for j=1:length(y)            Z(i,j)=hf_eval_solution_vectorized(x(i),y(j),u_coeff,Cell,Vertex,SF);        endfor    endfor        % Calculate matrices saving the value of the for analytical solution and right hand side of initial problem for values x(i) and y(j)    [X,Y]=meshgrid(x,x);        % Plot analytical solution    figure(1);    mesh(x,y,f(X,Y));    axis([0 1 0 1 f(1,0) f(0,0)]);    xlabel ("x");    ylabel ("y");    zlabel ("u(x,y)");        % Plot right hand side of initial problem    figure(2);    mesh(x,y,g(X,Y));    axis([0 1 0 1 -1 1]);    xlabel ("x");    ylabel ("y");    zlabel ("f(x,y)");        % Plot approximated solution by FEM    X = reshape(X,rows(X)*columns(X),1);    Y = reshape(Y,rows(Y)*columns(Y),1);    figure(3);    mesh(x,y,Z);    Z = reshape(Z,rows(Z)*columns(Z),1);            %scatter3(X,Y,Z);    %axis([0 1 0 1 Z(1,length(x)) Z(1,1)]);    xlabel ("x");    ylabel ("y");    zlabel ("u_h(x,y)");endfunction