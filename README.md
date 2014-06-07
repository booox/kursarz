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

Dodatkowo uruchamianie poszczególnych zadań wymaga zainstalowania środowisk wymaganych, odpowiednio

Javascript i Coffeescript - Node.js, npm, jasmine-node
Ruby - Ruby i RSpec (min 2.0)
Python - Python i unittest

### Admin

    rails c

    user = User.find_by(name: "nazwa_uzywtkownika")

    user.update_attribute(admin: true)
