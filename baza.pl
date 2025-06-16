% sklad(Nazwa,Ilosc)

% zamiennik(Oryginalny, Zastepczy).

% przepis(Nazwa, [sklad(NazwaSkladnika, Ilosc)], naIleOsob, CzasMinuty,przepis).

przepis(Jajecznica, 
  [sklad(jajko, 150), sklad(cebula, 100), sklad(maslo, 10)], 
  2, 10,
  "Rozgrzej patelnie na srednim ogniu, dodaj maslo i poczekaj az sie roztopi. Dodaj drobno posiekana cebule i smaz az sie zeszkli, okolo 3-4 minuty. Wbij jajka, mieszaj delikatnie drewniana lyzka przez 4-5 minut, az masa bedzie kremowa. Podawaj od razu."
).

przepis(nalesniki, 
  [sklad(maka, 200), sklad(jajko, 100), sklad(mleko, 300)], 
  4, 20,
  "Wymieszaj skladniki na jednolite ciasto i odstaw na 10 minut. Rozgrzej patelnie na srednim ogniu i lekko ja natlust. Wlej cienka warstwe ciasta, smaz 1-2 minuty az brzegi sie zarumienia, przewroc i smaz kolejna minute. Powtarzaj do wykorzystania ciasta."
).

przepis(tosty, 
  [sklad(chleb, 2), sklad(szynka, 50), sklad(ser, 50)], 
  1, 5,
  "Połóż szynkę i ser na kromkach chleba. Opiekaj na patelni na średnim ogniu (ok. 160°C) lub w opiekaczu, aż ser się roztopi, a chleb zarumieni się na złoto. Podawaj od razu, opcjonalnie z keczupem lub warzywami."
).

przepis(salatka_grecka, 
  [sklad(pomidor, 100), sklad(ogorek, 100), sklad(ser_feta, 50), sklad(oliwki, 20), sklad(olej, 10)], 
  2, 10,
  "Pokrój pomidory, ogórki i ser feta w większą kostkę. Dodaj oliwki. Skrop olejem i dopraw solą oraz pieprzem. Wymieszaj delikatnie. Podawaj na zimno, jako przystawkę lub lekką kolację."
).


przepis(placki_ziemniaczane, 
  [sklad(ziemniaki, 500), sklad(cebula, 100), sklad(jajko, 50), sklad(maka, 50)], 
  2, 15,
  "Zetrzyj ziemniaki i cebulę na tarce o drobnych oczkach. Dodaj jajko, mąkę, dopraw solą. Smaż placuszki na patelni na rozgrzanym oleju (180°C) z obu stron, na złoty kolor (2-3 minuty z każdej strony). Podawaj na ciepło, opcjonalnie ze śmietaną."
).

przepis(szejk_truskawkowy, 
  [sklad(truskawki, 100), sklad(mleko, 200), sklad(lody_waniliowe, 50)], 
  1, 5,
  "Zmiksuj wszystkie składniki na gładkie, puszyste smoothie. Podaj od razu, schłodzone, z rurką lub kawałkiem owocu na szklance."
).

przepis(kopytka, 
  [sklad(ziemniaki, 500), sklad(maka, 100), sklad(jajko, 50)], 
  4, 30,
  "Ugotuj ziemniaki (100°C) do miękkości, przepuść je przez praskę, dodaj mąkę i jajko. Zagnieć gładkie ciasto, uformuj wałek, pokrój na kawałki i gotuj we wrzącej, osolonej wodzie (100°C) około 2-3 minuty od wypłynięcia. Podawaj od razu, na ciepło, np. z bułką tartą lub skwarkami."
).

przepis(placuszki_bananowe, 
  [sklad(banan, 100), sklad(maka, 100), sklad(mleko, 100), sklad(jajko, 50)], 
  2, 10,
  "Zmiksuj wszystkie składniki na gładkie ciasto. Smaż placuszki na patelni na średnim ogniu (160°C) z obu stron, około 1-2 minuty, aż się zarumienią. Podawaj z syropem klonowym lub owocami."
).

