# Dockerfiles Repository

Ce répertoire contient une collection de Dockerfiles organisés par catégorie et fonction. Chaque Dockerfile produit une image Docker prête à être utilisée pour un objectif spécifique.

## 📋 Structure globale

```
dockerfile/
├── components/          # Composants métier (repositories, frameworks)
├── osgi/               # Conteneurs OSGi (Felix, Karaf, ServiceMix)
├── tools/              # Outils de développement et automation
├── workbench/          # Environnements de travail interactifs
└── README.md           # Ce fichier
```

---

## 🔧 COMPONENTS

Conteneurs d'applications et frameworks métier.

### **Artifactory OSS**
- **Chemin** : `components/artifactory-oss/`
- **Image de base** : OpenJDK 15
- **Usage** : Gestionnaire de dépôts d'artefacts Maven/Gradle
- **Ports** : 8081 (HTTP)
- **Description** : Déploiement JFrog Artifactory Open Source pour gérer les dépôts de paquets Java
- **Build** : Requires unzipped `artifactory-oss-7.125.8` in build context
- **Entrée** : Démarre le service Artifactory via `artifactory.sh`

### **Nexus OSS**
- **Chemin** : `components/nexus-oss/`
- **Image de base** : OpenJDK 8 (Buster)
- **Usage** : Repository manager pour Maven, npm, NuGet, etc.
- **Ports** : 8081 (HTTP)
- **Description** : Sonatype Nexus 3 pour la gestion centralisée des dépôts
- **Build** : Requires unzipped `nexus-3.87.1-01` in build context
- **Notes** : Version mature, largement utilisée en entreprise

### **HTTPD OpenID Connect (mod_auth_openidc)**
- **Chemin** : `components/httpd-oic/`
- **Image de base** : Alpine Linux
- **Usage** : Proxy Apache HTTP avec authentification OpenID Connect
- **Description** : Compile `mod_auth_openidc v2.4.4.1` pour Apache, utile pour l'authentification centralisée via OAuth2/OIDC
- **Notes** : Complexe à compiler, préférer image pré-buildée si possible

### **Python Flask**
- **Chemin** : `components/python-flask/`
- **Image de base** : Ubuntu 26.04
- **Usage** : Framework web Python minimaliste
- **Description** : Environnement Python 3 avec Flask et Flask-CORS pour API REST simples
- **Dépendances** : Flask, Flask-CORS
- **Commande par défaut** : Shell Python
- **Notes** : Léger, idéal pour des microservices rapides

### **Java Micro-Launcher**
- **Chemin** : `components/java-micro-launcher/`
- **Image de base** : OpenJDK 15
- **Usage** : Lanceur générique pour applications Java (JAR)
- **Description** : Conteneur template pour exécuter n'importe quel JAR avec variables `JAVA_OPTS` et `JAR_NAME`
- **Volumes** : `/app` (dossier pour stocker les JARs)
- **Usage typique** :
  ```bash
  docker run -e JAR_NAME=myapp.jar -e JAVA_OPTS="-Xmx512m" java-micro-launcher
  ```

### **Python ML (Machine Learning)**
- **Chemin** : `components/python-ml/`
- **Image de base** : Non spécifiée (à vérifier)
- **Usage** : Python avec bibliothèques ML (scikit-learn, pandas, etc.)
- **Description** : Stack Python pour data science et machine learning

---

## 🏛️ OSGI

Conteneurs pour frameworks OSGi (composants modulaires Java).

### **Felix Framework**
- **Chemin** : `osgi/felix-framework/`
- **Image de base** : OpenJDK 8 (Alpine)
- **Version** : Apache Felix 7.0.5
- **Usage** : Conteneur OSGi minimal basé sur Felix
- **Description** : Framework de modularité Java légèrement plus simple que Karaf
- **Source** : Mirror depuis `collonvillethomas.freeboxos.fr` pour reproductibilité
- **Commande** : `java -jar bin/felix.jar`

### **Karaf**
- **Chemin** : `osgi/karaf/`
- **Image de base** : OpenJDK 8 (Alpine)
- **Version** : Apache Karaf 4.4.9
- **Usage** : Framework OSGi complet avec CLI, console interactive
- **Description** : Karaf est Felix + outils d'administration (console, deployer, etc.)
- **Source** : Mirror depuis `collonvillethomas.freeboxos.fr`
- **Commande** : `./karaf` (lance console interactive)

