#!/bin/sh
echo "Podaj nazwę commita"
read nazwa 
cd C:\strony
git add .
git commit -m "$nazwa"
git push -u origin master
echo "Działanie skryptu zakończone. Naciśnij dowolny przycisk aby zakończyć"
read