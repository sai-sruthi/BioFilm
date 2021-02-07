
function extBacGrid = extendBacteriaGrid(bacteriaGrid)
    
    global BORDER
    [m n] = size(bacteriaGrid);
    newCol = zeros(m+2,1);
    MatNS = [bacteriaGrid(m,:) ; bacteriaGrid ; bacteriaGrid(1,:)];   % periodic boundary condition

    for i = 1 : m+2                                             % number of rows increased by 2 in matNS
    newCol(i,1) = BORDER;
    end
    
    extBacGrid = [newCol MatNS newCol];   
end