#!/bin/bash
set -e

# Validation des pré-requis
if [ -z "$JENKINS_URL" ]; then
  echo "ERREUR: La variable JENKINS_URL est requise."
  exit 1
fi

if [ -z "$JENKINS_USER" ]; then
  echo "ERREUR: La variable JENKINS_USER est requise."
  exit 1
fi

# TODO : prevoir switch vers fichier pour le token
# Le token doit être injecté via un Docker Secret pour éviter l'exposition en plaintext
#TOKEN_FILE="/run/secrets/jenkins_agent_token"

#if [ ! -f "$TOKEN_FILE" ]; then
#  echo "ERREUR: Le fichier de secret $TOKEN_FILE est introuvable."
#  exit 1
#fi

if [ -z "$JENKINS_TOKEN" ]; then
  echo "ERREUR: La variable JENKINS_TOKEN est requise."
  exit 1
fi


# Nom de l'agent (par défaut dynamique via le hostname du conteneur)
AGENT_NAME=${JENKINS_AGENT_NAME:-"agent-$(hostname)"}
# Labels par défaut
AGENT_LABELS=${JENKINS_AGENT_LABELS:-"docker-agent swarm"}

echo "Démarrage de l'agent Swarm: $AGENT_NAME vers $JENKINS_URL..."

# Lancement du client Swarm Java
# -fsroot : Définit le répertoire de travail
# -passwordFile : Lit le token d'API directement depuis le secret mount
exec java -jar /usr/share/jenkins/swarm-client.jar \
  -url "$JENKINS_URL" \
  -name "$AGENT_NAME" \
  -username "$JENKINS_USER" \
  -password "$JENKINS_TOKEN" \
  -fsroot "/tmp/workspace" \
  -labels "$AGENT_LABELS" \
  -mode exclusive \
  -retry 5

  #  -passwordFile "$TOKEN_FILE" \