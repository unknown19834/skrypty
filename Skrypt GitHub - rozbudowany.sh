#!/bin/sh
echo "Czy dodajesz commita po raz pierwszy? [Podaj tak lub nie]"
while :
do 
	read decyzja 
	case $decyzja in 
		tak)
			echo "Podaj nazwę użytkownika"
			read user
			echo "Podaj emial"
			read email
			echo "Podaj nazwę commita"
			read commit
			echo "Podaj lokalizacje na dysku (podaj pełną lokalizacje np. X:\Folder"
			read lokalizacja
			echo "Podaj link do repozytorium (nie podawaj https://github.com/ a tylko nazwa_użytkownika/nazwa_repozytorium)"
			read rep
			cd $lokalizacja
			git config --global user.name "$user"
			git config --global user.email "$email"
			git init 
			git add . 
			git status 			
			git commit -m "$commit"
			git remote add origin https://github.com/$rep
			git branch –M master
			git push -u origin master
			break
			;;
		nie)
			echo "Podaj nazwę commita"
			read commit
			echo "Podaj lokalizacje na dysku (podaj pełną lokalizacje np. X:\Folder"
			read lokalizacja
			cd $lokalizacja
			git add .
			git commit -m "$commit"
			git push -u origin master
			break
			;;
		*)
			echo "Nie rozumiem"
			;;
	esac 
done


echo "Działanie skryptu zakończone. Naciśnij dowolny przycisk aby zakończyć"
read