# Proiect SGBD in PL/SQL

Cerințe 
1. Prezentați pe scurt baza de date (utilitatea ei).
2. Realizați diagrama entitate-relație (ERD).
3. Pornind de la diagrama entitate-relație realizați diagrama conceptuală a modelului propus, integrând 
toate atributele necesare.
4. Implementați în Oracle diagrama conceptuală realizată: definiți toate tabelele, implementând toate 
constrângerile de integritate necesare (chei primare, cheile externe etc).
5. Adăugați informații coerente în tabelele create (minim 3-5 înregistrări pentru fiecare entitate 
independentă; minim 10 înregistrări pentru tabela asociativă). 
6. Definiți un subprogram stocat care să utilizeze un tip de colecție studiat. Apelați subprogramul.
7. Definiți un subprogram stocat care să utilizeze un tip de cursor studiat. Apelați subprogramul.
8. Definiți un subprogram stocat de tip funcție care să utilizeze 3 dintre tabelele definite. Tratați toate 
excepțiile care pot apărea. Apelați subprogramul astfel încât să evidențiați toate cazurile tratate.
9. Definiți un subprogram stocat de tip procedură care să utilizeze 5 dintre tabelele definite. Tratați toate 
excepțiile care pot apărea. Apelați subprogramul astfel încât să evidențiați toate cazurile tratate.
10. Definiți un trigger de tip LMD la nivel de comandă. Declanșați trigger-ul.
11. Definiți un trigger de tip LMD la nivel de linie. Declanșați trigger-ul.
12. Definiți un trigger de tip LDD. Declanșați trigger-ul.
13. Definiți un pachet care să conțină toate obiectele definite în cadrul proiectului.
14. Definiți un pachet care să includă tipuri de date complexe și obiecte necesare pentru acțiuni integrate


# Descriere proiect 
Utilitate bazei de date:
  Baza de date creata reprezint baza de date a unui magazin online de jocuri video.
Aceasta deține informații despre utilizatori, jocurile video disponibile pe platforma sau care
sunt în curs de adaugare și despre compania care a publicat produsul software.
Informații despre tabele Au fost create 6 tabele pentru a stoca datele necesare.

1. Users
  • Detine informatii despre utilizatori, precum nickname-ul vizibil pe platforma
si activitatea fiecaruia
 2. Invoice
  • Aici sunt stocate cumparaturile pe care le fac utilizatorii. Putem vedea cine si
ce a cumparat. Produsele sunt reprezentate de registration_id.
3. Online Store
 • In acest tabel avem salvate inregistrarile jocurilor in magazin. Folosim
registration_id pentru a identifica fiecare intrare a unui produs in platforma, acest cod
fiind folosit si in tranzactii. De asemenea, in acest tabel gasim coloane pentru ID-urile
jocurilor video, a publisherilor, pret, discount aplicabil si data cand jocul a fost
incarcat pe platforma.
4. Games
 • Sunt folosite coloane care retin game_id pentru a identifica jocurile care
intra in baza de date, titlul jocului, publisher_id, data lansarii, genul si daca jocul are
suport pentru gameplay de tip multiplayer.
5. Publishers
 • Identificam fiecare publisher dupa un id unic, publisher_id si in restul
coloanelor avem informatii despre locatia in care se afla sediul central, data in care s-a
inceput colaborarea cu magazinul online, tara de origine si numele companiei.
 6. Locations
 • Salvam informatiile despre sediul central al companiilor
