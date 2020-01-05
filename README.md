# Installation de Nginx, de Php-fpm et Sql sur macOSx

## Sommaire
* [Introduction](#introduction)
* [Installation homebrew](#installation-homebrew)
* [Installation php-fpm](#installation-php-fpm)
* [Installation nginx](#installation-nginx)
  * [Aliases bash profile](#aliases-bash-profile)
  * [Configuration nginx](#configuration-nginx)
* [Configuration fichier hosts](#configuration-fichier-hosts)
* [Installation serveur sql](#installation-serveur-sql)

## Introduction
Par défaut macOSx à un serveur non actif Apache pré-installé ainsi qu'un serveur php (il n'y a pas de serveur sql de pré-installé). Si vous êtes comme moi, je préfère de loin un serveur Nginx. De plus les versions sont pas forcément à jour sur votre mac. Autant de raisons qui font que ne nous voulons pas les activer.<br />
Grâce à **Homebrew** nous pouvons installer un serveur **Nginx**, serveur **Php-fpm** et serveur **Sql** à jour et facile à maintenir.

## Installation homebrew
Rendez-vous sur [https://brew.sh/index_fr](https://brew.sh/index_fr).<br />
Ou pour les fénéants ouvrez votre terminal et coller cette commande :
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install wget
```
Pourquoi WGET... ? Je ne fais que suivre le tutoriel officiel d'installation de homebrew. :relaxed: <br />
**A savoir :** Si vous êtes plus à l'aise avec le terminal, les installations de Nginx ou Php se retrouverons par défault dans le répertoire : `/usr/local/` :kissing_heart:

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
Félicitation votre serveur **Nginx** est maintenant installé et à jour.

### Alias bash profile
Je ne sais pas pour vous, de mon côté j'aime pouvoir entrer des commandes facile et personnalisées.<br />
Tout d'abord il faut se rendre dans votre répertoire de travail. J'entends par là votre dossier commençant par **~** appelé tild ou encore la nouille. :stuck_out_tongue:

```
cd ~/
```

Ensuite vous allez créer un fichier de profil pour personnaliser votre programme shell. ET entre autre créer des alias ou commandes raccourcis.
```
nano .bash_profile
```
Et ajoutez ces 2 lignes suivantes :
```
1.  # Raccourci pour configurer nginx
2. alias ..nginx="cd /usr/local/etc/nginx/"
3. 






^G Aide        ^O Écrire      ^W Chercher    ^K Couper      ^J Justifier   ^C Pos. cur.   M-U Annuler
^X Quitter     ^R Lire fich.  ^\ Remplacer   ^U Coller      ^T Orthograp.  ^_ Aller ligne M-E Refaire
```

### Configuration nginx
Rendez-vous dans :
```
```

## Configuration fichier hosts

## Installation serveur sql
