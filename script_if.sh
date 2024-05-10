#!/bin/bash

#Questo script basilare ha lo scopo di testare il funzionamento dei conditional statements 

#Per prima cosa inseriamo una richiesta di input da parte del sistema all'utente tramite l'opzione -e di echo

echo -e "Cosa vuoi fare? "

#L'input verrà salvato nella variabile in basso tramite il comando read

read input

#Viene aperto il primo if, e viene richiesto allo script di confrontare l'input dell'utente con la stringa "ping"


if [$input = "ping"] ; then
    ping -c 3 8.8.8.8 #ping al server DNS di Google, l'opzione -c è per richiedere l'esecuzione per solo 3 volte

#Qualora la condizione fosse vera, e l'utente scrivesse ping, allora il sistema darebbe inizio al comando ping

#Tramite lo statement elif, andiamo a porre una seconda condizione, nel caso in cui la prima non si fosse verificata


elif [$input = "patto"] ; then #Lo scopo é di ripristinare, sovrascrivendola, la variabile PATH, con il valore originale
    export PATH= #valore predefinito della variabile PATH

#Qualora nessuna di queste due condizioni si verificasse, lo statement else allora attiverà il suo comando

else
    echo "Termine non valido"
fi #Tramite il fi lo script viene concluso





    







