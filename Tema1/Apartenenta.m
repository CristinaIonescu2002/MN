function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1
  
a=1/(val2-val1);        %calculez a si b pentru ca functia sa fie continua
b=a*val1*(-1);

if(x>=0 && x<val1)      %dau valoare lui y in fuctie de intervalul in care este x
  y=0;
elseif(x>=val1 && x<=val2)
  y=a*x+b;
elseif(x>val2 && x<=1)
  y=1;
endif
 
endfunction