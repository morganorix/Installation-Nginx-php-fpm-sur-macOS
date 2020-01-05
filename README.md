# Installation-Nginx-php-fpm-sur-macOS

## Sommaire
* [Installation homebrew](#installation-homebrew)
* [Installation php-fpm](#installation-php-fpm)
* [Installation nginx](#installation-nginx)
  * [Configuration nginx](#configuration-nginx)
* [Configuration fichier hosts](#configuration-fichier-hosts)
* [Bonus](#bonus)
  * [Aliases bash profile](#aliases-bash-profile)

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
brew-php-switcher          php-cs-fixer               phplint                phpstan
php                        php@7.2                    phpmd                  phpunit
php-code-sniffer           php@7.3                    phpmyadmin
```
Nous pouvons voir que la version la plus récente est la version php@7.3. Il nous reste plus qu'à l'installer.<br />
Conseils : Même si php-fpm n'est pas affiché distinctement la version de php@7.3 est bien une fpm.
```
brew install php@7.3
```
## Installation nginx

### Configuration nginx

## Configuration fichier hosts

## Bonus

### Aliases bash profile
