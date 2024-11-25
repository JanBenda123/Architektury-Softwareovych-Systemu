# EXAMS [TUE_1220_S1_EXA1]

## Core features and responsibilities

- Based on this document we created the table of responsibilities from which a dependency graph was produced.
- During the creation of the table, some additional responsibilities were added for the system to resemble a
  more cohesive conceptualization. Names of responsibilities were also slightly altered during the discussion in the group
- Below is a mapping of the original responsibilities create during the first labs to the responsibilities listed in the table. Each mapped responsibility appears in the following format
  //
  //Example :  
  //##### Responsibillity: {name of responsibility} [line number of the feature]
  // \* tabulka: '{name of the correlated responsibility in the table}'
- here is a list of added responsibilities in the table that were not mapped to any responsibility listed in this file

1. "Zobrazit upozornění na chybu při vypisování termínu"
2. "Zobrazit potvrzení vypsaného termínu"
3. "Editace detailu zkoušky"
4. "Zobrazit rozhraní pro zápis na zkoušku"
5. "Zobrazit potvrzení zápisu"
6. "Rozhraní udělení zápočtu"
7. "Rozhraní zapsání výsledků zkoušky"
8. "Agregace výsledků"
9. "Přiřazení studenta na termín v databázi"
10. "Notifikace studentům"
11. "Zobrazit statistiky předmětů a vyučujících"

<!-- A ### section for each feature -->

### Feature: Vytvoření zkoušky, správa podmínek a rezervace místnosti

<!-- The feature described in a form of a user story -->

Jako učitel potřebuji vytvořit termín zkoušky, protože mi to „přikazuje“ akreditace předmětu. Navíc potřebuji definovat podmínky pro přihlášení, aby se mi tam nepřihlašovali studenti, kteří nemusí mít dostatečné znalosti ke splnění zkoušky (například nemají zápočet).
Při vytváření zkoušky potřebuji zarezervovat místnost konání, aby studenti věděli, kde se mají dostavit.

#### Feature breakdown

<!-- The feature breakdown -->

1. Učitel na dashboardu vybere modul zkoušek
2. Systém mu zobrazí všechny jeho předměty, které vyučuje
3. Učitel zvolí předmět, na který chce vypsat zkoušku
4. Učitel zvolí termín, podmínky, kapacitu a místnost
5. Systém zkontroluje volnost učebny v termínu zadaném učitelem a ověří správnost zadaných informací
6. Učitel potvrdí vytvoření zkoušky
7. Systém vytvoří termín.
8. Systém pošle zprávu studentům o vytvořeném termínu.

#### Responsibilities

<!-- A ##### section for each group of responsibilities -->

##### Responsibillity: Zobrazení vyučovaných předmětů [2]

- tabulka : 'Zobrazení učitelem vyučovaných předmětů'

- získání seznamu předmětů, ze společné databáze celkového systému, na základě ID učitele
- poskytnout učiteli možnost výběru

##### Responsibillity: Kontrola zadaných informací [5]

- tabulka: "Validace zadaných informací", "Kontrola podmínek zápisu", "Kontrola a rezervace volné místnosti"

- ověření správnosti formátu zadaných informací
  - v případě chyby informovat uživatele a poskytnout možnost opravy
- ověření vyplnění všech údajů
- kontrola volné místnosti na základu zadané místnosti a termínu v databázi systému
  - v případě chyby informovat uživatele a poskytnout možnost výběru nového termínu
- zajištění kolizí, pokud dva učitelé vypisují zkoušku najednou do stejné místnosti

##### Responsibillity: Zadání zkoušky do databáze [7]

- tabulka: "Vytvoření a editace termínu", "Uložení termínu do databáze", "Uložení změn termínu do databáze"

- systém ve správném formátu odešle do databáze záznam o vytvoření zkoušky

##### Responsibillity: Notifikace studentům [8]

- tabulka: "Sestavení notifikace studentům o termínu", "Sestavení notifikace studentům o zápočtu", "Odeslání notifikací"

- vygeneruje zprávu o vytvoření zkoušky
- mail se odešle pouze studentům, kteří jsou přihlášení na daném předmětu a mají povoleno zasílání zpráv

<!-- Continue with ### sections for all other features. -->

##### Responsibillity: Notifikace studentům [8]

- tabulka: "Odeslání notifikací"

- vygeneruje zprávu o vytvoření zkoušky
- mail se odešle pouze studentům, kteří jsou přihlášení na daném předmětu a mají povoleno zasílání zpráv

<!-- A ### section for each feature -->

### Feature: Zapsání se na zkoušku

<!-- The feature described in a form of a user story -->

Jako student se potřebuji zapsat na termín zkoušky, protože chci daný předmět splnit. Rád bych zjistil všechny možné termíny.

#### Feature breakdown

<!-- The feature breakdown -->