przepis(kurczak_smazony, 
  [sklad(kurczak, 500), sklad(sol, 5), sklad(pieprz, 5), sklad(olej, 100)], 
  4, 30,
  "Natrzyj kurczaka solą i pieprzem. Smaż na rozgrzanym oleju (160°C-180°C) na patelni, od czasu do czasu obracając, aż się zarumieni i upiecze. Podawaj od razu, z ulubionymi dodatkami, takimi jak ziemniaki lub surówka."
).

przepis(owsianka, 
  [sklad(platki_owsiane, 100), sklad(mleko, 250), sklad(miod, 20)], 
  1, 5,
  "Zalej płatki owsiane mlekiem, gotuj kilka minut (90°C) od czasu do czasu mieszając, a na samym końcu dodaj miód. Podawaj na ciepło, z owocami lub orzechami."
).

przepis(kanapki_z_pasta_jajeczna, 
  [sklad(jajko, 100), sklad(majonez, 20), sklad(chleb, 2)], 
  2, 10,
  "Ugotuj jajka na twardo, obierz i pokroj na drobno. Wymieszaj z majonezem i dopraw do smaku. Posmaruj pasta kromki chleba i podawaj swieze."
).

przepis(zupa_pomidorowa, 
  [sklad(pomidory, 500), sklad(woda, 1000), sklad(makaron, 100)], 
  4, 30,
  "Pomidory sparz i pokroj, zagotuj z woda. Dopraw sola, pieprzem i ulubionymi ziolami. Gotuj na srednim ogniu okolo 20 minut. Dodaj makaron i gotuj do miekkosci, okolo 8 minut. Podawaj goraca."
).

przepis(omlet_z_pomidorem,
  [sklad(jajko, 150), sklad(pomidor, 100), sklad(olej, 10)],
  1, 10,
  "Rozgrzej olej na patelni. W misce roztrzep jajka, dodaj pokrojonego pomidora. Wlej masę na patelnię i smaż na srednim ogniu 5-7 minut az sie zetnie. Podawaj na ciepło."
).

przepis(ryz_na_mleku,
  [sklad(ryz, 100), sklad(mleko, 300), sklad(cukier, 20)],
  2, 25,
  "W garnku zagotuj mleko, dodaj ryz i cukier. Gotuj na malym ogniu, mieszaj od czasu do czasu, az ryz bedzie miekki i kremowy (okolo 20 minut). Podawaj cieple."
).

przepis(zapiekanka_z_brokulami,
  [sklad(brokuly, 300), sklad(ser, 100), sklad(jajko, 100)],
  2, 30,
  "Ugotuj brokuly do miekkosci. W misce wymieszaj jajka z tartym serem. Brokuly rozloz w naczyniu, zalej mieszanka jajeczna. Piecz w 180°C przez 20 minut az wierzch sie zarumieni. Podawaj na cieplo."
).

przepis(kaszka_ryzowa,
  [sklad(ryz, 80), sklad(woda, 250), sklad(miod, 10)],
  1, 20,
  "Ryż ugotuj w wodzie do miekkosci. Dodaj miod i wymieszaj. Podawaj ciepłe, można dodac owoce."
).

przepis(salatka_z_jajkiem,
  [sklad(jajko, 100), sklad(papryka, 100), sklad(ogorek, 100)],
  2, 10,
  "Ugotuj jajka na twardo, pokroj w kostke. Pokroj papryke i ogorka. Wszystko wymieszaj, dopraw sola i pieprzem. Podawaj schlodzone."
).

przepis(placuszki_jablkowe,
  [sklad(jablko, 150), sklad(maka, 100), sklad(jajko, 50)],
  2, 15,
  "Zetrzyj jabłka na tarce. Dodaj mąkę i jajko, wymieszaj na ciasto. Smaż placuszki na rozgrzanej patelni po 2-3 minuty z każdej strony na złoty kolor. Podawaj ciepłe."
).

