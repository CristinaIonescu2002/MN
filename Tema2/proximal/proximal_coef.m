function a = proximal_coef(f, x1, y1, x2, y2)
    % =========================================================================
    % Calculeaza coeficientii a pentru Interpolarea Proximala intre punctele
    % (x1, y1), (x1, y2), (x2, y1) si (x2, y2).
    % =========================================================================
    
    % TODO: Calculeaza matricea A.
    A=ones(4);
    A(1,2)=x1;
    A(1,3)=y1;
    A(1,4)=x1*y1;
    
    A(2,2)=x1;
    A(2,3)=y2;
    A(2,4)=x1*y2;
    
    A(3,2)=x2;
    A(3,3)=y1;
    A(3,4)=x2*y1;
    
    A(4,2)=x2;
    A(4,3)=y2;
    A(4,4)=x2*y2;
    % TODO: Calculeaza vectorul b.    
    b=zeros(4,1);
    for i=1:4
      x=A(i,2);
      y=A(i,3);
      b(i)=f(y,x);
    endfor
    % TODO: Calculeaza coeficientii.
    a=A\b;
endfunction