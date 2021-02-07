
function [nutritionGrid] = consumption(bacteriaGrid, nutritionGrid)
    global BACTERIUM CONSUMED
    [m n] = size(nutritionGrid);
    nutGrid = nutritionGrid;
    
    for i = 1:m
        for j = 1:n
            if(bacteriaGrid(i,j) == BACTERIUM)
                nutGrid(i,j) = max(0, nutGrid(i,j) - CONSUMED);
            end
        end
    end
    
    nutritionGrid = nutGrid;
end