przepis(zapiekanka_z_brokulami,
  [sklad(brokuly, 300), sklad(ser, 100), sklad(jajko, 50)],
  2, 25,
  "Ugotuj brokuly do miekosci. W misce wymieszaj jajko z tartym serem. Polacz z brokulami, przełóż do naczynia i zapiekaj w piekarniku 180°C przez 20 minut. Podawaj cieple."
).

przepis(kasza_z_pieczarkami,
  [sklad(kasza, 200), sklad(pieczarki, 150), sklad(cebula, 50)],
  2, 30,
  "Ugotuj kasze. Podsmaz cebule z pieczarkami na oleju. Wymieszaj z kasza i dopraw sola oraz pieprzem. Podawaj na cieplo."
).

przepis(salatka_z_ryzem,
  [sklad(ryz, 150), sklad(kukurydza, 100), sklad(papryka, 100)],
  3, 15,
  "Ugotuj ryz i ostudz. Dodaj odsaczona kukurydze i pokrojona papryke. Wymieszaj, dopraw sola, pieprzem i olejem. Podawaj schlodzone."
).

przepis(kotlety_jaglano-warzywne,
  [sklad(jagla, 150), sklad(marchew, 100), sklad(jajko, 50)],
  3, 35,
  "Ugotuj jagle. Zetrzyj marchew, wymieszaj z jagla i jajkiem. Formuj kotlety i smaz na oleju do zlotego koloru z obu stron. Podawaj na cieplo."
).

przepis(omlet_z_pomidorami,
  [sklad(jajko, 150), sklad(pomidor, 100), sklad(olej, 10)],
  1, 10,
  "W misce roztrzep jajka. Pokroj pomidora i dodaj do jajek. Usmaz na oleju na patelni na srednim ogniu, okolo 5 minut. Podawaj cieple."
).

przepis(zapiekanka_z_cukinia,
  [sklad(cukinia, 300), sklad(ser, 100), sklad(jajko, 50)],
  2, 30,
  "Pokroj cukinie w plasterki. W misce wymieszaj jajko z tartym serem. Warstwowo uloz cukinie i polej mieszanka. Zapiekaj 25 minut w 180°C. Podawaj na cieplo."
).

przepis(krem_z_marchewki,
  [sklad(marchew, 400), sklad(woda, 500), sklad(cebula, 50)],
  4, 25,
  "Podsmaz cebule, dodaj pokrojona marchew i wode. Gotuj do miekkosci, okolo 20 minut. Zblenduj, dopraw sola i pieprzem. Podawaj cieple."
).

przepis(pudding_ryzowy,
  [sklad(ryz, 150), sklad(mleko, 400), sklad(cukier, 30)],
  2, 40,
  "Ugotuj ryz w mleku z cukrem na wolnym ogniu, az ryz bedzie miekkie i kremowe. Podawaj na cieplo lub zimno."
).

przepis(salatka_z_awokado,
  [sklad(awokado, 100), sklad(pomidor, 100), sklad(ogorek, 100)],
  2, 10,
  "Pokroj awokado, pomidor i ogorek w kostke. Wymieszaj, dopraw sola, pieprzem i sokiem z cytryny. Podawaj schlodzone."
).

przepis(krem_z_buraka,
  [sklad(burak, 400), sklad(woda, 500), sklad(cebula, 50)],
  4, 30,
  "Podsmaz cebule, dodaj obrane i pokrojone buraki oraz wode. Gotuj do miekkosci, okolo 25 minut. Zblenduj na krem, dopraw sola i pieprzem. Podawaj cieple."
).


przepis(koktajl_bananowy,
  [sklad(banan, 120), sklad(mleko, 250)],
  1, 5,
  "Zmiksuj banana z mlekiem na gładki koktajl. Podawaj schłodzony."
).

