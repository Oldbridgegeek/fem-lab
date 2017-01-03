function [cell_no,sf_no] = node_node_to_cells(node_no,mesh_size,polynomial_deg)
    cells_per_row=(1/mesh_size);
    nodes_per_row=(polynomial_deg*cells_per_row)+1
    nodes_per_edge=polynomial_deg+1;
    node_j=0;
    while (node_j+1)*nodes_per_row<node_no
        node_j++;
    endwhile
    node_i=node_no-node_j*nodes_per_row-1
    node_j
    if ((floor(node_i/polynomial_deg)==node_i/polynomial_deg))
        if (floor(node_j/polynomial_deg)==node_j/polynomial_deg)       
            if (node_i==0)
                if (node_j==0)
                    cell_no=[0;0;0;1];
                    sf_no=[0;0;0;1];
                else
                    if(node_j==nodes_per_row-1)
                        cell_no=[0;cells_per_row*(cells_per_row-1)+1;0;0];
                        sf_no=[0;nodes_per_edge^2-polynomial_deg;0;0];
                    else
                        cell_no=[0;((node_j/polynomial_deg)-1)*cells_per_row+(node_i/polynomial_deg)+1;0;((node_j/polynomial_deg))*cells_per_row+(node_i/polynomial_deg)+1];
                        sf_no=[0;nodes_per_edge^2-polynomial_deg;0;1]
                    endif
                endif
            else
                if (node_i==nodes_per_row-1)
                    if (node_j==0)
                        cell_no=[0;0;cells_per_row;0];
                        sf_no=[0;0;nodes_per_edge;0];
                    else
                        if (node_j==nodes_per_row-1)
                            cell_no=[cells_per_row^2;0;0;0];
                            sf_no=[nodes_per_edge^2;0;0;0]
                        else
                            cell_no=[((node_j/polynomial_deg)-1)*cells_per_row+(node_i/polynomial_deg);0;((node_j/polynomial_deg))*cells_per_row+(node_i/polynomial_deg);0];
                            sf_no=[nodes_per_edge^2;0;1+polynomial_deg;0];
                        endif
                    end    
                else
                    if (node_j==0)
                        cell_no=[0;0;((node_j/polynomial_deg))*cells_per_row+(node_i/polynomial_deg);((node_j/polynomial_deg))*cells_per_row+(node_i/polynomial_deg)+1];
                        sf_no=[0;0;1+polynomial_deg;1];
                    else
                        cell_no(1,1)=((node_j/polynomial_deg)-1)*cells_per_row+(node_i/polynomial_deg);
                        cell_no(2,1)=((node_j/polynomial_deg)-1)*cells_per_row+(node_i/polynomial_deg)+1;
                        cell_no(3,1)=((node_j/polynomial_deg))*cells_per_row+(node_i/polynomial_deg);
                        cell_no(4,1)=((node_j/polynomial_deg))*cells_per_row+(node_i/polynomial_deg)+1;
                        sf_no(1,1)=nodes_per_edge^2;
                        sf_no(2,1)=nodes_per_edge^2-polynomial_deg;
                        sf_no(3,1)=1+polynomial_deg;
                        sf_no(4,1)=1;
                    endif
                endif
            endif    
        else
            sf_j=(((node_j)/polynomial_deg)-floor((node_j)/polynomial_deg))*polynomial_deg
            cell_no=[(floor(node_j/polynomial_deg))*cells_per_row+(node_i/polynomial_deg);(floor(node_j/polynomial_deg))*cells_per_row+(node_i/polynomial_deg)+1]
            sf_no=[(nodes_per_edge)*(sf_j+1);1+(nodes_per_edge*sf_j)]
        endif
    else
        sf_i=(((node_i)/polynomial_deg)-floor((node_i)/polynomial_deg))*polynomial_deg 
        if (floor(node_j/polynomial_deg)==node_j/polynomial_deg)
            if (node_j/polynomial_deg==0)
                cell_no=((node_j/polynomial_deg))*cells_per_row+floor(node_i/polynomial_deg)+1
                sf_no=sf_i+1
            else
                if (node_j==nodes_per_row-1)
                    cell_no=((node_j/polynomial_deg)-1)*cells_per_row+floor(node_i/polynomial_deg)+1
                    sf_no=nodes_per_edge*(nodes_per_edge-1)+sf_i+1  
                else
                    cell_no=[((node_j/polynomial_deg)-1)*cells_per_row+floor(node_i/polynomial_deg)+1;((node_j/polynomial_deg))*cells_per_row+floor(node_i/polynomial_deg)+1]
                    sf_no=[nodes_per_edge*(nodes_per_edge-1)+sf_i+1;sf_i+1]            
                endif
            endif
        else
            sf_j=(((node_j)/polynomial_deg)-floor((node_j)/polynomial_deg))*polynomial_deg
            cell_no=(floor((node_j)/polynomial_deg))*cells_per_row+floor((node_i)/polynomial_deg)+1
            sf_no=sf_j*nodes_per_edge+sf_i+1
        endif
    endif
endfunction