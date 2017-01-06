function [dx_SF,dy_SF] = sf_derivate(SF)    polynomial_degree= sqrt(length(SF))-1;    dx_SF = zeros(length(SF),length(SF));    dy_SF = zeros(length(SF),length(SF));    for row=1:length(SF)        % read shape function         shape_function = SF(row,:);        % dx_SF        dx_SF(row,1) = shape_function(2); % a*x^1y^0 -> a*x^0*y^0 is always true        dy_SF(row,1) = shape_function(3); % a*x^0y^1 -> a*x^0*y^0 is always true        for i=1:polynomial_degree            for j=1:polynomial_degree                dx_SF(row,hf_exponent_to_column(i-1,j))= i*shape_function(hf_exponent_to_column(i,j));            endfor        endfor        for i=1:polynomial_degree            for j=1:polynomial_degree                dy_SF(row,hf_exponent_to_column(i,j-1))= j*shape_function(hf_exponent_to_column(i,j));            endfor        endfor    endforendfunction