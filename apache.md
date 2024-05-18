# Setup di un APACHE Web Server su Rockylinux

## Download necessari:

### Ai fini di questi appunti, la virtual box utilizzata sarà quella di Oracle, di conseguenza tutti gli ISO saranno in architettura AMD64

https://rockylinux.org/it/download   _La versione scelta è stata la minimal ISO_

https://www.debian.org/distrib/netinst  _Scegliere la versione AMD64_

## Configurare la comunicazione di rete

Per assicuraci che le due macchine virtuali comunichino fra di loro, occorrerà configurare, nelle impostazioni di entrambe e nella sezione "rete", la connessione "scheda con bridge"

Dopodiché potremo verificare la connettività con un ping, per esempio qualora ci trovassimo sulla macchina Rocky Linux sarebbe questa la sintassi:

#### ping -c 3 _ip_debian_

Per ottenere l'ip della macchina in cui ci troviamo, basterà utilizzare il comando ip addr:

#### ip addr

Come output verranno rappresentate informazioni sulla rete, tra cui l'ip stesso della macchina

## Configurazione VM Rocky9

### La macchina Rocky9 fungerà da server APACHE

Per prima cosa, è buona prassi aggiornare il database del packet manager di Red Hat:

#### sudo dnf update -y

Con l'opzione -y, i download avverranno senza richiedere ogni volta la conferma dell'utente

Fatto questo, possiamo scaricare il pacchetto di Apache, che su disto Red Hat prende il nome di httpd

#### sudo dnf install httpd -y

Ora possiamo inizializzare APACHE

#### sudo systemctl start httpd

Con il comando seguente invece ci assicureremo che il servizio venga fatto partire ad ogni boot del sistema

#### sudo systemctl enable httpd

### Configurazione Firewall

Prima di poter effettivamente usufruire del servizio, dovremo però anche configurare il firewall, in modo che i servizi http e https siano abilitati

#### sudo firewall-cmd --permanent --zone=public --add-service=http
#### sudo firewall-cmd --permanent --zone=public --add-service=https
#### sudo firewall-cmd --reload

### Ultime verifiche

A questo punto possiamo prima restartare il servizio, per essere sicuri che le modifiche vengano effettivamente implementate, e poi verificarne lo status

#### sudo systemctl restart httpd

#### sudo systemctl status httpd

Se tutto è andato a buon fine, dovrebbe essere evidenziato in verde chiaro che il servizio è "active(running), e "enabled"

A questo punto lanciando come ricerca nell'url di qualsiasi browser l'ip della macchina Rocky linux, che funge da server per APACHE, potremo vedere lo scheletro della pagina web

### Modifica pagina html del server APACHE

Ora inseriremo il seguente testo all'interno del file col codice html, sovrascrivendolo e portandolo a rappresentare solamente la stringa sul browser

#### echo "Hello DevOpsTribe!" > /var/www/html/index.html

Se ci fossero problemi legati ai permessi di edit del file, possiamo procedere in tale maniera

#### sudo chmod o+w /var/www/html

In questo modo chiunque potrà editare la directory in cui si trova il file, e potremmo apporre le necessarie modifiche, sarebbe opportuno una volta finito togliere i permessi appena dati

#### sudo chmod o-w /var/www/html

## Configurazione Debian

A questo punto non ci resta che utilizzare la VM Debian per eseguire un curl sull'ip della macchina Rocky, che ci permetterà di accedere alla pagina html da noi configurata

Prima di tutto bisogna installare il pacchetto col comando curl, non presente di default

_Se volessimo utilizzare solamente la versione CLi di Debian, potremmo prima di procedere utilizzare il comando sudo systemctl isolate multi-user.target_

#### sudo apt update

#### sudo apt install curl

Ultimo step, eseguiamo il comando curl per chiamare il file di html dell'altra macchina, se tutto va bene, dovrebbe dare come output la stringa "Hello DevOpsTribe!"

#### sudo curl 192.168.178.101








