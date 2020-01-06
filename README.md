# Installation de Nginx, de Php-fpm et Mysql sur macOSx

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
* [Installation serveur Mysql](#installation-serveur-mysql)
  * [Installation Mysql](#installation-mysql)
  * [Sequel Pro](#sequel-pro)
* [Aller plus loin](#aller-plus-loin)
  * [Configuration nginx avec nom de domaine](#configuration-nginx-avec-nom-de-domaine)
  * [Configuration fichier hosts](#configuration-fichier-hosts)
  * [SSL](#ssl)

## Introduction
Par défaut macOSx à un serveur non actif Apache pré-installé ainsi qu'un serveur php (il n'y a pas de serveur sql de pré-installé). Si vous êtes comme moi, je préfère de loin un serveur Nginx. De plus les versions sont pas forcément à jour sur votre mac. Autant de raisons qui font que ne nous voulons pas les activer.<br />
Grâce à **Homebrew** nous pouvons installer un serveur **Nginx**, serveur **Php-fpm** et serveur **Mysql** à jour et facile à maintenir.

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

Voici une liste de mes [alias](https://github.com/geekoun/Installation-Nginx-php-fpm-sur-macOS/blob/master/.bash_profile) pour les plus curieux :stuck_out_tongue:<br />

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
Nous pouvons voir que la version la plus récente est la version **php@7.3**. Il nous reste plus qu'à l'installer.<br /><br />
**Bon à savoir** : Même si php-fpm n'est pas affiché distinctement la version de php@7.3 est bien une **fpm**.
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

Félicitation votre nouveau répertoire de déveleppement est près. :relaxed:

#### nginx.conf
Maintenant que nous avons configuré notre nouveau répertoire de développement, continuons à configurer Nginx. Nous allons dupliquer le fichier nginx.conf pour en faire une sauvergarde.
```
cd /usr/local/etc/nginx/
mv nginx.conf nginx.conf.bak
nano nginx.conf
```
Insérez les lignes du fichiers [nginx.conf](nginx.conf) ou copiez le fichier directement dans le répertoire **nginx/**, c'est comme vous le souhaitez.

```
user                    <user> staff;
worker_processes        1;

error_log               /usr/local/etc/nginx/logs/error.log;
# error_log             /usr/local/etc/nginx/logs/error.log  notice;
# error_log             /usr/local/etc/nginx/logs/error.log  info;

events {
    worker_connections  1024;
}

http {
    include             mime.types;
    default_type        application/octet-stream;
    sendfile            on;
    keepalive_timeout   65;
    gzip                on;
    include             sites-enabled/*.conf;
}
```

#### Création des dossiers de conf
Je n'aime pas avoir un fichier extrêment long à lire. Je préfère en avoir plusieurs, classés dans des dossiers et reliés entre eux.
Si vous avez été attentif la dernière ligne du fichier nginx.conf est un **include** et il inclus dans un répertoire qui n'existe pas. Nous allons tous créer maintenant. :punch:

```
cd /usr/local/etc/nginx/
rm -r servers/
mkdir -p sites-{enabled,available}
```
**mkdir** signifie créer un dossier/répertoire. La commande ci-dessus permet de créer 2 dossiers **sites-enabled** et **sites-available**.
Nou allons créer nos autres fichiers de conf dans le dossier **sites-available** et nous allons créer des liens dans le dossier **sites-enabled** à partir du contenu du dossier **sites-available**. <br />

> Euhhh tout à fait... mais pourquoi ce compliqué la vie comme ça ?

La raison est simple ! Nous allons faire un système de backup des fichiers de conf. Les fichiers originaux seront dans **sites-available**. Le fichier de lien qui seront lu et exécutés seront dans **sites-enabled**.
> Oui ok je vois mieux. Mais je ne sais toujours pas ce que c'est un lien ?

On peut dire que c'est une sorte de raccourci vers un autre fichier. Si nous devions le comparer à la vie humaine, imaginez une maison avec des portes. L'une est la porte d'entrée, une autre mène vers un sous-sol et une porte qui ne semble mené nul part... Maitenant vous souhaitez allez à l'étage. Pas besoin de monter les escalier pour y aller grâce au lien votre porte bizarre au rez-de-chaussé donnera un accès direct à l'étage. Pour le geek c'est un peu comme le jeu **portal**.<br />

La preuve par l'exemple sera plus pertinente.

```
cd sites-available
nano default.conf
```
Insérez les lignes du fichiers [default.conf](sites-available/default.conf) ou copiez le fichier directement dans le répertoire **sites-available/**, c'est comme vous le souhaitez.
```
server {
    listen       80;
    server_name  localhost;
    root         /Users/<user>/Sites/;
    index        index.php index.html index.htm;

    location ~ \.php {
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
        fastcgi_pass 127.0.0.1:9000;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_buffers 16 16k;
        fastcgi_buffer_size 32k;
    }
}

```
Vous voyez la ligne ou il y a écrit **root** ? Eh ben cette ligne sert à désigner le nouveau répertoire de travail que nous avons créer au tout début du tutoriel.<br />

Nous allons enfin créer le lien dans le dossier **sites-enabled/** :
```
ln -s default.conf ../sites-enabled
```
Vous devriez voir ceci dans votre dossier **sites-enabled/** :
```
cd ../sites-enabled
ls -la
lrwxr-xr-x   1 <user>  admin   31  5 jan 12:40 default.conf -> ../sites-available/default.conf
```
Vous voyez cette petite flèche. Elle indique que vous avez créer un lien. <br /><br />
Nous y sommes presque pour une configuration de base. Il va falloir relancer **Nginx** pour appliquer les nouveaux paramètres. <br />
Comme ceci :
```
brew services restart nginx
```
Vour pouvez dès à présent lancer votre navigateur préféré safari, Chrome, Firefox, etc. et écrire dans votre barre d'adresse **[http://localhost](http://localhost)** :relaxed:

![Aperçu localhost](/images/localhost.png)

**Bon à savoir** : Pensez à vider le cache de votre navigateur avant. Et si ca ne fonctionne pas redémarrez votre mac. Parfois il en a besoin !

## Installation serveur Mysql
Je ne suis pas pour un phpmyadmin. Ca demande trop de ressources inutiles juste pour avoir accès à une base de donnée.
Pour ma part j'utilise un serveur **Mysql** et **Sequel Pro** pour y accèder.

### Installation Mysql
Je le télécharge depuis le site officiel sur ce lien [https://dev.mysql.com/downloads/mysql/](https://dev.mysql.com/downloads/mysql/). Prenez la version **.dmg** se sera plus simple.
Suivez les instructions d'installation. :fist:<br /><br />

**Bon à savoir** : Suivre les instruction sur ce lien [https://dev.mysql.com/doc/mysql-osx-excerpt/5.7/en/preface.html](https://dev.mysql.com/doc/mysql-osx-excerpt/5.7/en/preface.html)<br /><br />

Voici ce que vous devrez voir après l'installation.
![Aperçu préférence système](/images/apercu-preference-systeme.png)
![Mysql](/images/mysql.png)

### Sequel Pro


## Aller plus loin
### Configuration nginx avec nom de domaine
### Configuration fichier hosts
### SSL

Rendez-vous dans :
```
```
