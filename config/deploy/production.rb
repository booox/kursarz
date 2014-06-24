role :app, %w{kursarz@146.185.187.81}
role :web, %w{kursarz@146.185.187.81}
role :db,  %w{kursarz@146.185.187.81}

server '146.185.187.81', user: 'kursarz', roles: %w{web}
