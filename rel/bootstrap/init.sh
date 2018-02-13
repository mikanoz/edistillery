#!/bin/sh

wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get update
sudo apt-get install esl-erlang -y
sudo apt-get install elixir -y
mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez --force

sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
echo debconf shared/accepted-oracle-license-v1-1 select true | \
  sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | \
  sudo debconf-set-selections
sudo apt-get install oracle-java8-installer -y

wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.2.1.deb
sudo dpkj -i elasticsearch-6.2.1.deb
sudo service elasticsearch start

sudo add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -sc)-pgdg main"
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install postgresql-9.6 -y

sudo apt-get install inotify-tools -y

sudo su
echo "local   all             postgres                                trust" | cat - /etc/postgresql/9.6/main/pg_hba.conf > temp && mv temp /etc/postgresql/9.6/main/pg_hba.conf
echo "host    all             postgres        127.0.0.1/32            trust" | cat - /etc/postgresql/9.6/main/pg_hba.conf > temp && mv temp /etc/postgresql/9.6/main/pg_hba.conf
service postgresql restart
exit
