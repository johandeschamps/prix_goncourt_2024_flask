# Prix Goncourt 2024 Flask with API
Ce programme en mode console permet une gestion de prix littéraire.
Il affiche les livres sélectionnés avec leurs informations détaillées, permet au président du jury de gérer les sélections et les votes, et permet aux membres du jury de voter pour les sélections.

* Installer Python 3 : [Téléchargement Python 3](https://www.python.org/downloads/)
* Installer git : [Téléchargement Git](https://git-scm.com/book/fr/v2/D%C3%A9marrage-rapide-Installation-de-Git)

## Installation

### 1. Télécharger le projet sur votre répertoire local : 
```
git clone https://github.com/johandeschamps/prix_goncourt_2024_flask.git
```
### 2. Mettre en place un environnement virtuel :
* Créer l'environnement virtuel: `python -m venv venv`
* Activer l'environnement virtuel :
    * Windows : `venv\Scripts\activate.bat`
    * Unix/MacOS : `source venv/bin/activate`
    
### 3. Installer les dépendances du projet
```
pip install -r requirements.txt
```
### 4. Importer la base de donnée dans PhpMyAdmin

Nom du fichier : 127_0_0_1.sql

## Démarrage
* Lancer le serveur à l'aide de la commande suivante : 
`python livres.py runserver`

