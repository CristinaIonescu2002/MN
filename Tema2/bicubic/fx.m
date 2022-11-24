function r = fx(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de x a lui f in punctul (x, y).
    % =========================================================================

    % TODO: Calculeaza derivata.
  a=f(y,x+1);
  b=f(y,x-1);
  r=(a-b)/2;
endfunction