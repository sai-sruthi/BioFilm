
function [nutritionGrid] = consumption(nutritionGrid,bacteriaGrid)
    %------------------------------------------------------------------
    global BACTERIUM SELF_CONSUMPTION NEIGHBOUR_CONSUMPTION DEAD;
    %-----------------------------------------------------------
    [m n] = size(nutritionGrid);
    nutGrid = extendNutrientGrid(nutritionGrid);
    bacteriaGrid = extendBacteriaGrid(bacteriaGrid);
    for i = 2:m+1
        for j = 2:n+1
            %-------------------------------------------------------------------
            temp_neighbour_nut = NEIGHBOUR_CONSUMPTION;
            neighbour_nutrition = nutGrid(i-1,j) + nutGrid(i,j+1) + nutGrid(i+1,j) + nutGrid(i,j-1); 
            if(bacteriaGrid(i,j) == BACTERIUM  && nutGrid(i,j) >= SELF_CONSUMPTION && neighbour_nutrition >= NEIGHBOUR_CONSUMPTION)
                nutGrid(i,j) = nutGrid(i,j) - SELF_CONSUMPTION;
                if(nutGrid(i-1,j)<temp_neighbour_nut / 4)
                    temp_neighbour_nut=temp_neighbour_nut - nutGrid(i-1,j);
                    nutGrid(i-1,j) = 0;
                else 
                    nutGrid(i-1,j) = nutGrid(i-1,j) - temp_neighbour_nut / 4;
                    temp_neighbour_nut = temp_neighbour_nut - temp_neighbour_nut/4;
                end
                if(nutGrid(i,j+1)<temp_neighbour_nut / 3)
                    temp_neighbour_nut=temp_neighbour_nut - nutGrid(i,j+1);
                    nutGrid(i,j+1) = 0;
                else 
                    nutGrid(i,j+1) = nutGrid(i,j+1) - temp_neighbour_nut / 3;
                    temp_neighbour_nut = temp_neighbour_nut - temp_neighbour_nut/3;
                end
                if(nutGrid(i+1,j)<temp_neighbour_nut / 2)
                    temp_neighbour_nut=temp_neighbour_nut - nutGrid(i+1,j);
                    nutGrid(i+1,j) = 0;
                else 
                    nutGrid(i+1,j) = nutGrid(i+1,j) - temp_neighbour_nut / 2;
                    temp_neighbour_nut = temp_neighbour_nut - temp_neighbour_nut/2;
                end
                if(nutGrid(i,j-1)<temp_neighbour_nut)
                    temp_neighbour_nut=temp_neighbour_nut - nutGrid(i,j-1);
                    nutGrid(i,j-1) = 0;
                else 
                    nutGrid(i,j-1) = nutGrid(i,j-1) - temp_neighbour_nut;
                    temp_neighbour_nut = temp_neighbour_nut - temp_neighbour_nut;
                end
            else
                bacteriaGrid(i,j)=DEAD;
            %----------------------------------------------------------------
              
               
            end
        end
    end
    
    nutritionGrid = nutGrid(2:m+1,2:n+1);
end