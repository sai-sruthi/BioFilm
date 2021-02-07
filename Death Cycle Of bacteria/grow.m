
%probability that a bacterium will divide is p times 
%the cell's nutrition value
function [bacteriaGrid, nutritionGrid] = grow(bacteriaGrid, nutritionGrid,p)
    global BACTERIUM DEAD DEAD2 DEAD3 CONSUMED
    count = 0; count2 = 0; count3 = 0;
    bacGrid = bacteriaGrid;
    [m n]= size(nutritionGrid);
    
    extBacGrid = extendBacteriaGrid(bacteriaGrid);
    extNutGrid = extendNutrientGrid(nutritionGrid);
    
   % m
    %n
    for i = 2: (m+1)
        for j = 2 : (n+1)
            if(extBacGrid(i,j) == BACTERIUM)
                if(extNutGrid(i,j)< CONSUMED)
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
            elseif extBacGrid (i,j) == DEAD
                   [bacGrid nutritionGrid] = deathcycle(bacGrid, nutritionGrid, i-1,j-1); 
                   count = count + 1;
            elseif extBacGrid(i,j) == DEAD2
                [bacGrid nutritionGrid] = deathcycle(bacGrid, nutritionGrid, i-1,j-1);
                count2 = count2 + 1;
            elseif extBacGrid(i,j) == DEAD3
                [bacGrid nutritionGrid] = deathcycle(bacGrid, nutritionGrid, i-1,j-1);
                count3 = count3 + 1;
            end
        end
    end
    bacteriaGrid = bacGrid;
    %fprintf('%d %d %d\n',count, count2, count3);
end


