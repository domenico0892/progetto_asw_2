#!/bin/bash

#test API doctor (GET,PUT,POST,DELETE) e doctors (GET)
if [$1 -eq ""]; then
echo "Lo script richiede un indirizzo (es. 192.168.99.100 o localhost)"
else

#aggiungi un nuovo dottore
printf "Aggiungo dottore...\n"
export var=$(curl -XPOST http://$1:3000/api/doctor -H "Content-Type: application/json"  -d '{"type":"Cardiologo","address":"Via Prima, 1","surname":"Rossi","name":"Mario"}')
export var2=$(echo $var | awk -F '_id' '{print $2}' | awk -F '"' '{print $3}')
#in var2 e' contenuto l'id della risorsa creata
printf "Aggiunto dottore con _id $var2\n\n"


#lista di tutti i dottori
printf "Lista dei dottori:"
curl -XGET http://$1:3000/api/doctors
printf "\n\n"

#export var2=$( echo $var | awk -F: '{print $5}' | awk -F, '{print $1}' | sed 's/"//g')

#ottieni un dottore specifico tramite id
printf "Ottengo dottore con _id $var2...\n"
curl -XGET http://$1:3000/api/doctor/$var2
printf "\nOttenuto dottore con _id $var2\n\n"

#aggiorna dottore tramite id
printf "Aggiorno dottore con _id $var2...\n"
var3={\"_id\":\"$var2\",\"type\":\"ok3\",\"address\":\"ok3\",\"surname\":\"ok4\",\"name\":\"ok4\"}
curl -XPUT http://$1:3000/api/doctor -d $var3 -H "Content-Type: application/json"
curl -XGET http://$1:3000/api/doctor/$var2
printf "\nAggiornato dottore con _id $var2\n\n"

#elimina un dottore specifico tramite id
printf "Cancello dottore con _id $var2...\n"
curl -XDELETE http://$1:3000/api/doctor/$var2
printf "Cancellato dottore con _id $var2\n\n"
fi