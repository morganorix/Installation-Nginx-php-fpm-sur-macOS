## ALIAS ##
# Formatage de peripherique externe en journaliere
alias format="diskutil eraseDisk JHFS+"

# Copie ssh keygen sur un serveur distant pour une connexion sans mdp
alias ssh-copy="ssh-copy-id -i ~/.ssh/id_rsa"

# Raccourci cd
alias ..~="cd ~/"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ..Sites="cd ~/Sites/"
alias ..nginx="cd /usr/local/etc/nginx/"

#modification du fichier hosts
alias hosts="nano /etc/hosts"

# lister les repertoire avec des couleurs
alias ls="ls -G"

# En prévention d'un rm pas intentionnel... demander une confirmation
alias rm="rm -i"

# Raccourci pour nginx
alias ..nginxlogs="cd /usr/local/etc/nginx/logs/"
alias nginxerror="tail -f /usr/local/var/log/nginx/error.log"
alias nginxlogs="tail -f /usr/local/etc/nginx/logs/error.log"

# Raccourci mysql
alias mysql="/usr/local/mysql/bin/mysql"
alias msqladmin="/usr/local/mysql/bin/mysqladmin"

# Flush DNS cache
alias dnsflush="sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder"

# Voir les dossiers et fichiers caches
alias foldernocache="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder && open ."
alias foldercache="defaults write com.apple.finder AppleShowAllFiles -boolfalse && killall Finder && open ."

## AUTRE ##
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/opt/apr-util/bin:$PATH"
export PATH="/usr/local/opt/openldap/bin:$PATH"
export PATH="/usr/local/opt/openldap/sbin:$PATH"
export PATH="/usr/local/opt/curl-openssl/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="/usr/local/opt/php@7.3/bin:$PATH"
export PATH="/usr/local/opt/php@7.3/sbin:$PATH"
export PATH="/usr/local/opt/apr/bin:$PATH"
export PATH="/usr/local/opt/apr-util/bin:$PATH"
export PATH="/usr/local/opt/openldap/bin:$PATH"
export PATH="/usr/local/opt/openldap/sbin:$PATH"
export PATH="/usr/local/opt/curl-openssl/bin:$PATH"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH" 