przepis(grzanki_czosnkowe,
  [sklad(chleb, 4), sklad(maslo, 20), sklad(czosnek, 3)],
  2, 10,
  "Czosnek przeciśnij przez praskę i wymieszaj z roztopionym masłem. Posmaruj kromki chleba i zapiekaj w piekarniku w 180°C przez 8 minut na złoty kolor."
).

przepis(smazony_ser,
  [sklad(ser, 200), sklad(maka, 50), sklad(jajko, 50)],
  2, 15,
  "Pokroj ser w plastry. Obtocz w maki, potem w roztrzepanym jajku, ponownie w maki. Smaż na rozgrzanym oleju po 2-3 minuty z kazdej strony na zloto. Podawaj cieple."
).


przepis(spaghetti, 
  [sklad(makaron, 200), sklad(mieso_mielone, 300), sklad(pomidory, 200)], 
  3, 35,
  "Ugotuj makaron al dente. Na patelni podsmaz mieso az sie zarumieni, dodaj pomidory i gotuj na malym ogniu az sos zgestnieje, okolo 15 minut. Wymieszaj makaron z sosem i podawaj od razu."
).

przepis(salatka_cezar, 
  [sklad(salata, 100), sklad(kurczak, 150), sklad(grzanki, 50),sklad(parmezan,10)], 
  2, 15,
  "Kurczaka dopraw i usmaz na zloty kolor, ostudz i pokroj w paski. Salate porwij na mniejsze kawalki, wymieszaj z dressingiem i grzankami. Dodaj kurczaka, wymieszaj i podawaj."
).

przepis(krem_z_dynii, 
  [sklad(dynia, 500), sklad(woda, 500), sklad(cebula, 100)], 
  4, 25,
  "Podsmaz cebule az bedzie szklista, dodaj pokrojona dynie i wode. Gotuj do miekkosci dyni, okolo 20 minut. Zblenduj na krem, dopraw sola i pieprzem. Podawaj cieple."
).

przepis(weganski_burger, 
  [sklad(ciecierzyca, 200), sklad(bulka, 2), sklad(pomidor, 1)], 
  2, 30,
  "Ciecierzyce zmiksuj na gladka mase, dopraw przyprawami. Uformuj kotlety i smaz na rozgrzanej patelni okolo 5 minut z kazdej strony. Podawaj w bulce z plastrami pomidora i ulubionymi dodatkami."
).

przepis(zupa_misoshiru, 
  [sklad(miso, 50), sklad(tofu, 100), sklad(wodorosty, 20)], 
  2, 15,
  "Wode zagotuj i zdejmij z ognia. Rozpusc paste miso w malej ilosci wody, polacz z reszta wody. Dodaj tofu pokrojone w kostke i wodorosty. Podgrzewaj na malym ogniu, nie doprowadzajac do wrzenia, przez 10 minut. Podawaj goraca."
).

przepis(ryz_z_warzywami, 
  [sklad(ryz, 200), sklad(marchew, 100), sklad(groszek, 100)], 
  3, 20,
  "Ryz ugotuj wedlug instrukcji na opakowaniu. Warzywa podsmaz na odrobinie oleju przez kilka minut, dodaj ugotowany ryz i wymieszaj. Dopraw do smaku i podawaj cieple."
).

przepis(omlet, 
  [sklad(jajko, 100), sklad(mleko, 50), sklad(ser, 50)], 
  1, 10,
  "W misce wymieszaj jajka z mlekiem, dopraw sola i pieprzem. Rozgrzej patelnie z odrobina tluszczu, wlej mase i smaz na srednim ogniu przez 3-4 minuty. Posyp startym serem i zloz omlet na pol, podawaj goracy."
).

przepis(kapusta_z_grochem, 
  [sklad(kapusta, 300), sklad(groch, 200), sklad(cebula, 100)], 
  5, 60,
  "Groch namocz na noc, ugotuj do miekosci. Kapuste drobno posiekaj i gotuj razem z cebula na malym ogniu okolo 45 minut. Polacz groch z kapusta, dopraw do smaku i dus jeszcze przez 10 minut. Podawaj gorace."
).

