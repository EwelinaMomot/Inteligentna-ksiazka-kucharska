
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
    przepis(Przepis, Skladniki, PorcjeBazowe, _,_),
    przelicz_skladniki(Skladniki, PorcjeBazowe, Porcje, SkladnikiPrzeliczone),
    findall(
        Nazwa-Ilosc,
        (
            member(sklad(Nazwa, Ilosc), SkladnikiPrzeliczone),
            \+ mam_lub_zamiennik(Nazwa, Ilosc)
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
    przepis(Przepis, SkladnikiBazowe, PorcjeBazowe, _,_),
    przelicz_skladniki(SkladnikiBazowe, PorcjeBazowe, PorcjeDocelowe, SkladnikiPrzeliczone),
    findall(
        Para,
        (
            member(sklad(Nazwa, Potrzebna), SkladnikiPrzeliczone),
            mam(Nazwa, MamIlosc),
            IloscOryg is min(MamIlosc, Potrzebna),
            Reszta is Potrzebna - IloscOryg,
            (
                Reszta > 0,
                zamiennik(Nazwa, Zamiennik),
                mam(Zamiennik, MamZamIlosc),
                IloscZam is min(MamZamIlosc, Reszta),
                ( IloscOryg > 0 -> Para1 = [Nazwa-IloscOryg] ; Para1 = [] ),
                ( IloscZam > 0 -> Para2 = [Zamiennik-IloscZam] ; Para2 = [] ),
                append(Para1, Para2, Para)
            ;
                Reszta =< 0,
                ( IloscOryg > 0 -> Para = [Nazwa-IloscOryg] ; Para = [] )
            )
        ),
        ListaList
    ),
    flatten(ListaList, Lista).