### **ServiceMix**
- **Chemin** : `osgi/servicemix/`
- **Image de base** : OpenJDK 8 (Alpine)
- **Version** : Apache ServiceMix 7.0.1
- **Usage** : ESB (Enterprise Service Bus) basé sur Karaf
- **Description** : ServiceMix = Karaf + composants ESB (NMR, routing, transformations)
- **Source** : Mirror depuis `collonvillethomas.freeboxos.fr`
- **Commande** : `./servicemix` (lance le serveur ESB)

### **Add-Bundle-* (Felix, Karaf, ServiceMix)**
- **Chemins** : `osgi/add-bundle-felix/`, `osgi/add-bundle-karaf/`, `osgi/add-bundle-servicemix/`
- **Usage** : Templates pour ajouter des bundles personnalisés
- **Description** : Permet d'étendre les conteneurs OSGi avec des bundles métier customisés
- **Notes** : À utiliser comme base pour créer des images dérivées

---

## 🛠️ TOOLS

Outils de développement, automation et support.

### **Ansible Launcher**
- **Chemin** : `tools/ansible-launcher/`
- **Image de base** : Ubuntu 26.04
- **Usage** : Moteur d'automation et orchestration infrastructure
- **Dépendances** : 
  - Ansible
  - Flask (serveur web basique)
  - MongoDB drivers (pymongo 3.7.2)
  - Requests, lxml
- **Volumes** : `/work_dir` (playbooks et inventaires)
- **Description** : Permet de lancer des playbooks Ansible et exposer des APIs Flask
- **Notes** : Utile pour CI/CD, configuration management, déploiement infra

### **Maven Launcher**
- **Chemin** : `tools/maven-launcher/`
- **Image de base** : Maven 3.6.1 (JDK 11)
- **Usage** : Build Java avec Maven
- **Volumes** : 
  - `/maven_work_dir` (sources)
  - `/repolocal` (cache local)
- **Commande par défaut** : `mvn clean install -X -s ./settings.xml`
- **Description** : Conteneur type pour builds Maven reproductibles
- **Notes** : Mount votre `pom.xml` et `settings.xml` locaux

### **GNU Smalltalk**
- **Chemin** : `tools/gnu-smalltalk/`
- **Image de base** : Ubuntu 22.04
- **Usage** : Environnement Smalltalk
- **Description** : Pour développement et exécution de code Smalltalk
- **Commande** : Shell Smalltalk
- **Status** : ⚠️ Peu maintenu, usage spécialisé

### **Robot Framework** (Robotics Testing)
- **Chemin** : `tools/robotframework/`
- **Image de base** : À vérifier
- **Usage** : Framework de test automation
- **Description** : Pour tests automatisés (web, API, desktop)
- **Dépendances** : SeleniumLibrary, DatabaseLibrary

### **Robot Framework Python 2** ❌
- **Chemin** : `tools/rf-py2/` 
- **Status** : **OBSOLETE** - Python 2 EOL
- **Voir** : `/tools/rf-py2/README.md` pour détails

### **Jenkins Inbound Docker Agent**
- **Chemin** : `tools/jenkins-inbound-docker-agent/`
- **Image de base** : À vérifier
- **Usage** : Agent Jenkins pour pipelines (JNLP)
- **Description** : Se connecte à un serveur Jenkins pour exécuter des jobs

---

## 📚 WORKBENCH

Environnements interactifs et intégrés pour développement.

### **Shell-in-the-Box**
- **Chemin** : `workbench/shell-in-the-box/`
- **Usage** : Shell web-based (terminal dans navigateur)
- **Description** : Accès au shell Linux via interface web
- **Ports** : Généralement 4200
- **Notes** : Base utilisée par d'autres workbench

### **Bastion**
- **Chemin** : `workbench/bastion/`
- **Image de base** : shell-in-the-box:0.1.0
- **Usage** : Jump/proxy host pour administration
- **Description** : Conteneur administratif avec outils :
  - Docker client & compose plugin
  - Kubernetes (`kubectl` 1.34.0)
  - Helm 4.0.4
  - Git, SSH, outils réseau (mtr, traceroute, tcpdump)
- **Ports** : Hérite de shell-in-the-box (shell web)
- **Usage typique** : Point d'accès sécurisé pour administrer l'infra depuis navigateur
- **Notes** : Mirror outils depuis `collonvillethomas.freeboxos.fr`

