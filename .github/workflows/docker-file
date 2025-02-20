# 1️⃣ Utiliser une image Node.js légère
FROM node:18-alpine 

# 2️⃣ Définir le répertoire de travail dans le conteneur
WORKDIR /app

# 3️⃣ Copier les fichiers package.json et package-lock.json (si présents)
COPY package.json package-lock.json ./

# 4️⃣ Installer les dépendances
RUN npm install --legacy-peer-deps

# 5️⃣ Copier le reste des fichiers du projet
COPY . .

# 6️⃣ Exposer le port sur lequel l’application tourne
EXPOSE 3000

# 7️⃣ Démarrer l’application
CMD ["npm", "start"]
