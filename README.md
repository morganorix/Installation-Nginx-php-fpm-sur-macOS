# Installation de Nginx, de Php-fpm et Sql sur macOSx

## Sommaire
* [Introduction](#introduction)
* [Préparation](#préparation)
  * [Oh my zsh](#oh-my-zsh)
  * [Alias bash profile](#alias-bash-profile)
* [Installation homebrew](#installation-homebrew)
* [Installation php-fpm](#installation-php-fpm)
* [Installation nginx](#installation-nginx)
  * [Configuration nginx](#configuration-nginx)
    * [Dossier de travail](#dossier-de-travail)
    * [nginx.conf](#nginx.conf)
    * [Création des dossiers de conf](#création-des-dossiers-de-conf)
    * [SSL](#ssl)
* [Configuration fichier hosts](#configuration-fichier-hosts)
* [Installation serveur sql](#installation-serveur-sql)

## Introduction
Par défaut macOSx à un serveur non actif Apache pré-installé ainsi qu'un serveur php (il n'y a pas de serveur sql de pré-installé). Si vous êtes comme moi, je préfère de loin un serveur Nginx. De plus les versions sont pas forcément à jour sur votre mac. Autant de raisons qui font que ne nous voulons pas les activer.<br />
Grâce à **Homebrew** nous pouvons installer un serveur **Nginx**, serveur **Php-fpm** et serveur **Sql** à jour et facile à maintenir.

## Préparation
Je ne sais pas pour vous, de mon côté j'aime travailler dans un minimum de confort et pouvoir entrer des commandes facile et personnalisées avec un terminal un peu custom.<br />

### Oh my zsh
Oh-my-zsh est un plugin pour votre terminal qui va vour permettre de mettre un peu de couleurs et de formes dans votre temrinal. ouff
Customisation du terminal sur ce lien : [https://ohmyz.sh/](https://ohmyz.sh/)<br />
Ou pour le plus fénéants :
```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Alias bash profile
Tout d'abord il faut se rendre dans votre répertoire utilisateur. J'entends par là votre dossier commençant par **~** appelé tilde ou encore la nouille. :stuck_out_tongue:

```
cd ~/
```

Ensuite vous allez créer un fichier de profil pour personnaliser votre programme shell. ET entre autre créer des alias ou commandes raccourcis.
```
nano .bash_profile
```

Puis ajoutez ces 2 lignes suivantes puis **ctrl + x** pour quitter et **Y** ou **O** pour enregistrer avant de quitter :
```
# Raccourci pour configurer nginx
alias ..nginx="cd /usr/local/etc/nginx/"
```

Voici une liste de mes [alias](https://github.com/geekoun/Installation-Nginx-php-fpm-sur-macOS/blob/master/.bash_profile) pour le plus curieux :stuck_out_tongue:<br />

Rassure-vous je ferai un bel effort dans ce tutoriel pour ne pas utiliser mes raccourci afin que vous ne soyez pas trop perdu. :+1:

## Installation homebrew
Rendez-vous sur [https://brew.sh/index_fr](https://brew.sh/index_fr).<br />
Ou pour les fénéants ouvrez votre terminal et coller cette commande :
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install wget
```
Pourquoi WGET... ? Je ne fais que suivre le tutoriel officiel d'installation de homebrew. :relaxed: <br />
**A savoir :** Si vous êtes plus à l'aise avec le terminal, les installations de Nginx ou Php se retrouverons par défault dans le répertoire : `/usr/local/etc/` :kissing_heart:

## Installation php-fpm
Maintenant que nous avons installé homebrew, entrons dans le vif du sujet.
J'ai besoin d'installer une version la plus à jour possible. <br />
> Normal !! Me diriez-vous.

Ok ! Très bien ! comment trouve-t-on cette version à jour. Si ca se trouve il en existe plusieurs versions plus ou moins récentes. Comment les connaître ?

Avec cette commande, vous trouverez les réponses à vos questions :
```
brew --help
```

Cela affiche quelque chose du genre...
```
Example usage:
  brew search [TEXT|/REGEX/]
  brew info [FORMULA...]
  brew install FORMULA...
  brew update
  brew upgrade [FORMULA...]
  brew uninstall FORMULA...
  brew list [FORMULA...]

Troubleshooting:
  brew config
  brew doctor
  brew install --verbose --debug FORMULA

Contributing:
  brew create [URL [--no-fetch]]
  brew edit [FORMULA...]

Further help:
  brew commands
  brew help [COMMAND]
  man brew
  https://docs.brew.sh
```

Et voilà que nous trouvons la command search qui est très utile. Hop testons là !
```
brew search php
```
Vous y verrez afficher en résultat une liste de ce type :
```
==> Formulae
brew-php-switcher          php-cs-fixer               phplint                phpstan
php                        php@7.2                    phpmd                  phpunit
php-code-sniffer           php@7.3                    phpmyadmin
```
Nous pouvons voir que la version la plus récente est la version **php@7.3**. Il nous reste plus qu'à l'installer.<br />
Conseils : Même si php-fpm n'est pas affiché distinctement la version de php@7.3 est bien une **fpm**.
```
brew install php@7.3
```

Félicitation votre serveur **Php** est maintenant installé et à jour. :relaxed:

## Installation nginx
Attaquons-nous à Nginx. Pas besoin de faire de recherche car il n'y a qu'une seule version maintenue à jour.<br />
Copiez la commande suivante :
```
brew install nginx
```
Félicitation votre serveur **Nginx** est maintenant installé et à jour. :relaxed:

### Configuration nginx
Voici la partie la plus délicate. Rien de bien compliqué en revanche aller trop vite peut créer des problèmes. Donc soyez encore plus sérieux dans cette partie.

> Vous avez la pression hein ! :scream: :sob:

J'aime reprendre les bests practice de linux. Et comme par hasard sur macOSx c'est presque pareil...enfin presque...

#### Dossier de travail
Tout d'abord nous allons créer un répertoire de travail pour le développement. Tout vos sites internets seront dans ce répertoire et facile à trouver.

Vous vous souvenez qu'en début de turoriel, j'ai expliqué que macOSx possède un serveur apache pré-installé... et donc il possède un répertoire pour le développement... très bien caché. Tellement que c'est un dossier caché... donc pas facile à trouver pour un néophyte.<br />
Voici ou il se cache :
```
cd /usr/local/var/www/
```
C'est bien mais pas top ! <br />

> Comment y remédier ?

Nous allons créer un dossier (répertoire) dans votre répertoire utilisateur. (la nouille)
```
cd ~/
mkdir -p Sites
```

Puis créer un fichier php dans ce dossier :
```
cd Sites/
nano index.php
```
Ajoutez cette ligne suivante puis **ctrl + x** pour quitter et **Y** ou **O** pour enregistrer avant de quitter :
```
<?php phpinfo(); ?>
```
Voici un aperçu de ce que vous devez avoir avec **Finder**.

![Aperçu Finder](/images/apercu-finder-site.png)

Félicitation votre nouveau répertoire de travail est près. :relaxed:

#### nginx.conf

#### Création des dossiers de conf
#### SSL

Rendez-vous dans :
```
```

## Configuration fichier hosts

## Installation serveur sql
