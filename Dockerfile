# Utiliser l'image Debian comme base
FROM debian:latest

# Installer les paquets nécessaires
RUN apt-get update && apt-get install -y \
    curl \
    nginx \
    && apt-get clean

# Configurer Nginx pour écouter sur le port 8080 (effectué en tant que root)
RUN sed -i 's/listen 80;/listen 8080;/g' /etc/nginx/sites-available/default

# Copier le fichier HTML dans le répertoire de Nginx
COPY index.html /var/www/html/index.html

# Ajouter un utilisateur non-root
RUN useradd -m webuser

# Changer les permissions des fichiers nécessaires pour permettre à l'utilisateur non-root de les utiliser
RUN chown -R webuser:webuser /var/www/html /var/log/nginx /var/lib/nginx

# Créer le répertoire /var/run/nginx et ajuster ses permissions
RUN mkdir -p /var/run/nginx && chown -R webuser:webuser /var/run/nginx

# Changer l'utilisateur actif
USER webuser

# Exposer le port 8080
EXPOSE 8080

# Commande pour lancer Nginx
CMD ["nginx", "-g", "daemon off;"]
