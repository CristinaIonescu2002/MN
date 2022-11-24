function A = bicubic_coef(f, Ix, Iy, Ixy, x1, y1, x2, y2)
    % =========================================================================
    % Calculeaz? coeficien?ii de Interpolare Bicubic? pentru 4 puncte al?turate
    % =========================================================================

    % TODO: Calculeaz? matricile intermediare.
  B=[1 0 0 0; 0 0 1 0; -3 3 -2 -1; 2 -2 1 1];
  C=zeros(4,4);
  
  C(1,1)=f(y1,x1);
  C(2,1)=f(y1,x2);
  C(3,1)=Ix(y1,x1);
  C(4,1)=Ix(y1,x2);
  
  C(1,2)=f(y2,x1);
  C(2,2)=f(y2,x2);
  C(3,2)=Ix(y2,x1);
  C(4,2)=Ix(y2,x2);
  
  C(1,3)=Iy(y1,x1);
  C(2,3)=Iy(y1,x2);
  C(3,3)=Ixy(y1,x1);
  C(4,3)=Ixy(y1,x2);
  
  C(1,4)=Iy(y2,x1);
  C(2,4)=Iy(y2,x2);
  C(3,4)=Ixy(y2,x1);
  C(4,4)=Ixy(y2,x2);

  D=[1 0 -3 2; 0 0 3 -2; 0 1 -2 1; 0 0 -1 1];
    % TODO: Converte?te matricile intermediare la double.
  B=cast(B,'double');
  C=cast(C,'double');
  D=cast(D,'double');
    % TODO: Calculeaz? matricea final?.
  A=B*C*D;
endfunction