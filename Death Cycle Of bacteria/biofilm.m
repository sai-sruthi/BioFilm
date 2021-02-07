clc;
clear all;
global EMPTY BACTERIUM DEAD BORDER MAX_NUTRIENT CONSUMED flag DEAD2 DEAD3;

A = [0 0 0; 0 0 1; 1 0 1; 1 1 0; 0 1 0; 1 1 1];
% BLACK BLUE MAGNETA YELLOW CYAN WHITE
EMPTY = 0; BACTERIUM = 1; DEAD = 2; BORDER = 3;
MAX_NUTRIENT = 0.999; CONSUMED = 0.1; flag=0;
DEAD2=4; DEAD3=5;

m = 100; %number of rows
n = 100; %number of columns
probInitBacteria = 0.5; %probability of bacteriaum in initial grid
diffusionRate = 0.1; %rate of diffusion of bacterium(0 to 0.125)
p = 0.3; %probability of dividing of bacterium
t = 1500;

bacteriaGrid = initBacteriaGrid(m, n, probInitBacteria);
nutrientGrid = initNutrientGrid(m,n);
bacGrids = zeros(m,n,t); %list of bacteria grids
nutGrids = zeros(m,n,t); %list of nutrient grids

for i = 1:t
    %disp('Time'+i);
    extNutrientGrid = extendNutrientGrid(nutrientGrid);
    nutrientGrid = applyDiffusionExtended(extNutrientGrid,diffusionRate);
    %disp('Bac grid before growing');
    %bacteriaGrid
    [bacteriaGrid nutrientGrid] = grow(bacteriaGrid, nutrientGrid, p);
    %[nutrientGrid bacteriaGrid] = deathcycle();
    nutrientGrid = consumption(bacteriaGrid, nutrientGrid);
    bacGrids(:,:,i) = bacteriaGrid;
    nutGrids(:,:,i) = nutrientGrid;
    %if mod(i,10) == 0
       % figure;
       %imshow(bacteriaGrid+1 ,A);
    %end
end
implay(bacGrids);
implay(nutGrids);