przepis(tosty_z_serem, 
  [sklad(chleb, 2), sklad(ser, 50), sklad(maslo, 10)], 
  1, 7,
  "Chleb posmaruj maslem, poloz plaster sera i przykryj drugim kawalkiem chleba. Smaz na rozgrzanej patelni z obu stron na zolty kolor, okolo 3-4 minuty na strone. Podawaj na cieplo."
).

przepis(sushi, 
  [sklad(ryz, 250), sklad(nori, 2), sklad(ryba, 100)], 
  2, 45,
  "Ugotuj ryz do sushi zgodnie z instrukcja. Na nori rozloz cienka warstwe ryzu, dodaj pasek ryby i zroluj. Pokroj na kawalki. Podawaj z sosem sojowym, imbirem i wasabi."
).

przepis(sos_czosnkowy, 
  [sklad(majonez, 100), sklad(czosnek, 2)], 
  1, 5,
  "Czosnek przeciśnij przez praske i wymieszaj z majonezem. Dopraw sola i pieprzem do smaku. Podawaj jako dip lub sos do mies."
).

przepis(salatka_tunczykowa, 
  [sklad(tunczyk, 150), sklad(kukurydza, 100), sklad(ogorek, 100)], 
  2, 10,
  "Wymieszaj odsaczony tunczyka z kukurydza i pokrojonym ogorkiem. Dopraw majonezem, sola i pieprzem. Podawaj schlodzone."
).

przepis(kopytka, 
  [sklad(ziemniaki, 500), sklad(maka, 100), sklad(jajko, 100)], 
  4, 30,
  "Ugotowane ziemniaki przeciśnij przez praske, wymieszaj z maka i jajkiem na gladkie ciasto. Formuj waleczki i kroj na kawalki. Gotuj w osolonej wodzie az wyplyna, okolo 3-5 minut. Podawaj z maslem lub sosem."
).

przepis(sernik_new_york, 
  [sklad(serek, 500), sklad(ciastka, 200), sklad(smietana, 100)], 
  6, 60,
  "Zmiksuj serek ze smietana do gladkiej masy. Pokrusz ciastka i wymieszaj z roztopionym maslem, wylóż nimi spod tortownicy. Wylej mase serowa na spod i piecz w piekarniku nagrzanym do 160°C przez 50-60 minut az masa sie zetnie, ale srodek bedzie lekko miekki. Po upieczeniu ostudz i schlodz w lodowce minimum 4 godziny."
).

przepis(chleb_domowy, 
  [sklad(maka, 500), sklad(woda, 250), sklad(drozdze, 20)], 
  1, 90,
  "W cieplej wodzie rozpusc drozdze z cukrem i odstaw na 10 minut do spienienia. Wymieszaj make z sola, dodaj aktywne drozdze i wyrob elastyczne ciasto. Przykryj i odstaw do wyrosniecia na okolo 60 minut. Przeloz ciasto do formy, piecz w piekarniku nagrzanym do 220°C przez 15 minut, potem zmniejsz temperature do 190°C i piecz kolejne 40 minut. Po upieczeniu wystudz na kratce."
).

przepis(kotlety_mielone, 
  [sklad(mieso_mielone, 400), sklad(bulki, 100), sklad(jajko, 100)], 
  4, 30,
  "Mieso wymieszaj z bulka namoczona w mleku, jajkiem i przyprawami. Formuj kotlety, obtocz w bulce tartej i smaz na rozgrzanej patelni na zolty kolor, okolo 6-7 minut z kazdej strony. Podawaj gorace."
).

