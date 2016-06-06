#!/bin/bash

#test API patient (GET,PUT,POST,DELETE) e patients (GET)
if [$1 -eq ""]; then
echo "Lo script richiede un indirizzo (es. 192.168.99.100 o localhost)"
else

#aggiungi un nuovo paziente
printf "Aggiungo paziente...\n"
export var=$(curl -XPOST http://$1:3000/api/patient -H "Content-Type: application/json"  -d '{"email":"mario.rossi@email.it","address":"Via Prima, 1","surname":"Rossi","name":"Mario","phone_number":"123456"}')
export var2=$(echo $var | awk -F '_id' '{print $2}' | awk -F '"' '{print $3}')
#in var2 e' contenuto l'id della risorsa creata
printf "Aggiunto paziente con _id $var2\n\n"


#lista di tutti i pazienti
printf "Lista dei pazienti:"
curl -XGET http://$1:3000/api/patients
printf "\n\n"

#export var2=$( echo $var | awk -F: '{print $5}' | awk -F, '{print $1}' | sed 's/"//g')

#ottieni un paziente specifico tramite id
printf "Ottengo paziente con _id $var2...\n"
curl -XGET http://$1:3000/api/patient/$var2
printf "\nOttenuto paziente con _id $var2\n\n"

#aggiorna dottore tramite id
printf "Aggiorno paziente con _id $var2...\n"
var3={\"_id\":\"$var2\",\"email\":\"ok3\",\"address\":\"ok3\",\"surname\":\"ok4\",\"name\":\"ok4\",\"phone_number\":\"123456\"}
curl -XPUT http://$1:3000/api/patient -d $var3 -H "Content-Type: application/json"
curl -XGET http://$1:3000/api/patient/$var2
printf "\nAggiornato paziente con _id $var2\n\n"

#elimina un paziente specifico tramite id
printf "Cancello paziente con _id $var2...\n"
curl -XDELETE http://$1:3000/api/patient/$var2
printf "Cancellato paziente con _id $var2\n\n"
fi