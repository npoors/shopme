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
docker run --name my-postgres-container -e POSTGRES_PASSWORD=password -d -p 5433:5432 176399451347
docker run --name my-postgres-container -e POSTGRES_PASSWORD=password -d -p 5433:5432 -v postgres_data_volume:/var/lib/postgresql/data 176399451347
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
docker run --rm --volumes-from my-postgres-container -v D:/backup:/backup ubuntu tar -czvf /backup/backup.tar.gz /var/lib/postgresql/data
docker run --rm --volumes-from my-postgres-container -v D:/backup:/backup busybox tar -czvf /backup/backup.tar.gz /var/lib/postgresql/data
