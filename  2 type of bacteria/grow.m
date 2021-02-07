
%probability that a bacterium will divide is p times 
%the cell's nutrition value
function [bacteriaGrid] = grow(bacteriaGrid, nutritionGrid, p1,p2)
    global BACTERIUM1 BACTERIUM2 DEAD1 DEAD2

    bacGrid = bacteriaGrid;
    [m n]= size(nutritionGrid);
    
    extBacGrid = extendBacteriaGrid(bacteriaGrid);
    extNutGrid = extendNutrientGrid(nutritionGrid);
    
    for i = 2: (m+1)
        for j = 2 : (n+1)
            
            if(extBacGrid(i,j) == BACTERIUM1)
                if(extNutGrid(i,j) <= 0)
                    bacGrid(i-1, j -1) = DEAD1;
                else
                    if(rand < p1 * extNutGrid(i,j))
                        [newi newj] = pickNeighbor(i, j, m, extBacGrid(i -1,j), extBacGrid(i, j+1), extBacGrid(i + 1, j), extBacGrid(i, j - 1));
                        bacGrid(newi, newj) = BACTERIUM1;
                    end
                end
                
            elseif(extBacGrid(i,j) == BACTERIUM2)
                if(extNutGrid(i,j) <= 0)
                    bacGrid(i-1, j -1) = DEAD2;
                else
                    if(rand < p2 * extNutGrid(i,j))
                        [newi newj] = pickNeighbor(i, j, m, extBacGrid(i -1,j), extBacGrid(i, j+1), extBacGrid(i + 1, j), extBacGrid(i, j - 1));
                        bacGrid(newi, newj) = BACTERIUM2;
                    end
                end
            
                
            end
        end
    end
    bacteriaGrid = bacGrid;
end