function mat = initBacteriaGrid(m,n,probInitBacteria)
    
    global EMPTY BACTERIUM;
    
    emptyMat = EMPTY * ones(m,n-1);
    onSurface = zeros(m,1);
    for i=1:m
        if (rand < probInitBacteria)
            onSurface(i,1) = BACTERIUM;
        else
            onSurface(i,1) = EMPTY;
        end
    end
    mat = [onSurface emptyMat];
end