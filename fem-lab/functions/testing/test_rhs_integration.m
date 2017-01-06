function correct = test_rhs_integration()    [vertex,cell] = mesh_generate(0.5);    SF = sf_generate(1);    % calculate correct value without transformation for basis function 1    data_set = [0,0,1;0,0.5,0;0.5,0,0;0.5,0.5,0];    shape_function = hf_interpolation(data_set);    f = @(x,y) cos(pi.*x).*cos(pi.*y).*hf_eval_poly(x,y,shape_function);    value = dblquad(f,0,0.5,0,0.5);    % generate value by function    rhs = rhs_integration(0.5,1,cell,vertex,SF);    % test for correctness    correct = 0;    if( abs(rhs(1) - value) < 0.001 )        correct = 1;    endif        % calculate correct value without transformation for basis function 5    % First Element    data_set = [0,0,0;0.5,0,0;0.5,0,0;0.5,0.5,1];    shape_function = hf_interpolation(data_set);    f = @(x,y) cos(pi.*x).*cos(pi.*y).*hf_eval_poly(x,y,shape_function);    value = value + dblquad(f,0,0.5,0,0.5);    % Second Element    data_set = [0.5,0,0;1,0,0;0.5,0.5,1;1,0.5,0];    shape_function = hf_interpolation(data_set);    f = @(x,y) cos(pi.*x).*cos(pi.*y).*hf_eval_poly(x,y,shape_function);    value = value + dblquad(f,0.5,1,0,0.5);    % Third Element    data_set = [0,0.5,0;0.5,0.5,1;0,1,0;0.5,1,0];    shape_function = hf_interpolation(data_set);    f = @(x,y) cos(pi.*x).*cos(pi.*y).*hf_eval_poly(x,y,shape_function);    value = value + dblquad(f,0,0.5,0.5,1);    % Fourth Element    data_set = [0.5,0.5,1;1,0.5,0;0.5,1,0;1,1,0];    shape_function = hf_interpolation(data_set);    f = @(x,y) cos(pi.*x).*cos(pi.*y).*hf_eval_poly(x,y,shape_function);    value = value +  dblquad(f,0.5,1,0.5,1);        % generate value by function    rhs = rhs_integration(0.5,1,cell,vertex,SF);    % test for correctness    correct = 0;    rhs(5)    value    if( abs(rhs(5) - value) < 0.001 )        correct = 1;    endif        endfunction