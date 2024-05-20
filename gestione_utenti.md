# Gestione utenti e permessi

## Impostazione password e account

Andiamo prima di tutto a impostare una scadenza valida alle password, in questo caso vogliamo che scadano dopo 90 giorni, e con un preavviso di 5

Dovremo modificare il file seguente

#### sudo vi /etc/login.defs

Al suo interno dovremo settare i valori in questa maniera:

#### PASS_MAX_DAYS 90
#### PASS_WARN_AGE 5

A questo punto possiamo creare gli utenti, creiamo per esempio l'utente 1

#### sudo useradd utente1

Tramite l'opzione -p potremmo anche definire subito una password, qualora non l'avessimo fatto come nel nostro caso, possiamo operare così

#### sudo passwd utente1

A quel punto ci chiederà di immettere la password

Dovremo creare singolarmente ogni utente, giacchè non c'è la possibilità di un "multiuseradd"

## Impostazione permessi

Ora possiamo sperimentare un pò con i permessi

Creiamo un file tramite il comando touch

#### touch foo.log

Possiamo intanto specificare che il file possa essere letto, modificato ed eseguito solamente dall'utente proprietario, ma lasciamo a tutti la possibilità di leggere

#### chmod 744 foo.log

Poniamo caso ci fossimo sbagliati, e avessimo assegnato l'esecuzione anche a tutti gli altri, possiamo comunque salvare la situazione così

#### chmod 745 foo.log 
#### chmod o-x foo.log

Col secondo comando rimuoviamo l'errore del comando precedente

Possiamo anche cambiare i proprietari, sia utente che gruppo, del file

#### chown user:group foo.log

Se per esempio volessimo l'utente pippo come proprietario, e il gruppo acdc come proprietario

#### chown pippo:acdc foo.log

Così possiamo gestire comodamente i permessi



























