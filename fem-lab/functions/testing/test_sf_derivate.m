function correct = test_sf_derivate()    % by hand calculated gradient    dx_SF = [-1,0,1,0;1,0,-1,0;0,0,-1,0;0,0,1,0];    dy_SF = [-1,1,0,0;0,-1,0,0;1,-1,0,0;0,1,0,0];    % generate gradient by our function    [dx_SF_generated,dy_SF_generated] = sf_derivate(sf_generate(1));    % if generated gradient and by hand calculated gradient are equal we can say that our function sf_derivate works fine.    correct = 0;    if(dx_SF == dx_SF_generated && dy_SF == dy_SF_generated)        correct = 1;    endifendfunction