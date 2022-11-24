function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  
output_precision(7);              %am pus aceasta precizie pentru a avea 6 zecimale dupa vigula
fid = fopen(nume,'r');            %deschid fisierului tot cu drepturi de citire

noduri=fgetl(fid);                %imi extrag numarul de noduri
noduri=str2num(noduri);

A = zeros(noduri);                %cu A si L fac acelasi lucru ca si la "Iterative"
L = zeros(noduri,1);              %A-baza pentru vectorul de adiacenta
                                  %L-baza pentru vectorul coloana de vecini
for ct=1:noduri                   %aici ii creez propriu zis
  linie=fgetl(fid);
  linie=str2num(linie);
  L(ct)=linie(2);
  for ct2=1:linie(2)
    if(linie(1)!=linie(2+ct2))
      A(linie(1),linie(2+ct2))=1;
    elseif(linie(1)==linie(2+ct2))
      L(ct)=L(ct)-1;
    endif
  endfor
endfor

M = zeros(noduri);                 %baza pentru M

for i=1:noduri                     %aici se creeaza M ca si in "Iterative"
  for j=1:noduri
    if A(i,j)==1
      M(j,i)=1/L(i);
    endif
  endfor
endfor

I=eye(noduri);                     %Vector unitate (ajuta la calcule)
V1 = ones(noduri,1);               %vector coloana de 1 (ajuta la calcule)

Q=I-d*M;                           %folosesc formulele de pe Wikipedia
B=PR_Inv(Q);
R=B*(1-d)/noduri*V1;

fclose(fid);                       %inchid fisierul folosit
endfunction