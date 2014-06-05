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


### Assignments

Do obsługi zadań programistycznych używamy sidekiq, możemy go uruchomić

    bundle exec sidekiq

I powinien od tej chwili być dostępny pod localhost:3000/sidekiq

Sidekiq wymaga zainstalowania redisa http://redis.io/, pod Ubuntu wystarczy wklepać

    sudo apt-get install redis-server