### **ML Jupyter**
- **Chemin** : `workbench/ml-jupyter/`
- **Image de base** : shell-in-the-box:0.1.0
- **Usage** : Notebook Jupyter pour Machine Learning
- **Dépendances** :
  - Jupyter
  - Pandas
  - scikit-learn
  - Scipy, Matplotlib, Seaborn
  - mpld3 (visualization 3D)
- **Ports** : 8888 (Jupyter)
- **Description** : Environnement complet pour exploration data & ML
- **Notes** : Voir entrypoint script `assets/entrypoint-jup.sh`

### **R Jupyter**
- **Chemin** : `workbench/r-jupyter/`
- **Image de base** : r-base:4.5.2 (R officiel)
- **Usage** : Notebook Jupyter pour statistiques & visualisation avec R
- **Description** : Stack R + Jupyter pour data science avec R
- **Ports** : 8888 (Jupyter)
- **Notes** : Voir entrypoint script `assets/entrypoint-jup.sh`

---

## 🚀 USAGE

### Build local
```bash
cd dockerfile/<category>/<image-name>
docker build -t <name>:<tag> .
```

**Exemples** :
```bash
# Build Bastion
docker build -t bastion:latest dockerfile/workbench/bastion

# Build ML Jupyter
docker build -t ml-jupyter:latest dockerfile/workbench/ml-jupyter

# Build Ansible
docker build -t ansible-launcher:latest dockerfile/tools/ansible-launcher
```

### Run conteneur
```bash
docker run -d --name <container-name> <image>:<tag>
```

**Exemples** :
```bash
# Lancer Jupyter ML avec port exposé
docker run -d -p 8888:8888 --name ml-notebook ml-jupyter:latest

# Lancer Bastion (shell web)
docker run -d -p 4200:4200 --name admin-bastion bastion:latest

# Lancer Karaf OSGi
docker run -d -p 8181:8181 --name osgi-container karaf:latest
```

### Docker Stack (Swarm)
```bash
docker stack deploy -c docker-compose.yml <stack-name> --with-registry-auth
```

Pour ajouter des credentials de registry privée, voir `REGISTRY_CREDENTIALS.md` (à créer).

---

## 🔐 Private Registry

Tous les Dockerfiles utilisent des registries publiques par défaut. Pour utiliser une registry privée :

1. **Sur le manager Docker Swarm** :
   ```bash
   docker login my.registry.com
   docker stack deploy --with-registry-auth -c docker-compose.yml mystack
   ```

2. **Pour un Dockerfile personnalisé**, builder en local :
   ```bash
   docker build -t my.registry.com/image:tag .
   docker push my.registry.com/image:tag
   ```

---

## 📝 Notes & Maintenance

### Miroirs
Plusieurs images téléchargent depuis `https://collonvillethomas.freeboxos.fr/` pour reproductibilité :
- **Apache Karaf 4.4.9**
- **Apache ServiceMix 7.0.1**
- **Apache Felix 7.0.5**
- **kubectl 1.34.0**
- **Helm 4.0.4**

Si ce miroir est indisponible, mettre à jour vers les URLs officielles (Apache, Kubernetes, etc.).

### Obsolescence
- **rf-py2** : Python 2 EOL - Utiliser Python 3 (voir `rf-py2/README.md`)
- Certaines versions très anciennes (OpenJDK 8) : À considérer pour mise à jour

### Best Practices
- ✅ Utiliser des tags spécifiques (pas `latest`)
- ✅ Tester les builds localement avant push
- ✅ Mettre à jour les bases régulièrement (sécurité)
- ✅ Documenter modifications custom (Dockerfile-custom)
- ❌ Ne pas commiter les artefacts volumineux (.zip, .tar.gz) directement

---

## 📖 Resources

- [Docker Documentation](https://docs.docker.com/)
- [Apache Karaf](https://karaf.apache.org/)
- [Apache Felix](https://felix.apache.org/)
- [Jupyter](https://jupyter.org/)
- [Ansible](https://www.ansible.com/)
- [Maven](https://maven.apache.org/)
- [Robot Framework](https://robotframework.org/)

---

**Dernière mise à jour** : 17 décembre 2025  
**Mainteneur** : Collonville Tom  

