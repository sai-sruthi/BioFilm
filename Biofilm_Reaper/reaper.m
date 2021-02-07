function [x, y] = reaper(i, j, m) %Parameters
   
%     count = 4;
    newi=i-1;
    newj=j-1;
    u=rand;%The random position is selected
        
    if(u<0.25)%North
            if(newi>1)
                x=newi-1;
                y=newj;
            else
                x=m;   
                y=newj;
            end
     elseif(u<0.5&&u>0.25)%east
                x=newi;
                y=newj+1;
     elseif(u<0.75&&u>0.5)%south
                    if(newi<m)
                     x=newi+1;
                     y=newj;
                    else
                       x=1;
                       y=newj;
                    end
     else%west
                  if(newj>1)
                   x=newi;
                   y=newj-1;
                  else
                      x=floor(rand*85)+2;
                      y=floor(rand*85)+2;
                  end
                      
     end
    
   % newi
  %  newj
   % x
   % y
    
end