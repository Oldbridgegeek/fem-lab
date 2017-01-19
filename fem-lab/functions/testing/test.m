function correct = test()    % This script defines a global test function where we want to call all defined test functions and check whether we get     % for all those test functions the value true for correctness.    % The output of this function would be a vector containing 0 or 1. Each entry of the vector belongs to one test function.    % If the vector contains only 1, output instead of the whole vector just a single 1.     % Initialize the vector correct    correct = zeros(8,1);        % --- Call all testing functions defined and check for desired behaviour which is the value 1 ---    if(test_assemble_global() == 1)        correct(1) = 1;    endif    if(test_assemble_local() == 1)        correct(2) = 1;    endif    if(test_mesh_generate() == [1,1])        correct(3) = 1;    endif    if(test_rhs_integration() == 1)        correct(4) = 1;    endif    if(test_sf_derivate() == 1)        correct(5) = 1;    endif    if(test_sf_generate() == 1)        correct(6) = 1;    endif    if(test_hf_interpolation() == 1)        correct(7) = 1;    endif    if(test_solution() == 1)        correct(8) = 1;    endif    % --------------------------------------------------------------------------------------------------        % If everything is correct output just 1    test = 1;    for i=1:8        if ( correct(i) == 0)            test = 0;        endif    endfor    if ( test == 1 )        correct = 1;    endifendfunction