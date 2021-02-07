function mat= extendNutrientGrid(mat)
    global MAX_NUTRIENT;
    matNS = [mat(size(mat,1),:) ; mat ;mat(1,:) ];
    mat = [zeros(size(matNS,1),1) matNS MAX_NUTRIENT*ones(size(matNS,1),1)];
end