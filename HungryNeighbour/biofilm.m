clc;
clear all;
global EMPTY BACTERIUM DEAD BORDER MAX_NUTRIENT SELF_CONSUMPTION NEIGHBOUR_CONSUMPTION bacteriaGrid;
%----------------------------------------------------------------------
%GLOABAL CHANGED, nutGrid function call passes different args, consumption
%and grow functions changed
%------------------------------------------------------------------------
EMPTY = 0; BACTERIUM = 1; DEAD = 2; BORDER = 3;
MAX_NUTRIENT = 0.999; SELF_CONSUMPTION = 0.1; NEIGHBOUR_CONSUMPTION = 0.01;


m = 100; %number of rows
n = 100; %number of columns
probInitBacteria = 0.5; %probability of bacteriaum in initial grid
diffusionRate = 0.1; %rate of diffusion of bacterium(0 to 0.125)
p = 0.3; %probability of dividing of bacterium
t = 2000;

bacteriaGrid = initBacteriaGrid(m, n, probInitBacteria);
nutrientGrid = initNutrientGrid(m,n);
bacGrids = zeros(m,n,t); %list of bacteria grids
nutGrids = zeros(m,n,t); %list of nutrient grids

for i = 1:t
 %   disp('Time'+i);
    extNutrientGrid = extendNutrientGrid(nutrientGrid);
    nutrientGrid = applyDiffusionExtended(extNutrientGrid,diffusionRate);
   % disp('Bac grid before growing');
    %bacteriaGrid
    bacteriaGrid = grow(bacteriaGrid, nutrientGrid, p);
    
    nutrientGrid = consumption(nutrientGrid,bacteriaGrid);
    bacGrids(:,:,i) = bacteriaGrid;
    nutGrids(:,:,i) = nutrientGrid;
end