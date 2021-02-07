
%probability that a bacterium will divide is p times 
%the cell's nutrition value
function [bacteriaGrid] = grow(bacteriaGrid, nutritionGrid, p)
    global BACTERIUM DEAD

    bacGrid = bacteriaGrid;
    [m n]= size(nutritionGrid);
    
    extBacGrid = extendBacteriaGrid(bacteriaGrid);
    extNutGrid = extendNutrientGrid(nutritionGrid);
    
   % m
    %n
    for i = 2: (m+1)
        for j = 2 : (n+1)
            if(extBacGrid(i,j) == BACTERIUM)
                if(extNutGrid(i,j) <= 0)
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