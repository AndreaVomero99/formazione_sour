# Creazione chiavi ssh

In questa esercitazione verrà creata una chiave SSH per la connessione a server remoto, in questo caso la macchina Rockylinux, già utilizzata come server APACHE nel https://github.com/AndreaVomero99/formazione_sour/blob/main/apache.md

## Primo passo

Il comando per la creazione della chiave è il seguente:

#### ssh-keygen -b 2048 -t rsa

Verrà chiesto di immettere una password, dopodiché il sistema genererà la chiave

L'opzione b specifica il numero di bit con cui comporre la chiave, l'opzione t specifica il tipo di chiave, in questo caso RSA

Possiamo poi verificare che la chiave sia stata generata ricercandola in quello che solitamente è il path seguente

#### ls -la /home/user/.ssh/

Con il comando di cui sopra esporremo a schemro il contenuto della cartella .ssh, se tutto fosse andato a buon fine, dovremmo trovare i file id_rsa e id_rsa.pub, trattasi quest'ultima della chiave pubblica

## Secondo passo

A questo punto possiamo copiare la chiave ssh sulla macchina Rockylinux, specificando il percorso in cui si trova la chiave PUBBLICA nella macchina corrente

#### ssh-copy-id -i /home/user/.ssh/id_rsa.pub utente_rocky@ip_rocky

Bisognerà immettere la password specificata in precedenza, durante la creazione stessa della chiave, se abbiamo proceduto correttamente la macchina Rocky ora avrà la chiave pubblica da noi generata

## Ultimo passo

Ora non ci resta che connetterci tramite il comando ssh

#### ssh utente_rocky@ip_rocky

Verremo connessi all'utente_rocky da remoto
