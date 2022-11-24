function r = fy(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de y a lui f in punctul (x, y).
    % =========================================================================
    
    % TODO: Calculeaza derivata.
  a=f(y+1,x);
  b=f(y-1,x);
  r=(a-b)/2;
endfunction