function [x y] = pickNeighbor(i, j, m, N, E, S, W) %Parameters
    global EMPTY;
    lst = [N E S W];
    %i 
    %j
    %lst
    count = 0;
    pos = zeros(size(lst));
    
    for k = 1:size(lst,2)
        if(lst(k) == EMPTY)
              count = count + 1;
            pos(count) = k;
      
        end
    end
  % pos
    newi=i-1;
    newj=j-1;
    if(pos(1)== 0)
        x=newi;
        y=newj;
    else
        u=floor(count*rand)+1;%The random position is selected
        
        if(pos(u)==1)%North
            if(newi>1)
                x=newi-1;
                y=newj;
            else
                x=m;   
                y=newj;
            end
        else
            if(pos(u)==2)%east
                x=newi;
                y=newj+1;
            else
                if(pos(u)==3)%south
                    if(newi<m)
                     x=newi+1;
                     y=newj;
                    else
                       x=1;
                       y=newj;
                    end
                else%west
                   x=newi;
                   y=newj-1;
                end
            end
        end
    end
   % newi
  %  newj
   % x
   % y
    
end