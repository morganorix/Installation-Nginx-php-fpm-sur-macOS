# Installation-Nginx-php-fpm-sur-macOS

## Sommaire
* Introduction
* [Installation homebrew](#installation-homebrew)
* [Installation php-fpm](#installation-php-fpm)
* [Installation nginx](#installation-nginx)
  * [Configuration nginx](#configuration-nginx)
* [Configuration fichier hosts](#configuration-fichier-hosts)
* [Installation serveur sql](#installation-serveur-sql)
* [Bonus](#bonus)
  * [Aliases bash profile](#aliases-bash-profile)

## Introduction
Par défaut macOsx à un serveur non actif Apache pré-installé ainsi qu'un serveur php (il n'y a pas de serveur sql de pré-installé). Si vous êtes comme moi, je préfère de loin un serveur Nginx. De plus les versions sont pas forcément à jour sur votre mac. Autant de raisons qui font que ne nous voulons pas les activer.<br />
Grâce à **Homebrew** nous pouvons installer un serveur **Nginx**, serveur **php-fpm** et serveur **sql** à jour et facile à maintenir.

## Installation homebrew
Rendez-vous sur [https://brew.sh/index_fr](https://brew.sh/index_fr).<br />
Ou pour les fénéants ouvrez votre terminal et coller cette commande :
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install wget
```
Pourquoi WGET... ? Je ne fais que suivre le tutoriel officiel d'installation de homebrew. :relaxed:

## Installation php-fpm
Maintenant que nous avons installé homebrew, entrons dans le vif du sujet.
```
brew search php
```
Vous verrez une liste de ce genre :
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

Félicitation votre php est maintenant installé et à jour. :relaxed:

## Installation nginx
Attaquons-nous à nginx. Copiez commande suivante :
```
brew install nginx
```

### Configuration nginx

## Configuration fichier hosts

## Installation serveur sql

## Bonus

### Aliases bash profile
