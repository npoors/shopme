ls -al ~/.ssh
cat ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
git push -u origin main
ssh -T git@github.com
ssh -T git@github.com
git push -u origin main
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
git push -u origin main
cd ..
cd shopme
echo "# shopme" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:npoors/shopme.git
git push -u origin main
java -jar ShopmeBackEnd-0.0.1-SNAPSHOT.jar
docker ps
docker ps -a
docker image ls
docker rmi 1dee174af7c3
psql -h localhost -p 5432 -U postgres -W
docker ps
docker stop 0fcf4943b27d
docker rm 0fcf4943b27d
docker ps
docker volume create --driver local --opt type=none --opt device=D:/DEV/java/projects/volumes/postgres_data_volume --opt o=bind postgres_data_volume
docker volume create --driver local --opt type=none --opt device=D:/DEV/java/projects/volumes/postgres_data_volume --opt o=bind shopmeecommerce_postgres_data_volume
docker run --name my-postgres-container -e POSTGRES_PASSWORD=password -d -p 5433:5432 b212022e7c2a
docker run --name my-postgres-container -e POSTGRES_PASSWORD=password -d -p 5433:5432 -v postgres_data_volume:/var/lib/postgresql/data b212022e7c2a
docker exec -it my-postgres-container bash

docker exec my-postgres-container psql -U postgres -c "SELECT version();"
docker exec my-postgres-container psql -U postgres -c "\l"
docker exec my-postgres-container psql -U postgres -c "SELECT datname FROM pg_database;"
docker exec my-postgres-container psql -U postgres -d postgres -c "SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';"
docker exec my-postgres-container psql -U postgres -d postgres -c "
CREATE TABLE etudiant (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    date_naissance DATE,
    email VARCHAR(100) UNIQUE,
    telephone VARCHAR(20),
    adresse TEXT
);
"
cd datasources/
ls
docker cp insert_students.sql my-postgres-container:/insert_students.sql
docker exec my-postgres-container psql -U postgres -d postgres -f /insert_students.sql
docker cp insert_students.sql my-postgres-container:/opt/insert_students.sql
docker exec my-postgres-container psql -U postgres -d postgres -f /opt/insert_students.sql
docker exec my-postgres-container psql -U postgres -d postgres -f insert_students.sql
docker cp insert_students.sql my-postgres-container:/select_students.sql
docker exec my-postgres-container psql -U postgres -d postgres -f select_students.sql

docker run --rm --volumes-from my-postgres-container -v D:/backup ubuntu tar cvf /backup/backup.tar /postgres_data_volume
tar xvf D:/backup/backup.tar -C /backup //pour decompresser
docker run --rm --volumes-from my-postgres-container -v D:/backup:/backup ubuntu tar -czvf /backup/backup.tar.gz /var/lib/postgresql/data
docker run --rm --volumes-from my-postgres-container -v D:/backup:/backup busybox tar -czvf /backup/backup.tar.gz /var/lib/postgresql/data
docker run --rm -v postgres_data_volume:/var/lib/postgresql/data -v D:/backup:/backup busybox tar -czvf /backup/backup.tar.gz /var/lib/postgresql/data

Étape 1 : Créer un nouveau volume Docker
Créez un nouveau volume Docker nommé postgres_data_volume :
docker volume create postgres_data_volume

Étape 2 : Restaurer les données à partir de la sauvegarde dans le nouveau volume
docker run --rm -v postgres_data_volume:/var/lib/postgresql/data -v D:/backup:/backup busybox tar -xzvf /backup/backup.tar.gz -C /var/lib/postgresql/data


docker run --rm --volumes-from my-postgres-container2 -v D:/backup:/backup ubuntu bash -c "cd /var/lib/postgresql/data && tar xzvf /backup/backup.tar.gz
tar -xzvf D:/backup/backup.tar.gz -C D:/backup

docker run --rm -v postgres_data_volume:/var/lib/postgresql/data -v D:/backup:/backup busybox tar -xzvf /backup/backup_postgres.tar.gz -C /
docker run --rm -v shopmeecommerce_postgres_data_volume:/var/lib/postgresql/data -v D:/backup:/backup busybox tar -xzvf /backup/backup_postgres.tar.gz -C /
docker run --rm -v postgres_data_volume:/var/lib/postgresql/data -v D:/backup:/backup busybox tar -xzvf /backup/backup_ubuntu.tar.gz -C /var/lib/postgresql/data

docker run --rm -v postgres_data_volume:/var/lib/postgresql/data -v D:/backup:/backup busybox sh -c "cd /var/lib/postgresql/data && tar -xzvf /backup/backup_ubuntu.tar.gz -C /"
docker run --rm -v postgres_data_volume:/var/lib/postgresql/data -v D:/backup:/backup busybox sh -c "cd /var/lib/postgresql/data && tar -xzvf /backup/backup_ubuntu.tar.gz -C /var/lib/postgresql/data"




Supprimer tous les volumes inutilisés :
docker volume prune -f

Supprimer les images inutilisées :
docker image prune -a



Construire une image Docker à partir de ce Dockerfile
docker build -t mon-postgres-image .

docker run --name my-postgres-container -d b212022e7c2a