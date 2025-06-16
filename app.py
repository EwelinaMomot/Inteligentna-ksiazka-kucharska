from pyswip import Prolog
import ast
from flask import Flask, render_template,request
app = Flask(__name__)

prolog = Prolog()
prolog.consult("baza.pl")
prolog.consult("reguly.pl")

def zaladuj_fakty(prolog, produkty, porcje):
    for nazwa, ilosc in produkty:
        if not nazwa.strip():
            continue  
        #Zabezpiecza nazwy zawierające apostrofy, przez poprzedzenie ich znakiem ucieczki (\\).
        nazwa_esc = nazwa.replace("'", "\\'")
        prolog.assertz(f"mam('{nazwa_esc}', {ilosc})")
    prolog.assertz(f"porcje({porcje})")


def pobierz_przepisy_100(prolog):
    query = "najlepsze_przepisy(100, Wyniki)"
    wynik = list(prolog.query(query))
    if not wynik:
        return []
    przepisy = wynik[0]['Wyniki']
    przepisy_100 = []
    for przepis_str in przepisy:
        poprawiony = popraw_format(przepis_str)
        try:
            procent, nazwa = ast.literal_eval(poprawiony)
            if procent == 100:
                przepisy_100.append((procent, nazwa))
        except Exception as e:
            pass
    return przepisy_100

def dostepne_skladniki(prolog, przepis, porcje):
    # Tworzymy zapytanie z poprawnym formatowaniem (apostrofy wokół nazwy)
    query_str = f"dostepne_skladniki_szczegolowo('{przepis}', {porcje}, Lista)."
    wyniki = list(prolog.query(query_str))
    if wyniki:
        return wyniki[0]['Lista']
    else:
        return []

def pobierz_opisy_przepisow(lista_przepisow):
    wyniki = []
    for item in lista_przepisow:
        
        nazwa = item[1]  # nazwa to pierwszy element
        query = f"przepis({nazwa}, _, _, _, Opis)."
        result = list(prolog.query(query))
        
        if result:
            opis = result[0]['Opis']
        else:
            opis = "Nie znaleziono przepisu."
        
        wyniki.append((nazwa, opis))
    return wyniki


def parse_skladnik_str(s):
    s = s.strip('-() ')
    czesci = s.split(',')
    skladnik = czesci[0].strip()
    ilosc = float(czesci[1].strip())
    return (skladnik, ilosc)

 # Parsuje string w formacie Prologowym na format możliwy do odczytania przez ast.literal_eval i zamiany na krotkę w Pythonie.
def popraw_format(prologowy_str):
    prologowy_str = prologowy_str.lstrip(', ')
    przecinek_idx = prologowy_str.find(',')
    if przecinek_idx == -1:
        return prologowy_str
    
    liczba = prologowy_str[:przecinek_idx].strip(' ()')
    nazwa = prologowy_str[przecinek_idx+1:].strip(' ()')
    nazwa = f'"{nazwa}"'
    nowy_str = f'({liczba}, {nazwa})'
    return nowy_str


@app.route('/', methods=['GET', 'POST'])
def index():
    przepisy_100 = []
    przepisy_skladniki={}
    brakujace_przepisy = []
    produkty = []
    porcje = 1
    liczba_produktow = None
    czy_znaleziono_przepisy = None
    przepisy_opisy_dict=None

    if request.method == 'POST':
        action = request.form.get('action', '')

        if action == 'pokaz_braki':
            czy_znaleziono_przepisy = None
            przepisy_opisy_dict=None
            query_str = f"przepisy_z_brakami_1_lub_2({porcje}, Lista)"
            wynik = list(prolog.query(query_str))
            
            if wynik:
                for entry_str in wynik[0]['Lista']:
                    cleaned_str = entry_str.lstrip(", ").rstrip()
                    nazwa, reszta = cleaned_str.split(", [", 1)
                    nazwa = nazwa.strip("() ")
                    reszta = reszta.rstrip("])")
                    braki_raw = reszta.split("', '")
                    braki = [b.strip("'").strip("-(").rstrip(")") for b in braki_raw]
                    braki_zaokr = []
                    
                    for item in braki:
                        nazwa1, ilosc = item.split(",")
                        ilosc = float(ilosc.strip()) 
                        ilosc = round(ilosc, 0)      
                        braki_zaokr.append(f'{nazwa1.strip()}, {int(ilosc)}')
                    
                    brakujace_przepisy.append((nazwa, braki_zaokr))
                    
        else:
            liczba_produktow = int(request.form.get('liczba_produktow', 0))
            for i in range(liczba_produktow):
                nazwa = request.form.get(f'produkt_{i}', '').strip()
                nazwa = nazwa.replace(" ", "_")
                ilosc = int(request.form.get(f'ilosc_{i}', 0))
                produkty.append((nazwa, ilosc))
            porcje = int(request.form.get('porcje', 0))

            if porcje>0:
                print(f"PORCJE{porcje}")
                prolog.retractall('mam(_,_)')
                prolog.retractall('porcje(_)')

                zaladuj_fakty(prolog, produkty, porcje)

                przepisy_100 = pobierz_przepisy_100(prolog)

                if not przepisy_100:
                    czy_znaleziono_przepisy = "0"

                original_przepisy_skladniki = {}
                for procent, nazwa in przepisy_100:
                    skladniki = dostepne_skladniki(prolog, nazwa, porcje)
                    original_przepisy_skladniki[nazwa] = skladniki

                przepisy_skladniki = {}
                for nazwa, lista_str in original_przepisy_skladniki.items():
                    skladniki_parsed = [parse_skladnik_str(s) for s in lista_str]
                    skladniki_unikalne = list(set(skladniki_parsed))  
                    przepisy_skladniki[nazwa] = skladniki_unikalne

                
                opisy_przepisu = pobierz_opisy_przepisow( przepisy_100)
                org_przepisy_opisy_dict = dict(opisy_przepisu)
                # Zamiana wartości typu bytes na stringi (UTF-8), aby usunąć przedrostek b'' z tekstu
                przepisy_opisy_dict = {k: v.decode('utf-8') for k, v in org_przepisy_opisy_dict.items()}



    return render_template('index.html',
                           przepisy_100=przepisy_100,
                           brakujace_przepisy=brakujace_przepisy,
                           produkty=produkty,
                           porcje=porcje,
                           liczba_produktow=liczba_produktow,
                            przepisy_skladniki=przepisy_skladniki,
                            czy_znaleziono_przepisy = czy_znaleziono_przepisy,
                            opisy_przepisy=przepisy_opisy_dict

                            ) 

if __name__ == "__main__":
    app.run(debug=True)