1. Student na dashboardu vybere modul zkoušek
2. Systém mu zobrazí všechny jeho předměty, které studuje
3. Student zvolí předmět, na který se chce zapsat na zkoušku
4. Student zvolí termín
5. Systém zkontroluje kapacitu a ověří správnost zadaných informací
6. Student potvrdí zapsání na zkoušky
7. Systém zapíše studenta.

#### Responsibilities

<!-- A ##### section for each group of responsibilities -->

##### Responsibillity: Zobrazení studovaných předmětů [2]

- tabulka : 'Zobrazení studovaných předmětů'

- získání seznamu předmětů, ze společné databáze celkového systému, na základě ID studenta
- poskytnout studentovi možnost výběru

##### Responsibillity: Kontrola zadaných informací [5]

- tabulka: "Validace zadaných informací", "Kontrola podmínek zápisu", "Kontrola kapacity"

- ověření správnosti formátu zadaných informací
  - v případě chyby informovat uživatele a poskytnout možnost opravy
- ověření vyplnění všech údajů
- kontrola volné kapacity
  - v případě chyby informovat uživatele a poskytnout možnost výběru nového termínu

##### Responsibillity: Zadání zapsaného studenta do databáze [7]

- tabulka: "Uložení zápis studenta na zkoušku"

- systém ve správném formátu odešle do databáze záznam o zapsání na zkoušky

<!-- Continue with ### sections for all other features. -->

### Feature: Udělování zápočtů

<!-- The feature described in a form of a user story -->

Jako učitel potřebuji možnost vybrat ze seznamu studenty a udělit nebo odebrat jim zápočet, aby studenti věděli, jestli mají splněnou tuto studijní povinnost.

#### Feature breakdown

<!-- The feature breakdown -->

1. Učitel si otevře svůj dashboard a rozklikne si možnost zadávání výsledků
2. Systém se zeptá, ke kterému ze svých předmětů chce učitel zadat výsledky
3. Učitel vybere daný předmět a zobrazí se mu seznam studentů tohoto předmětu včetně údaje o tom, jestli mají zápočet
4. Učitel zakliká na seznamu studentů ty, kterým chce udělit zápočet
5. Učitel zmáčkne tlačítko, kterým může studentovi udělit zápočet nebo tlačítko, kterým ho může odebrat
6. Systém zobrazí shrnutí změn a zeptá se na potvrzení, pokud již nějaký student zápočet má (nebo při odebírání nemá), zobrazí upozornění, že akci nelze provést
7. Učitel potvrdí nebo odmítne změny
8. V případě potvrzení se zápočet studentovi zaznamená do databáze
9. Systém zobrazí potvrzení provedené akce
10. Systém pošle studentovi do emailu notifikaci o provedené akci

#### Responsibilities

<!-- A ##### section for each group of responsibilities -->

##### Responsibility: Zobrazení vyučovaných předmětů [2]

- tabulka: 'Zobrazit potvrzení vypsaného termínu'

- získání seznamu předmětů, ze společné databáze celkového systému, na základě ID učitele
- poskytnout učiteli možnost výběru

##### Responsibility: Zobrazení seznamu studentů zapsaných na předmět [3]

- získání seznamu studentů, ze společné databáze celkového systému, na základě ID předmětu a učitele (v případě, že student není garantem předmětu, vidí pouze studenty ze svých rozvrhových lístků)
- poskytnout učiteli možnost výběru studentů ze seznamu

##### Responsibillity: Kontrola zadaných informací [6]

- tabulka: "Validace zadaných informací", "Kontrola podmínek zápisu"

- ověření, jestli daný student už má zápočet a jestli mu ho lze udělit

##### Responsibillity: Zobrazit shrnutí informací a případné chyby [6]

- dialogové okno se shrnutím akce

##### Responsibillity: Uložení zápočtu do databáze [8]

- tabulka: "Udělení zápočtu", "Uložení zápočtů do databáze"

- systém ve správném formátu odešle do databáze záznam o udělení nebo odebrání zápočtu

##### Responsibillity: Notifikace studentům [10]

- tabulka: "Odeslání notifikací"
- vygeneruje zprávu o udělení či odebrání zápočtu
- mail se odešle pouze studentům, kterých se akce týká a mají povoleno zasílání zpráv

### Feature: Zobrazení výsledků

Jako student chci mít možnost podívat se na své výsledky z předmětů, které jsem si při studiu zapsal.
Takto se dozvím, zda škole věnuji dostatečně času a jestli zvládám plnění svého studijního plánu.

#### Feature breakdown

1. Student na dashboardu otevře modul výsledky zkoušek.
2. Zobrazí se seznam výsledků zkoušek a zápočtů, které student skládal.
3. V seznamu se student dozví jména jednotlivých předmětů, místa a časy konání, výsledky zkoušek, informace o udělení zápočtu a učitele, který zadal daný výsledek.

