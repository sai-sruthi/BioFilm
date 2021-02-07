function [bacGrid nutGrid] = deathcycle(bacGrid, nutGrid, i, j)
    global DEAD DEAD2 DEAD3 MAX_NUTRIENT EMPTY;
    decay_rate = 0.4;
    A = [0 0 0; 0 0 1; 1 0 1; 1 1 0; 0 1 1; 1 1 1];
    if bacGrid(i,j) == DEAD
        nutGrid(i,j) = (decay_rate)*MAX_NUTRIENT;
        nutGrid(i,j) = 0.3;
        bacGrid(i,j) = DEAD2;
        %disp(nutGrid(i,j));
    elseif bacGrid(i,j) == DEAD2
        nutGrid(i,j) = (1 + decay_rate)*nutGrid(i,j);
        %disp('DEAD2');
        %nutGrid(i,j) = 0.6;
        bacGrid(i,j) = DEAD3;
        %figure;
        %imshow(bacGrid+1 ,A);
    elseif bacGrid(i,j) == DEAD3
        %nutGrid(i,j) = (1 + decay_rate)*nutGrid(i,j);
        %disp('DEAD3');
        nutGrid(i,j) = MAX_NUTRIENT;
        bacGrid(i,j) = EMPTY;
        %disp(nutGrid(i,j));
        %figure;
        %imshow(bacGrid+1 ,A);

    end
   % disp('====');
end