
function [nutritionGrid] = consumption(bacteriaGrid, nutritionGrid)
    global BACTERIUM1 BACTERIUM2 CONSUMED1 CONSUMED2
    [m n] = size(nutritionGrid);
    nutGrid = nutritionGrid;
    
    for i = 1:m
        for j = 1:n
            if(bacteriaGrid(i,j) == BACTERIUM1)
                nutGrid(i,j) = max(0, nutGrid(i,j) - CONSUMED1);
            elseif(bacteriaGrid(i,j) == BACTERIUM2)
                nutGrid(i,j) = max(0, nutGrid(i,j) - CONSUMED2);
            
            end
        end
    end
    
    nutritionGrid = nutGrid;
end