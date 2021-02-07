clc;
clear all;
global EMPTY BACTERIUM1 DEAD1 BORDER MAX_NUTRIENT CONSUMED1 CONSUMED2 BACTERIUM2 DEAD2;

EMPTY = 0; 
BACTERIUM1 = 1; BACTERIUM2 = 2; %bact1 maroon,   bact2   orange
DEAD1 = 3; DEAD2 = 4;    % dead1 light blue,     dead2  green  
BORDER = 5;
MAX_NUTRIENT = 0.999; CONSUMED1 = 0.1; CONSUMED2 = 0.1; 


m = 100; %number of rows
n = 100; %number of columns
probInitBacteria = 0.5; %probability of bacteriaum in initial grid
prob_bact1 = 0.5; % probability of a cell having bacteria1 initially given a cell has a bacteria
diffusionRate = 0.1; %rate of diffusion of nutrients(0 to 0.125)
p1 = 0.3 ; %probability of dividing of bacterium1
p2 = 0.5; %probability of dividing of bacterium2
t = 150;

bacteriaGrid = initBacteriaGrid(m, n, probInitBacteria,prob_bact1);
nutrientGrid = initNutrientGrid(m,n);
bacGrids = zeros(m,n,t); %list of bacteria grids
nutGrids = zeros(m,n,t); %list of nutrient grids

for i = 1:t
    %i
    extNutrientGrid = extendNutrientGrid(nutrientGrid);
    nutrientGrid = applyDiffusionExtended(extNutrientGrid,diffusionRate);
    bacteriaGrid = grow(bacteriaGrid, nutrientGrid, p1,p2);
    nutrientGrid = consumption(bacteriaGrid, nutrientGrid);
    bacGrids(:,:,i) = bacteriaGrid;
    nutGrids(:,:,i) = nutrientGrid;
end

%for x = 1 : 25 : t
   % figure 
   % imagesc(bacGrids(:,:,x));
  %  title('BacGrid');
   % figure
   % title('NutGrid');
%imagesc(nutGrids(:,:,x));
%end
implay(bacGrids)
%implay(nutGrids)
%hist(bacGrids(:,:,t));
