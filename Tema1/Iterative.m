function R = Iterative(nume,d,eps)
  
  % Functia care calculeaza matricea R folosind alg. iterativ.
  % Intrari:
  % -> nume: numele fisierului din care se citeste;
  % -> d: coeficentul d, adica probabilitatea ca un anumit
  % navigator sa continue navigarea (0.85 in cele mai
  % multe cazuri)
  % -> eps: eruarea care apare in algoritm.
  % Iesiri:
  % -> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  
output_precision(7);      %am pus aceasta precizie pentru a avea 6 zecimale dupa vigula
fid = fopen(nume,'r');    %deschid fisierul doar cu drepruri de citire

noduri=fgetl(fid);        %extrag numarul de "noduri" si in transform in numar
noduri=str2num(noduri);

A = zeros(noduri);        %initializez A cu 0 pentru inceput (e matricea de adiacenta)
L = zeros(noduri,1);      %il creez pe L pentru a retine numarul de vecini al fiecarui nod
V1 = ones(noduri,1);      %vector coloana de 1 (ajuta la calcule)

for ct=1:noduri                       %citesc fiecare linie si o transform intr-un vector de numere
  linie=fgetl(fid);
  linie=str2num(linie);
  L(ct)=linie(2);                     %retin in L numarul vecinilor nodului
  for ct2=1:linie(2)                  %pentru fiecare vecin pun 1 in A
    if(linie(1)!=linie(2+ct2))    
      A(linie(1),linie(2+ct2))=1;
     elseif(linie(1)==linie(2+ct2))   %daca nodul este vecin cu el insusi nu se va trece nimic in A
       L(ct)=L(ct)-1;                   %dar vom scadea din numarul de vecini ai nodului
    endif
  endfor
endfor

M = zeros(noduri);                    %initializez o matrice de 0 

for i=1:noduri                        %pun numere in M dupa formula data
  for j=1:noduri
    if(A(i,j)==1)
      M(j,i)=1/L(i);
      endif
    endfor
  endfor

R=(1/noduri)*V1;                      %aplic formula de pe Wikipedia
Ant=(1/noduri)*R;
R=d*M*R+(1-d)/noduri*V1;

while(norm(R-Ant)>=eps)               %repet pasii pana cand eroarea depaseste norma diferentei dintre 
  Ant=R;                                %rezultatul curent si cel de la pasul anterior
  R=d*M*R+((1-d)/noduri)*V1;
endwhile

fclose(fid);            %inchid fisierul
endfunction