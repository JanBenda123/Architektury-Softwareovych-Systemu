# EXAMS [TUE_1220_S1_EXA1]

## Core features and responsibilities

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

* získání seznamu předmětů, ze společné databáze celkového systému, na základě ID učitele
* poskytnout učiteli možnost výběru
  
##### Responsibillity: Kontrola zadaných informací [5]

* ověření správnosti formátu zadaných informací
  * v případě chyby informovat uživatele a poskytnout možnost opravy
* ověření vyplnění všech údajů
* kontrola volné místnosti na základu zadané místnosti a termínu v databázi systému
  * v případě chyby informovat uživatele a poskytnout možnost výběru nového termínu
* zajištění kolizí, pokud dva učitelé vypisují zkoušku najednou do stejné místnosti

##### Responsibillity: Zadání zkoušky do databáze [7]

* systém ve správném formátu odešle do databáze záznam o vytvoření zkoušky

##### Responsibillity: Notifikace studentům [8]

* vygeneruje zprávu o vytvoření zkoušky
* mail se odešle pouze studentům, kteří jsou přihlášení na daném předmětu a mají povoleno zasílání zpráv

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

* získání seznamu předmětů, ze společné databáze celkového systému, na základě ID učitele
* poskytnout učiteli možnost výběru

##### Responsibility: Zobrazení seznamu studentů zapsaných na předmět [3]

* získání seznamu studentů, ze společné databáze celkového systému, na základě ID předmětu a učitele (v případě, že student není garantem předmětu, vidí pouze studenty ze svých rozvrhových lístků)
* poskytnout učiteli možnost výběru studentů ze seznamu
  
##### Responsibillity: Kontrola zadaných informací [6]

* ověření správnosti formátu zadaných informací
  * v případě chyby informovat uživatele a poskytnout možnost opravy
* ověření vyplnění všech údajů
* kontrola volné místnosti na základu zadané místnosti a termínu v databázi systému
  * v případě chyby informovat uživatele a poskytnout možnost výběru nového termínu
* zajištění kolizí, pokud dva učitelé vypisují zkoušku najednou do stejné místnosti

##### Responsibillity: Zadání zápočtu do databáze [8]

* systém ve správném formátu odešle do databáze záznam o udělení nebo odebrání zápočtu

##### Responsibillity: Notifikace studentům [10]

* vygeneruje zprávu o udělení či odebrání zápočtu
* mail se odešle pouze studentům, kterých se akce týká a mají povoleno zasílání zpráv


### Feature: Registrace na termíny zkoušky

<!-- The feature described in a form of a user story -->
As a...

#### Feature breakdown

<!-- The feature breakdown -->
1. BLA BLA

#### Responsibilities

<!-- A ##### section for each group of responsibilities -->

##### Nejaka responsibillity

* nejaky bod

### Feature: Zobrazení výsledků

Jako student chci mít možnost podívat se na své výsledky z předmětů, které jsem si při studiu zapsal.
Takto se dozvím, zda škole věnuji dostatečně času a jestli zvládám plnění svého studijního plánu.

#### Feature breakdown

1. Student na dashboardu otevře modul výsledky zkoušek.
2. Zobrazí se seznam výsledků zkoušek a zápočtů, které student skládal.
3. V seznamu se student dozví jména jednotlivých předmětů, místa a časy konání, výsledky zkoušek, informace o udělení zápočtu a učitele, který zadal daný výsledek.

#### Responsibilities

##### Zobrazení skládaných zkoušek [2]

* získat ze společné databáze informace o všech zkouškách, které daný student skládal.

##### Zobrazení získaných zápočtů [2]

* získat ze společné databáze informace o všech zápočtech, které daný student získal.

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
1. Kontrola pripojeni k internetu
2. - 8. Pristup k databazi, vytvoreni cache, modelu z cache a jeho vizualizace. Synchronizace s databazi, kontrola persistence zmen v databazi.
9. Napojeni API zprostredkovavajici odesilani emailu pomoci toolu 3 strany?

##### Responsibillity: Zobrazení vyučovaných předmětů [2]

* získání seznamu předmětů, ze společné databáze celkového systému, na základě ID učitele
* poskytnout učiteli možnost výběru

##### Responsibillity: Zobrazení zkoušek pro daný předmět [4]

* získání seznamu zkoušek, ze společné databáze celkového systému, na základě ID učitele a předmětu
* poskytnout učiteli možnost výběru

##### Responsibillity: Zadání zkoušky do databáze [8]

* systém ve správném formátu odešle do databáze změny

##### Responsibillity: Notifikace studentům [9]

* každému studentovi, u kterého byl změněn výsledek se odešle email s detaily změny, obsahující například zkoušku, předmět, předchozí výsledek a nový výsledek

<!-- Continue with ### sections for all other features. -->

### Feature: Komunikace / statistika

<!-- The feature described in a form of a user story -->
As a...

#### Feature breakdown

<!-- The feature breakdown -->
1. BLA BLA

#### Responsibilities

<!-- A ##### section for each group of responsibilities -->

##### Nejaka responsibillity

* nejaky bod

<!-- Continue with ### sections for all other features. -->
