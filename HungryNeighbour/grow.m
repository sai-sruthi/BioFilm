
%probability that a bacterium will divide is p times 
%the cell's nutrition value
function [bacteriaGrid] = grow(bacteriaGrid, nutritionGrid, p)
    global BACTERIUM DEAD SELF_CONSUMPTION NEIGHBOUR_CONSUMPTION
    %-----------------------------------------------------------------
    %global changed
    %----------------------------------------------------------------

    bacGrid = bacteriaGrid;
    [m n]= size(nutritionGrid);
    
    extBacGrid = extendBacteriaGrid(bacteriaGrid);
    extNutGrid = extendNutrientGrid(nutritionGrid);
    neighbour_nutrition = 0;
   % m
    %n
    for i = 2: (m+1)
        for j = 2 : (n+1)
            if(extBacGrid(i,j) == BACTERIUM)
                %-------------------------------------------------------------------
                neighbour_nutrition = extNutGrid(i-1,j) + extNutGrid(i,j+1) + extNutGrid(i+1,j) + extNutGrid(i,j-1); 
                if(extNutGrid(i,j) <= SELF_CONSUMPTION || neighbour_nutrition < NEIGHBOUR_CONSUMPTION)
                %--------------------------------------------------------------------   
                    bacGrid(i-1, j -1) = DEAD;
                   %disp('Dead ');
                   %i-1
                   %j -1
                else
                    %i
                    %j
                    if(rand < p * extNutGrid(i,j))
                       % disp('Grow');
                        
                        %i
                        %j
                        [newi newj] = pickNeighbor(i, j, m, extBacGrid(i -1,j), extBacGrid(i, j+1), extBacGrid(i + 1, j), extBacGrid(i, j - 1));
                        bacGrid(newi, newj) = BACTERIUM;
                    %    newi
                     %   newj
                      
                    end
                end
                
            end
        end
    end
    bacteriaGrid = bacGrid;
end