przepis(pizza_margherita, 
  [sklad(maka, 300), sklad(woda, 180), sklad(ser_mozzarella, 200), sklad(pomidory, 150)], 
  4, 20,
  "Przygotuj ciasto, wyrabiaj i odstaw do wyrosniecia na okolo 1 godzine. Rozwazkuj ciasto na placek, rozsmaruj sos pomidorowy, posyp mozzarella. Piecz w piekarniku nagrzanym do 220°C przez 12-15 minut az ciasto sie zarumieni, a ser roztopi."
).

przepis(tortilla_z_kurczakiem, 
  [sklad(tortilla, 2), sklad(kurczak, 200), sklad(salata, 50)], 
  2, 15,
  "Usmaz pokrojonego kurczaka doprawionego przyprawami na zolty kolor, ostudz. Podgrzej tortille, uloz na nich salate i kurczaka, zawin i podawaj."
).

przepis(krem_czekoladowy, 
  [sklad(czekolada, 200), sklad(smietana, 150), sklad(cukier, 50)], 
  4, 15,
  "Podgrzej smietane do wrzenia, zalej nia posiekana czekolade i mieszaj do rozpuszczenia. Dodaj cukier i chlodz w lodowce co najmniej 2 godziny przed podaniem."
).

przepis(zupa_pieczarkowa, 
  [sklad(pieczarki, 300), sklad(cebula, 100), sklad(bulion, 1000)], 
  4, 30,
  "Podsmaz cebule i pieczarki do miekosci, zalej bulionem i gotuj 20 minut. Zblenduj na krem lub podawaj z makaronem. Dopraw do smaku."
).

przepis(smoothie_owocowe, 
  [sklad(banan, 100), sklad(jagody, 100), sklad(mleko, 200)], 
  1, 5,
  "Wszystkie skladniki zmiksuj na gladki koktajl. Podawaj schlodzony."
).


przepis(pancakes, 
  [sklad(maka, 200), sklad(jajko, 100), sklad(mleko, 300)], 
  4, 20,
  "Wymieszaj skladniki na gladkie ciasto, odstaw na 10 minut. Smaz na srednim ogniu cienkie placki okolo 2 minuty z kazdej strony az beda zlote. Podawaj z syropem."
).

przepis(salatka_ziemniaczana, 
  [sklad(ziemniaki, 400), sklad(czosnek, 5), sklad(koper, 20)], 
  3, 20,
  "Ugotowane ziemniaki pokroj w kostke. Wymieszaj z posiekanym czosnkiem, koperkiem i majonezem. Dopraw sola i pieprzem. Podawaj schlodzone."
).

przepis(gulasz_wolowy, 
  [sklad(mieso_wolowe, 500), sklad(cebula, 150), sklad(papryka, 200)], 
  6, 120,
  "Mieso pokroj na kawalki, obsmaz na zloto. Dodaj cebule i papryke, podsmaz. Zalej bulionem i dus pod przykryciem na malym ogniu przez 2 godziny az mieso bedzie miekkie."
).

przepis(zapiekanka_makaronowa, 
  [sklad(makaron, 200), sklad(ser, 150), sklad(sos_pomidorowy, 200)], 
  4, 30,
  "Ugotuj makaron al dente. Wymieszaj z sosem i polowa sera, przeloz do naczynia zaroodpornego. Posyp reszta sera i zapiekaj w 180°C przez 20 minut az ser sie zarumieni."
).

przepis(kurczak_pieczony, 
  [sklad(kurczak, 1000), sklad(przyprawy, 50)], 
  6, 90,
  "Kurczaka natrzyj przyprawami, odstaw na 30 minut. Piecz w piekarniku nagrzanym do 180°C przez 1 godzine i 20 minut, az mieso bedzie soczyste i skorka chrupiaca."
).

przepis(jaglanka, 
  [sklad(platki_jaglane, 100), sklad(mleko, 200), sklad(miod, 20)], 
  2, 15,
  "Kasze jaglana oplucz i ugotuj w mleku na malym ogniu okolo 15 minut, az wchlonie plyn i zmieknie. Dodaj miod do smaku i wymieszaj."
).

