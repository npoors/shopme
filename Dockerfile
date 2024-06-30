# Utilisation de l'image PostgreSQL 14 officielle
FROM postgres:14

# Métadonnées
LABEL maintainer="emmanuelnda77@gmail.com"
LABEL description="Image Docker pour PostgreSQL 14 avec configuration personnalisée."

# Variables d'environnement
ENV POSTGRES_PASSWORD=password
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/lib/postgresql/14/bin
ENV GOSU_VERSION=1.17
ENV LANG=en_US.utf8
ENV PG_MAJOR=14
ENV PG_VERSION=14.12-1.pgdg120+1
ENV PGDATA=/var/lib/postgresql/data

# Exposition du port
EXPOSE 5432

# Volume de données
VOLUME /var/lib/postgresql/data

# Configuration spécifique au conteneur
CMD ["postgres"]
