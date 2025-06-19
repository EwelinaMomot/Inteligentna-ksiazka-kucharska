
% - przelicza proporcjonalnie ilości składników na docelową liczbę porcji

przelicz_skladniki([], _, _, []).
przelicz_skladniki([sklad(Nazwa, IloscBazowa)|Reszta], PorcjeBazowe, PorcjeDocelowe, [sklad(Nazwa, IloscPrzeliczona)|ResztaPrzeliczona]) :-
    IloscPrzeliczona is IloscBazowa * PorcjeDocelowe / PorcjeBazowe,
    przelicz_skladniki(Reszta, PorcjeBazowe, PorcjeDocelowe, ResztaPrzeliczona).


% 1. Mam wystarczająco oryginalnego składnika
mam_lub_zamiennik(Skladnik, Ilosc) :-
    mam(Skladnik, MamIlosc),
    MamIlosc >= Ilosc.

 % 2. Mam wystarczająco zamiennika (samodzielnie)
mam_lub_zamiennik(Skladnik, Ilosc) :-
    zamiennik(Skladnik, Zamiennik),
    mam(Zamiennik, MamIlosc),
    MamIlosc >= Ilosc.

% 3. Mam za mało oryginału i zamiennika osobno, ale razem starczy
mam_lub_zamiennik(Skladnik, Ilosc) :-
    mam(Skladnik, MamIlosc),
    MamIlosc < Ilosc,
    zamiennik(Skladnik, Zamiennik),
    mam(Zamiennik, MamIloscZam),
    Sum is MamIlosc + MamIloscZam,
    Sum >= Ilosc.
    
% 4. Mam coś o podobnej nazwie – podobieństwo słowne
mam_lub_zamiennik(Skladnik, Ilosc) :-
    mam(InnySkladnik, MamIlosc),
    podobne_slowa(Skladnik, InnySkladnik, 0.7),  
    MamIlosc >= Ilosc. 
    
mam_wszystkie_skladniki([]).
mam_wszystkie_skladniki([sklad(Skladnik, Ilosc)|Reszta]) :-
    mam_lub_zamiennik(Skladnik, Ilosc),
    mam_wszystkie_skladniki(Reszta).

mam_wszystkie_skladniki_po_przeliczeniu(Skladniki) :-
    przelicz_skladniki(Skladniki, Przeliczone),
    mam_wszystkie_skladniki(Przeliczone).



% Liczy, ile składników przepisu rzeczywiście posiadamy (lub zamienników)

ile_dostepnych_skladnikow([], 0).

ile_dostepnych_skladnikow([sklad(Skladnik, Ilosc)|Reszta], Liczba) :-
    mam_lub_zamiennik(Skladnik, Ilosc), !,
    ile_dostepnych_skladnikow(Reszta, LiczbaReszta),
    Liczba is LiczbaReszta + 1.

ile_dostepnych_skladnikow([_|Reszta], Liczba) :-
    ile_dostepnych_skladnikow(Reszta, Liczba).


% Całkowita liczba składników w przepisie

ile_skladnikow([], 0).
ile_skladnikow([_|Reszta], Liczba) :-
    ile_skladnikow(Reszta, LiczbaReszta),
    Liczba is LiczbaReszta + 1.

% - oblicza, jakim odsetkiem pokrywamy dany przepis 
% (np. 100% = wszystkie, 50% = połowa).

zgodnosc_przepisu(Nazwa, PorcjeDocelowe, Procent) :-
    przepis(Nazwa, Skladniki, PorcjeBazowe, _,_),
    przelicz_skladniki(Skladniki, PorcjeBazowe, PorcjeDocelowe, Przeliczone),
    ile_dostepnych_skladnikow(Przeliczone, Dostepne),
    ile_skladnikow(Przeliczone, Wszystkie),
    Wszystkie > 0,
    Procent is (Dostepne / Wszystkie) * 100.



% - znajduje N najlepszych przepisów według pokrycia składników.
najlepsze_przepisy(MaxLiczba, Wyniki) :-
    porcje(PorcjeDocelowe),  
    findall((Procent, Nazwa), zgodnosc_przepisu(Nazwa, PorcjeDocelowe, Procent), Lista),
    sort(0, @>=, Lista, Posortowana),
    pierwsze_n(MaxLiczba, Posortowana, Wyniki).



pierwsze_n(0, _, []) :- !.
pierwsze_n(_, [], []) :- !.
pierwsze_n(N, [H|T], [H|Wynik]) :-
    N1 is N - 1,
    pierwsze_n(N1, T, Wynik).