przepis(tarta_owocowa, 
  [sklad(maka, 250), sklad(maslo, 150), sklad(owoce, 300)], 
  6, 45,
  "Zagnieć ciasto i wyloz nim forme. Piecz spod w 180°C przez 15 minut. Na podpieczony spod wyloz owoce i piecz kolejne 25-30 minut az ciasto sie zarumieni."
).

przepis(risotto_z_pieczarkami, 
  [sklad(ryz, 200), sklad(pieczarki, 150), sklad(bulion, 500)], 
  4, 35,
  "Na patelni podsmaz pieczarki. Dodaj ryz i smaz przez 2 minuty. Stopniowo dodawaj bulion, mieszajac, az ryz wchlonie plyn i bedzie miekki, okolo 30 minut. Dopraw do smaku."
).

przepis(placuszki_serowe, 
  [sklad(ser, 200), sklad(jajko, 100), sklad(maka, 50)], 
  3, 20,
  "Wymieszaj ser z jajkiem i maka na jednolita mase. Smaz na rozgrzanej patelni lyzka porcje ciasta na zloty kolor, okolo 3 minuty z kazdej strony. Podawaj na cieplo."
).

przepis(burger, 
  [sklad(mieso_mielone, 300), sklad(bulka, 2), sklad(salatka, 50)], 
  4, 20,
  "Mieso uformuj w kotlety i dopraw sola oraz pieprzem. Smaz na srednim ogniu po 5-6 minut z kazdej strony. Podawaj w bulce z salatka i ulubionymi dodatkami."
).

przepis(curry_z_ciecierzyca, 
  [sklad(ciecierzyca, 300), sklad(pomidor, 200), sklad(mleko_kokosowe, 150)], 
  4, 40,
  "Ciecierzyce ugotuj do miekkosci. Podsmaz cebule i przyprawy, dodaj pomidory i mleko kokosowe. Dodaj ciecierzyce i gotuj na malym ogniu okolo 20 minut. Podawaj z ryzem."
).

przepis(zupa_krem_brokulowa, 
  [sklad(brokul, 300), sklad(cebula, 100), sklad(bulion, 800)], 
  4, 25,
  "Podsmaz cebule, dodaj brokul i bulion. Gotuj az warzywa beda miekkie, okolo 20 minut. Zblenduj na krem i dopraw do smaku."
).

przepis(tarta_szpinakowa, 
  [sklad(maka, 250), sklad(maslo, 150), sklad(szpinak, 200)], 
  4, 50,
  "Zagnieć ciasto i wyloz nim forme. Podsmaz szpinak i wymieszaj z jajkami oraz serem. Wylej farsz na spod i piecz w 180°C przez 35-40 minut az masa sie zetnie."
).

przepis(frytki_domowe, 
  [sklad(ziemniaki, 500), sklad(olej, 50)], 
  4, 40,
  "Ziemniaki obierz i pokroj w slupki. Wymocz w zimnej wodzie, osusz. Smaz na glebokim oleju rozgrzanym do 180°C przez okolo 7-8 minut na zloty kolor. Odsacz na papierze. Podawaj gorace."
).

przepis(makaron_z_sosem_pomidorowym, 
  [sklad(pomidory, 400), sklad(czosnek, 2), sklad(cebula, 100),sklad(makaron,400)], 
  4, 30,
  "Podsmaz cebule i czosnek, dodaj pomidory i dus na malym ogniu okolo 20 minut az sos zgestnieje. Dopraw sola, pieprzem i ziolami."
).

przepis(kalafior_w_bulce_tartej, 
  [sklad(kalafior, 500), sklad(bulka_tarta, 100), sklad(maslo, 50)], 
  4, 40,
  "Kalafior ugotuj na poltwardo. Przygotuj bulke tarta z roztopionym maslem. Posyp kalafior mieszanka i zapiekaj w piekarniku 180°C przez 15 minut."
).



