## Variabili ambientali

# Procediamo tramite il comando env, impaginadolo con less, a stampare tutte le variabili ambientali al momento attive

env | less

#Tra queste, evidenziamo la variabile PATH con il grep

env| grep PATH

# La variabile PATH rappresenta le cartelle che il sistema scansiona per trovare i comandi eseguibili dinamicamente

#Il comando ls per esempio è un comando esterno, la cui locazione è verificabile tramite il comando whereis

whereis ls #/usr/bin/ls
type ls # Verrà specificato che si tratta di un alias

#Per esempio il comando cd darà un risultato differente, trattandosi di un comando già presente nella shell stessa

type cd # cd è un comando interno della shell, non avrà bisogno di eseguire un programma esterno come ls

#Stampiamo la variabile a schermo

echo $PATH # Stamperà il percorso intero della variabile

#Per aggiungere una o più cartelle alla variabile, bisogna eseguire il seguente comando, seguito dal percorso desiderato

export PATH=$PATH:/daje/grande/roma/ # Aggiungerà (non sovrascrivendo) le tre cartelle specificate

#Qualora si volesse ripristinare la variabile allo stato originale, basterà ridefinire la variabile con l'output originale

export PATH= # Output del primo echo $PATH

#Qualora volessimo inserire una variabile ambientale permanente nel disco, senza che venga cancellata ogni reboot

vi .bashrc # Entriamo a modificare il file con l'editor vi

export GATTO=Meow # Inseriamo la variabile all'interno del file, per convenzione le variabili ambientali sono in maiuscolo

#Salviamo il file, e una volta tornati alla shell, potremo anche dopo un reboot, stampare il risultato

echo $GATTO # meow






















