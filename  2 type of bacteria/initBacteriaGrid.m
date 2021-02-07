function mat = initBacteriaGrid(m,n,probInitBacteria,prob_bact1)
    
    global EMPTY BACTERIUM1 BACTERIUM2;
    
    emptyMat = EMPTY * ones(m,n-1);
    onSurface = zeros(m,1);
    for i=1:m
        
        if (rand < probInitBacteria)
            if (rand < prob_bact1)
                onSurface(i,1) = BACTERIUM1;
            else
                onSurface(i,1) = BACTERIUM2;
            end;
        else
            onSurface(i,1) = EMPTY;
        end
    end
    mat = [onSurface emptyMat];
end