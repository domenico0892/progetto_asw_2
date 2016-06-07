## Secondo Progetto Architetture Software (Docker + REST API)
#### di Tommaso D'Ambrosio, Claudio Del Nero, Lorenzo D'Isidoro e Domenico Giammarino

### Requisiti:
Richiede l'installazione di [Docker](https://www.docker.com/)

### Istruzioni Docker:
1. Avviare il demone di Docker
2. Posizionarsi con il terminale nella radice del progetto
3. Eseguire `docker-compose up`
4. L'homepage è disponibile sulla porta 3000 *(attenzione all'indirizzo IP utilizzato da Docker)*

### Istruzioni test REST API:
1. Seguire le istruzioni precendenti per l'avvio di Docker
2. Eseguire gli script `script_dottori.sh` o `script_pazienti.sh` che si trovano nella radice del progetto, seguiti dall'indirizzo IP usato da Docker. Ad esempio: `./script_dottori.sh localhost`. *Potrebbe essere necessario rendere eseguibili gli script*.
