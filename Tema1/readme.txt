! pentru testul 1, am observat ca dau exact aceleasi rezultate doar pentru eps=0.002

	PageRanking:
-prima data deschid fisierul dat la apelare cu read mode, pentru ca doar de citire am
nevoie
-imi extrag valorile de care am nevoie (numarul de noduri, valorile 1 si 2), avand grija
sa sar peste cele de care nu ii trebuie (detaliile despre vecinii nodurilor)
-inchid fisierul dat in input deoarece nu mai am nevoie de el
-creez numele fisierul de afisare adaugand ".out" la numele precedent
-il deschid cu drept de scriere
-afisez numarul de noduri, rezultatul algoritmului "Iterative", un rand liber, cel de la
"Algebraic", alt rand liber, apoi pe fiecare linie indicele liniei afisate, indicele initial
al valorii prelucrate si valoare prelucrata de "Apartenente"
-valorile care vor fi "prelucrate" sunt date de algoritmul "Algebraic", apoi ordonate descrescator,
ordonate odata cu indicii lor corespunzatori
-inchid fesierul in care am scris


	Iterative
-pun o precisie de 7 deoarece in exemplul dat sunt 6 cifre dupa virgula 
-deschid fisierul cu drept de citire
-iau numarul de noduri
-imi iau o matrice A de 0 (baza pentru matricea de adiacenta), un L - vector coloana de 0 (baza 
pentru vectorul coloana de numar de vecini) si un V1 vector coloana de 1 (va ajuta la calcule
mai tarziu)
-completez A si L, citesc fiecare linie si o transform in vectori de numere, vad ce vecini are
fiecare nod si pun "1" in A si numaru vecinilor in L (am grija ca daca un nod este vecin cu el insusi 
sa nu pun nimic in A si in L sa scad 1)
-apoi folosesc formula iterativa de pe Wikipedia pentru a afla rezultatul
-aflu R la primul pas, apoi pe urmatorul si jonglez cu R curent si precendent pana cand eroarea devine
mai mare ca norma diferentei celor 2
-inchid fisierul

	Algebraic
-pun tot precizie 7 din acelasi motiv
-deschid fisierul cu drept de citire
-pentru A,L,M fac acelasi lucru ca si la "Iterative"
-creez I-vector unitate si V1-vector coloana de 1 (va ajuta la calcule)
-pentru rezultat folosesc formula algebrica de pe Wikipedia
-pentru calcularea inversei folosesc "PR_Inv"
-inchid fisierul folosit

	PR_Inv
-nu am reusit sa adaptez GS pentru a calcula inversa asa ca am folosit functia din octav, pentru 
a ajunge la rezultatele finale

	Apartenenta
-mai intai aflu a si b (pentru ca functia sa fie continua), practic rezolv sistemul:
	{  a*va1+b=0
	{  a*val2+b=1
-apoi dau valoare lui y in functie de intervalul in care se afla x