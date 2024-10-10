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
As a...

#### Feature breakdown

<!-- The feature breakdown -->
1. BLA BLA

#### Responsibilities

<!-- A ##### section for each group of responsibilities -->

##### Nejaka responsibillity

* nejaky bod

<!-- Continue with ### sections for all other features. -->

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

<!-- Continue with ### sections for all other features. -->

### Feature: Zobrazení výsledků

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

### Feature: Udělování výsledků (známek)

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

