function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out
  
fid = fopen(nume,'r');    %deschid fisierul cu drepturi de citire

noduri=fgetl(fid);        %imi iau numarul de noduri din el
noduri=str2num(noduri);

for i=1:noduri            %sar peste informatia care nu ne intereseaza (detaliile despre legaturi si noduri)
  fgetl(fid);
endfor

valoare1=fgetl(fid);              %apoi imi extrag cele 2 valori, transformandule in numere
valoare1=str2num(valoare1);
valoare2=fgetl(fid);
valoare2=str2num(valoare2);

fclose(fid);                      %inchid fisierul deoarece nu mai avem nevoie de el

name=[nume ".out"];               %imi formez numele noului fisier, apoi in deschid cu drepturi de scriere
fid2=fopen(name,'w');

fprintf(fid2,"%d\n",noduri);      %afisez numarul de noduri

PR=Iterative(nume,d,eps);         %rezultatul algoritmului "Iterative"
fprintf(fid2,"%f\n",PR);

fprintf(fid2,"\n");               %randul liber cerut

PR=Algebraic(nume,d);             %rezultatul algoritmului "Algebraic"
fprintf(fid2,"%f\n",PR);

fprintf(fid2,"\n");               %celalalt rand liber cerut

Indici=zeros(noduri,1);           %fac un vector pentru indici, in care ii pun, pentru a retinea ordinea lor
for i=1:noduri                      %dupa sortarea vectorului cu valorile date de "Algebraic"
  Indici(i)=i;
endfor

PR1=PR;
for i=1:noduri                    %sortez rezultatul de la "Algebraic" in ordine descrescatoare avand grija
  for j=i:noduri                    %sa retin corect si indicii initiali
    if(PR1(i) <= PR1(j))
      aux=PR1(i);
      PR1(i)=PR1(j);
      PR1(j)=aux;
      aux=Indici(i);
      Indici(i)=Indici(j);
      Indici(j)=aux;
    endif
  endfor
endfor

for i=1:noduri                                  %afisez pozitia in vector, indicele initial si valoarea
  a=Apartenenta(PR1(i),valoare1,valoare2);        %data de "Apartenenta" pentru elementul din vectorul sortat
  fprintf(fid2,"%d %d %f\n",i,Indici(i),a);
endfor

fclose(fid2);
endfunction