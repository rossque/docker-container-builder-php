#!/bin/bash

CWD=$PWD
DOCKERFILE=Dockerfile

printf "\nWhat version of PHP would you like to build?\n"
PS3='Enter a number between [1-4]: '
options=("7.4" "7.3" "7.2" "7.1")
select opt in "${options[@]}"
do
    case $opt in
        "7.4")
            PHP=php:7.4-fpm
            PHP_NAME=php-7.4
            break
            ;;
        "7.3")
            PHP=php:7.3-fpm
            PHP_NAME=php-7.3
            break
            ;;
        "7.2")
            PHP=php:7.2-fpm
            PHP_NAME=php-7.2
            break
            ;;
        "7.1")
            PHP=php:7.1-fpm
            PHP_NAME=php-7.1
            DOCKERFILE=php-7.1/Dockerfile
            break
            ;;
        *) ;;
    esac
done

printf "\nCreating environment variables ...\n"

rm -rf $CWD/.env
cat > $CWD/.env << EOF
PHP_IMAGE=$PHP
PHP_NAME=$PHP_NAME
DOCKERFILE=$DOCKERFILE
EOF

printf "\nBuilding containers ...\n"
cd $CWD && docker-compose build
printf "...\e[92m done \e[39m\n"

# End script
exit 1
