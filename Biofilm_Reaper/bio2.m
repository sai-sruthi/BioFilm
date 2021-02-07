clc;
clear all;
global EMPTY BACTERIUM DEAD REAPER BORDER MAX_NUTRIENT CONSUMED;

EMPTY = 0; BACTERIUM = 1; DEAD = 2; BORDER = 3;REAPER=6;
MAX_NUTRIENT = 0.999; CONSUMED = 0.5;


m = 100; %number of rows
n = 100; %number of columns
probInitBacteria = 0.17; %probability of bacteriaum in initial grid
diffusionRate = 0.1; %rate of diffusion of bacterium(0 to 0.125)
p = 0.7; %probability of dividing of bacterium
t = 400;
reap_pos1_a=floor(rand*85)+2;
reap_pos2_a=floor(rand*15)+2;
reap_pos_a=zeros(1,2);
reap_pos1_b=floor(rand*45)+2;
reap_pos2_b=floor(rand*25)+2;
reap_pos_b=zeros(1,2);
%reap_position=zeros(2,1);
bacteriaGrid = initBacteriaGrid(m, n, probInitBacteria);
nutrientGrid = initNutrientGrid(m,n);
bacGrids = zeros(m,n,t); %list of bacteria grids
nutGrids = zeros(m,n,t); %list of nutrient grids

for i =1:t
    extNutrientGrid = extendNutrientGrid(nutrientGrid);
    nutrientGrid = applyDiffusionExtended(extNutrientGrid,diffusionRate);
   % disp('Bac grid before growing');
    %bacteriaGrid
    bacteriaGrid = grow(bacteriaGrid, nutrientGrid, p);
    extBacGrid = extendBacteriaGrid(bacteriaGrid);
    %reap_pos=logical(reap_pos); 
    for j=1:5
    [reap_pos_a(1),reap_pos_a(2)] = reaper(reap_pos1_a,reap_pos2_a,m);
    if (reap_pos_a(1)-1>0 && reap_pos_a(1)-1<m  &&reap_pos_a(2)-1>0 && reap_pos_a(2)-1<n  )
    if (bacteriaGrid(reap_pos_a(1)-1,reap_pos_a(2)-1)==BACTERIUM)
    bacteriaGrid(reap_pos_a(1)-1,reap_pos_a(2)-1)=REAPER;
    end
    reap_pos1_a=reap_pos_a(1);
    reap_pos2_a=reap_pos_a(2);
    end  
    [reap_pos_b(1),reap_pos_b(2)] = reaper(reap_pos1_b,reap_pos2_b,m);
    if (reap_pos_b(1)-1>0 && reap_pos_b(1)-1<m  &&reap_pos_b(2)-1>0 && reap_pos_b(2)-1<n  )
        if (bacteriaGrid(reap_pos_b(1)-1,reap_pos_b(2)-1)==BACTERIUM)
    bacteriaGrid(reap_pos_b(1)-1,reap_pos_b(2)-1)=REAPER;
        end
    reap_pos1_b=reap_pos_b(1);
    reap_pos2_b=reap_pos_b(2);
    end
    end
     nutrientGrid = consumption(bacteriaGrid, nutrientGrid);
    bacGrids(:,:,i) = bacteriaGrid;
   % bacGrids;
    nutGrids(:,:,i) = nutrientGrid;
end