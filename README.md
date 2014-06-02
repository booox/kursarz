# Kursarz

## Git workflow

Pobranie aktualnego mastera

    git pull --rebase origin master

## Stworzenie nowego brancha

    git checkout -b nazwa_brancha

## 'Popchniecie' brancha

    git push origin nazwa_brancha

## Domergowanie mastera do brancha - bardzo wazne zeby robic to czesto

    git checkout master

    git pull --rebase origin master

    git checkout nazwa_brancha

    git merge master nazwa_brancha


## Przydatne komendy Railsowe

###  Aktualizacja bazy danych

    rake db:migrate


### Reset bazy

    rake db:reset


###  Wypelnienie bazy przykladowymi danymi

    rake db:seed

### Konsola Rails

    rails console


### Serwer rails

    rails server

### Konsola bazy danych
    
    rails db:console
