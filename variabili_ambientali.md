# Variabili ambientali

Procediamo tramite il comando env, impaginadolo con less, a stampare tutte le variabili ambientali al momento attive

***env | less***

Tra queste, evidenziamo la variabile PATH con il grep

***env| grep PATH***

La variabile PATH rappresenta le cartelle che il sistema scansiona per trovare i comandi eseguibili dinamicamente

Il comando ls per esempio è un comando esterno, la cui locazione è verificabile tramite il comando whereis

***whereis ls ---> /usr/bin/ls***

Successivamente tramite il comando type, avremo informazioni sulla natura del comando

***type ls ---> "ls ha "ls --color=auto" come alias***

Per esempio il comando cd darà un risultato differente, trattandosi di un comando già presente nella shell stessa, e non avrà bisogno di librerie esterne per essere eseguito

***type cd ---> cd è un comando interno della shell***

Stampiamo la variabile a schermo

***echo $PATH ---> /usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:
/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:
/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:
/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin***

Per aggiungere una o più cartelle alla variabile, bisogna eseguire il seguente comando, seguito dal percorso desiderato

***export PATH=$PATH:/daje/grande/roma/*** _Aggiungerà (non sovrascrivendo) le tre cartelle specificate_

Qualora si volesse ripristinare la variabile allo stato originale, basterà ridefinire la variabile con l'output originale

***export PATH=*** _Output del primo echo $PATH_

Se invece volessimo inserire una variabile ambientale permanente nel disco, senza che venga cancellata ogni reboot, dovremo operare in tal maniera

***vi .bashrc*** _Entriamo a modificare il file con l'editor vi_

Una volta all'interno del file, apporremo la modifica desiderata

***export GATTO=Meow***  _Inseriamo la variabile all'interno del file, per convenzione le variabili ambientali sono in maiuscolo_

Salviamo il file, e una volta tornati alla shell, potremo anche dopo un reboot, stampare il risultato

***echo $GATTO ---> Meow***






