zamiennik(jajko, platki_sojowe).
zamiennik(jogurt, mleko).
zamiennik(mleko,woda).
zamiennik(twarog, ser_feta).
zamiennik(ser, ser_feta).
zamiennik(ser_feta, tofu).
zamiennik(kurczak, tunczyk).
zamiennik(tunczyk, losos).
zamiennik(szynka, tunczyk).
zamiennik(kurczak, platki_sojowe).
zamiennik(losos, tofu).
zamiennik(ryz, kuskus).
zamiennik(kuskus, kasza_gryczana).
zamiennik(platki_owsiane, platki_sniadaniowe).
zamiennik(chleb, maka).
zamiennik(papryka, cukinia).
zamiennik(cukinia, dynia).
zamiennik(brokuly, kalafior).
zamiennik(salata, ogorek).
zamiennik(marchew, dynia).
zamiennik(banan, truskawki).
zamiennik(truskawki, jagody).
zamiennik(jagody, rodzynki).
zamiennik(maslo, maslo_orzechowe).
zamiennik(mleczko_kokosowe, mleko).
zamiennik(miod, sok_pomaranczowy).
zamiennik(ciecierzyca, soczewica).
zamiennik(bob, ciecierzyca).
zamiennik(soczewica, tofu).
zamiennik(ogorki_kiszone, ogorek).
zamiennik(koperek, ziola).
zamiennik(przyprawy, ziola).
zamiennik(bulion, woda).
zamiennik(mieso, tofu).
zamiennik(smietana, jogurt).
zamiennik(maslo, margaryna).
zamiennik(chleb, bulka).
zamiennik(mleko, mleko_sojowe).
zamiennik(ser, ser_zolty).
zamiennik(ser_zolty, mozzarella).
zamiennik(szynka, salami).
zamiennik(salami, szynka).
zamiennik(sol, przyprawy).
zamiennik(pieprz, chili).
zamiennik(olej, oliwa).
zamiennik(oliwa, olej_kokosowy).
zamiennik(sos_sojowy, maggi).
zamiennik(kurczak, indyk).
zamiennik(wolowina, wieprzowina).
zamiennik(wieprzowina, wolowina).
zamiennik(ryba, tunczyk).
zamiennik(tunczyk, losos).
zamiennik(mieso_mielone,mieso).
zamiennik(jajko, platki_sojowe).
zamiennik(platki_sojowe, siemie_lniane).
zamiennik(mleko, mleko_sojowe).
zamiennik(ser, ser_feta).
zamiennik(ser_feta, tofu).
zamiennik(ryz, kuskus).
zamiennik(kuskus, kasza_gryczana).
zamiennik(olej, oliwa).
zamiennik(groch, groszek).
zamiennik(pomidor, pomidory_koktajlowe).
zamiennik(cukinia, kabaczek).
zamiennik(maslo, margaryna).
zamiennik(ziemniak, kartofel).
zamiennik(marchew, marchewka).
zamiennik(baklazan, oberzyn).
zamiennik(papryka_czerwona, papryka).
zamiennik(cebula, cebula_czerwona).
zamiennik(czosnek, czosnek_swiezy).
zamiennik(platki_jaglane, jagly).
zamiennik(jagly, kasza_jaglana).
zamiennik(platki_owsiane, owsianka).
zamiennik(ryz, ryz_bialy).
zamiennik(ryz_brązowy, ryz_brazowy).
zamiennik(makaron, spaghetti).
zamiennik(jajko,jajo).
zamiennik(jajko,jajka).
zamiennik(jajko,jaja).
zamiennik(ser, ser_zolty).
zamiennik(ser, ser_bialy).
zamiennik(ser_zolty,ser).
zamiennik(ser_bialy,ser).
zamiennik(bulion, bulion_warzywny).
zamiennik(cukier, cukier_bialy).
zamiennik(cukier, cukier_brazowy).