#### Responsibilities

##### Zobrazení skládaných zkoušek [2]

- tabulka "Zobrazení výsledků studentů", "Zobrazení detailů zkoušky"

- získat ze společné databáze informace o všech zkouškách, které daný student skládal.

##### Zobrazení získaných zápočtů [2]¨

- tabulka: "Zobrazit své výsledky (napříč předměty)"

- získat ze společné databáze informace o všech zápočtech, které daný student získal.

### Feature: Udělování výsledků (známek)

<!-- The feature described in a form of a user story -->

Jako učitel potřebuju zobrazit a zapsat výsledky jednotlivých zkoušek, aby studenti mohli splnit předměty.

#### Feature breakdown

<!-- The feature breakdown -->

1. Učitel na dashboardu vybere modul zkoušek
2. Systém mu zobrazí všechny jeho předměty, které vyučuje
3. Učitel zvolí předmět, pro který chce zapsat výsledky
4. Učitel vybere konkrétní zkoušku
5. Zobrazí se mu detaily zkoušky včetně tabulky s výsledky pro všechny zapsané studenty
6. Kliknutím na tlačítko zapsat/upravit se umožní úpravy tabulky
7. Kliknutím do příslušného pole tabulky ho může učitel vyplnit/upravit
8. Změny uloží kliknutím na tlačítko uložit, do té doby se změny neaplikují
9. (optional) Zaslání upozornění studentům, jejichž výsledky byly změněny

#### Responsibilities

<!-- A ##### section for each group of responsibilities -->

##### Responsibillity: Databaze, Cache a přístup k API pro odesílnání emailů

- tabulka: "Čtení termínů a jejich detailů", "Čtení výsledků z databáze", "Čtení a zápis statistik", "Uložení výsledků zkoušek"

1. Kontrola pripojeni k internetu
2. - 8. Pristup k databazi, vytvoreni cache, modelu z cache a jeho vizualizace. Synchronizace s databazi, kontrola persistence zmen v databazi.
3. Napojeni API zprostredkovavajici odesilani emailu pomoci toolu 3 strany?

##### Responsibillity: Zobrazení vyučovaných předmětů [2]

- získání seznamu předmětů, ze společné databáze celkového systému, na základě ID učitele
- poskytnout učiteli možnost výběru

##### Responsibillity: Zobrazení zkoušek pro daný předmět [4]

- tabulka "Zobrazení zkoušek pro daný předmět", "Zobrazení zkoušek studenta"

- získání seznamu zkoušek, ze společné databáze celkového systému, na základě ID učitele a předmětu
- poskytnout učiteli možnost výběru

##### Responsibillity: Zadání zkoušky do databáze [8]

- systém ve správném formátu odešle do databáze změny

##### Responsibillity: Notifikace studentům [9]

- tabulka: "Sestavení notifikace studentům o zápočtu", "Odeslání notifikací"

- každému studentovi, u kterého byl změněn výsledek se odešle email s detaily změny, obsahující například zkoušku, předmět, předchozí výsledek a nový výsledek

### Feature: Zobrazení statistik

<!-- The feature described in a form of a user story -->

Jako manažer si chci zobrazit historické záznamy výsledků zkoušek, abych byl schopný zhodnotit obtížnost předmětu a schopnost učitele

#### Feature breakdown

<!-- The feature breakdown -->

1. Manažer na dashboardu vybere modul zkoušek
2. Systém mu dá na výběr zda chce statistiky agregovat podle předmětu nebo podle vyučuhjícího
3. Manažer zvolí předmět/vyučujícího, jehož statistiky ho zajímají
4. Zobrazí se mu statistiky za celé platné časové období (dobu vyučování předmětu, resp. dobu, po kterou vyučující vyučuje) pro daný předmět/vyučujícího. Tyto statistiky zahrnují celkový počet zapsaných studentů, celkový počet studentů, co úspěšně absolvovali zkoušku, průměrný úspěšný termín, průměrněrou známku a průměrné hodnocení v anketách.
5. Pod celkovými statistikami se nachází tabulka statistik pro dané semestry zobzazující stejná data jako v bodě 4., vztahující se k danému semestru.
6. Kliknutím na jedno z tlačítek "Exportovat v csv" a "Exportovat v json" bude daná statistika stažena v manažerem zadeném formátu pro její další zpracování

#### Responsibilities

<!-- A ##### section for each group of responsibilities -->

##### Responsibility: Načtení a agragace dat z ostatních modulů

- získání dat z databází ostatních modulů a jejich agragace podle předmětu/vyučujícího/semestru

##### Responsibility: Zpracování a výpis zpracovaných dat

- výpočet průměrných hodnocení přes zvolené položky
- zobrazení do tabulek
- stažení dat pro další zpracování
