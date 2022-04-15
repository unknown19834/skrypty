#!/bin/sh
echo "Czy dodajesz commita po raz pierwszy? [Podaj tak, nie lub pomoc]"
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
			echo "Podaj lokalizacje na dysku (podaj pełną lokalizacje np. X:\Folder)"
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
			echo "Podaj lokalizacje na dysku (podaj pełną lokalizacje np. X:\Folder)"
			read lokalizacja
			cd $lokalizacja
			git add .
			git commit -m "$commit"
			git push -u origin master
			break
			;;
		pomoc)
			echo "Tak - otrzymasz zapytanie o email, nazwę użytkownia, lokalizację na dysku, link do repozytrium oraz nazwę commita."
			echo "Program zacznie śledzić podaną lokalizację (git init), doda wszystko co jest w folderze do commita o podanej nazwie, oraz utworzy branch o nazwie [master]"
			echo " "
			echo "Nie - otrzymasz zapytanie o lokalizację na dysku folderu który chesz wysłać do repozytrium oraz o nazwę commita"
			echo "Program sam odczyta do jakiego repozytorium będzie wysłany commit jeżeli kiedykolwiek była wysłana zawartość foldera do repozytorium"
			echo "Jeżeli nigdy nie wysyłałeś zawartości foldera na serwer wybierz [tak] jeżeli robiłeś to kiedyś wybierz [nie]"
			;;
		*)
			echo "Nie rozumiem, napisz tak, nie lub pomoc"
			;;
	esac 
done


echo "Działanie skryptu zakończone. Naciśnij dowolny przycisk aby zakończyć"
read