% Sprawdzamy, których przepisów nie można przygotować na podstawie dostępnych składników,
% uwzględniając zamienniki i dopełnienia zamiennikami (np. woda zastępująca mleko), tak by uniknąć fałszywych braków.

brakujace_skladniki(Przepis, Porcje, Lista) :-
    przepis(Przepis, Skladniki, PorcjeBazowe, _, _),
    przelicz_skladniki(Skladniki, PorcjeBazowe, Porcje, SkladnikiPrzeliczone),
    findall(
        Nazwa-BrakujacaIlosc,
        (
            member(sklad(Nazwa, PotrzebnaIlosc), SkladnikiPrzeliczone),
            
            % Ile mamy oryginału
            (mam(Nazwa, MamOryg) -> true ; MamOryg = 0),

            % Czy mamy zamiennik
            (zamiennik(Nazwa, Zamiennik), mam(Zamiennik, MamZam) -> true ; (MamZam = 0)),

            Dostepne is MamOryg + MamZam,
            Brak is PotrzebnaIlosc - Dostepne,
            Brak > 0,
            BrakujacaIlosc is Brak
        ),
        Lista
    ).



% - znajduje przepisy, które mają tylko 1 lub 2 braki — te mogą się opłacić uzupełnić.

przepisy_z_brakami_1_lub_2(Porcje, Lista) :-
    findall((Przepis, Braki), (
        przepis(Przepis, _, _, _,_),
        brakujace_skladniki(Przepis, Porcje, Braki),
        length(Braki, L),
        (L =:= 1 ; L =:= 2)
    ), Lista).



% - wypisuje wszystkie posiadane lub zastępowalne składniki dla danego przepisu.

dostepne_skladniki_szczegolowo(Przepis, PorcjeDocelowe, Lista) :-
    przepis(Przepis, SkladnikiBazowe, PorcjeBazowe, _, _),
    przelicz_skladniki(SkladnikiBazowe, PorcjeBazowe, PorcjeDocelowe, SkladnikiPrzeliczone),
    findall(
        Para,
        (
            member(sklad(Nazwa, Potrzebna), SkladnikiPrzeliczone),

            % 1. Oryginał
            (mam(Nazwa, MamIlosc) -> true ; MamIlosc = 0),

            % 2. Zamiennik
            (zamiennik(Nazwa, Zamiennik), mam(Zamiennik, MamZamIlosc) -> true ; (Zamiennik = none, MamZamIlosc = 0)),

            % 3. Podobny składnik — teraz przez predykat:
            IloscOryg is min(MamIlosc, Potrzebna),
            Reszta1 is Potrzebna - IloscOryg,
            IloscZam is min(MamZamIlosc, Reszta1),
            Reszta2 is Reszta1 - IloscZam,
            (mam_lub_zamiennik_zwracajaca(Nazwa, Reszta2, Podobny-IloscPodobny) -> true ; (Podobny = none, IloscPodobny = 0)),

            % Składanie listy dostępnych składników:
            findall(Elt,
                (
                    (IloscOryg > 0 -> Elt = Nazwa-IloscOryg ; fail);
                    (IloscZam > 0, Zamiennik \= none -> Elt = Zamiennik-IloscZam ; fail);
                    (IloscPodobny > 0, Podobny \= none -> Elt = Podobny-IloscPodobny ; fail)
                ),
                Para
            )
        ),
        ListaList
    ),
    flatten(ListaList, Lista).



mam_lub_zamiennik_zwracajaca(Szukany, IloscPotrzebna, Podobny-NIlosc) :-
    mam(Podobny, MamIlosc),
    podobne_slowa(Szukany, Podobny, 0.7),
    Podobny \= Szukany,
    NIlosc is min(MamIlosc, IloscPotrzebna),
    NIlosc > 0.


atom_na_litery(Atom, Litery) :-
    atom_chars(Atom, Litery).

% Liczy ile znaków na tych samych pozycjach się zgadza
licz_wspolne_litery([], _, 0).
licz_wspolne_litery(_, [], 0).
licz_wspolne_litery([H1|T1], [H2|T2], Liczba) :-
    licz_wspolne_litery(T1, T2, LiczbaReszta),
    (H1 = H2 -> Liczba is LiczbaReszta + 1 ; Liczba = LiczbaReszta).

% Podobienstwo: wspólne litery / długość krótszego słowa
podobne_slowa(S1, S2, Prog) :-
    atom(S1), atom(S2),  
    atom_chars(S1, L1),
    atom_chars(S2, L2),
    licz_wspolne_litery(L1, L2, Wspolne),
    length(L1, D1),
    length(L2, D2),
    MinD is min(D1, D2),
    MinD > 0,  
    Similarity is Wspolne / MinD,
    Similarity >= Prog.

