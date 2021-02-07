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
reap_pos2_a=floor(rand*5)+2;
reap_pos_a=zeros(1,2);
reap_pos1_b=floor(rand*45)+2;
reap_pos2_b=floor(rand*5)+2;
reap_pos_b=zeros(1,2);
%reap_position=zeros(2,1);
bacteriaGrid = initBacteriaGrid(m, n, probInitBacteria);
nutrientGrid = initNutrientGrid(m,n);
bacGrids = zeros(m,n,t); %list of bacteria grids
nutGrids = zeros(m,n,t); %list of nutrient grids

for i = 1:t
    %disp('Time'+i);
    extNutrientGrid = extendNutrientGrid(nutrientGrid);
    nutrientGrid = applyDiffusionExtended(extNutrientGrid,diffusionRate);
   % disp('Bac grid before growing');
    %bacteriaGrid
    bacteriaGrid = grow(bacteriaGrid, nutrientGrid, p);
    extBacGrid = extendBacteriaGrid(bacteriaGrid);
    %reap_pos=logical(reap_pos); 
    
    
    nutrientGrid = consumption(bacteriaGrid, nutrientGrid);
    bacGrids(:,:,i) = bacteriaGrid;
   % bacGrids;
    nutGrids(:,:,i) = nutrientGrid;
end
