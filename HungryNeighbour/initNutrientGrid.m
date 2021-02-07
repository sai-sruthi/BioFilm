function y = initNutrientGrid(m,n)
    global MAX_NUTRIENT;
    y = zeros(m,n);
    for i=1:m
        for j=1:n
            y(i, j) = MAX_NUTRIENT;
        end
    end
end