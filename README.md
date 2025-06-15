# Inteligentna Książka Kucharska 🍳

Inteligentna książka kucharska dopasowuje przepisy do dostępnych w lodówce produktów, wykorzystując bazę Prologa, informacje o zamiennikach oraz szereg reguł.  
Pokazuje przepisy, które można przygotować w całości, a także te, do których brakuje jednego lub dwóch składników.
Dla tych drugich wyświetla listę brakujących produktów wraz z wymaganymi ilościami, co pozwala użytkownikowi na łatwe uzupełnienie zapasów i większy wybór potraw do przygotowania.

---

## Funkcjonalności

- Automatyczne dopasowanie przepisów do dostępnych składników  
- Obsługa zamienników składników z częściowym uzupełnianiem ilości  
- Obliczanie procentowego dopasowania przepisu  
- Wskazywanie brakujących składników i ilości do dokupienia  
- Intuicyjny interfejs z paginacją pól do wpisywania składników  
- Wyświetlanie przepisów w modalnych oknach dla lepszej czytelności  

## Wstęp do przykładu zamienników i dopasowania składników

Program nie tylko dokonuje prostych zamian składników, np. gdy potrzebujemy 100 ml mleka, a mamy 100 ml wody jako zamiennika, ale również potrafi częściowo dopasować dostępne ilości.  
Oznacza to, że jeśli mamy mniej bazowego składnika niż wymaga przepis, system uzupełnia brakującą ilość produktem zamiennym, tak aby łącznie spełnić wymaganą ilość.  
Dzięki temu możliwe jest elastyczne wykorzystanie zasobów i dokładne dopasowanie przepisu do faktycznie dostępnych produktów, co znacząco zwiększa użyteczność aplikacji.

---

## Przypadek testowy

### Przepis: Naleśniki

**Składniki na 4 porcje:**

- mąka – 200 g  
- jajko – 100 g  
- mleko – 300 ml  

**Zamiennik:**  
- mleko ↔ woda

---

### Testowy zestaw składników podany przez użytkownika:

- mąka – 200 g  
- jajko – 100 g  
- mleko – 270 ml  
- woda – 100 ml

---

### Działanie systemu:

System uwzględnia dostępne ilości mleka i jego zamiennika-wody i bada trzy scenariusze dopasowania do przepisu.  
 Finalnie uzupełnia mleko bazowe o wodę jako zamiennik, ale ponieważ jest jej nadmiar, proporcjonalnie dopasowuje składniki do przepisu na 4 porcje.

---

### Wynik:

Przepis zostaje dopasowany i wyświetlony z uwzględnieniem:  
- 270 ml mleka  
- 30 ml wody jako zamiennika (łącznie 300 ml mleka)  
- pozostałe składniki zgodnie z przepisem i liczbą porcji.

Takie rozwiązanie umożliwia elastyczne wykorzystanie zamienników oraz dopasowanie składników w oparciu o dostępne ilości, zwiększając praktyczność i użyteczność aplikacji.

---

## Używane technologie 🛠

- **Python (Flask)** — warstwa aplikacyjna  
- **Prolog** — silnik wnioskujący o przepisach  
- **HTML, CSS, JavaScript** — warstwa frontendu  
- **Jinja2** — szablony aplikacji  
- **PySwip** — integracja Pythona z Prologiem  

---

## Użyte paradygmaty programowania 💡

- Paradygmat deklaratywny  
- Paradygmat obiektowy  
- Paradygmat imperatywny  
- Paradygmat zdarzeniowy  
- Paradygmat logiczny  

---

## Struktura projektu 📁

inteligentna-ksiazka-kucharska/
 └ static/
    └ script.js
    └ style.css
    └ images/
      └ picture.jpg
 └ app.py
 └ baza.pl   # baza faktów
 └ reguly.pl # reguły Prolog
 └ templates/
    └ index.html 
 └ README.md


 ## Instalacja i uruchomienie

1. **Sklonuj repozytorium:**

git clone https://github.com/twoj-uzytkownik/inteligentna-ksiazka-kucharska.git
cd inteligentna-ksiazka-kucharska

2. **Zainstaluj wymagane pakiety:**

pip install Flask pyswip ask

3.**Uruchom aplikację:**

python app.py

4.**Otwórz przeglądarkę i przejdź pod adres:**
http://127.0.0.1:5000

 
