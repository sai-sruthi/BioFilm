
function [nutrientGrid] = applyDiffusionExtended(extNutrientGrid, DiffusionRate)
    nutrientGrid = zeros(size(extNutrientGrid) - 2);
    
    %size(extNutrientGrid) - 2
    for i = 1: size(nutrientGrid,1)
        for j = 1 : size(nutrientGrid,2)
            ei = i + 1;
            ej = j + 1;
            
            sum = extNutrientGrid(ei-1,ej-1) + extNutrientGrid(ei-1,ej) + extNutrientGrid(ei - 1, ej +1) + extNutrientGrid(ei, ej -1) + extNutrientGrid(ei, ej+1)+ extNutrientGrid(ei + 1, ej-1) + extNutrientGrid(ei+1, ej) + extNutrientGrid(ei+1,ej+1);
            nutrientGrid(i,j) = min(1,(1 - 8 * DiffusionRate) * extNutrientGrid(ei,ej) + DiffusionRate * sum);
        end
    end
end