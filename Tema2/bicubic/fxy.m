function r = fxy(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de x si y a lui f in punctul (x, y).
    % =========================================================================
    
    % TODO: Calculeaza derivata. 
  a=f(y+1,x+1);
  b=f(y-1,x-1);
  c=f(y-1,x+1);
  d=f(y+1,x-1);
  r=((a+b)-(c+d))/4;
endfunction