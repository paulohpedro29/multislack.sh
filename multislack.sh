#!/bin/bash
set -e
#==============HEADER====================================================|
#AUTOR
# Paulo Henrique - paulohpedro@gmail.com
#
# Script de instala��o do multilib em qualquer vers�o do Slackware 64Bits.
# OBS: Este script n�o instala a vers�o current
#========================================================================|

#===============VARS
SLACKVER='14.2'

#==============START
mkdir multilib && cd multilib

# Download
lftp -c "open http://bear.alienbase.nl/mirrors/people/alien/multilib/ ; mirror -c -e ${SLACKVER}"
cd ${SLACKVER}

upgradepkg --reinstall --install-new *.t?z && \
upgradepkg --install-new slackware64-compat32/*-compat32/*.t?z

# Enviando para Blacklist
cat >> /etc/slackpkg/blacklist <<EOF
[0-9]+alien
[0-9]+compat32
EOF