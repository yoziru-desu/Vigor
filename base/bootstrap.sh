#! /bin/bash
set -e

basepath=/root/.vim

# Prepare step
apt-get update
apt-get install -y \
  git \
  locales \
  build-essential \
  curl \
  vim-nox

localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
LANG=en_US.UTF-8

mkdir -p $basepath/bundle $basepath/autoload

# Setup step
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Helpers #####################################################################

git clone https://github.com/Shougo/vimproc.vim $basepath/bundle/vimproc
cd $basepath/bundle/vimproc
make

git clone https://github.com/Shougo/unite.vim $basepath/bundle/unite
# git clone https://github.com/Shougo/vimshell.vim $basepath/bundle/vimshell
git clone https://github.com/tpope/vim-repeat $basepath/bundle/vim-repeat
git clone https://github.com/tpope/vim-commentary $basepath/bundle/vim-commentary
git clone https://github.com/tpope/vim-surround $basepath/bundle/vim-surround
git clone https://github.com/airblade/vim-gitgutter $basepath/bundle/vim-gitgutter
git clone https://github.com/vim-scripts/matchit.zip $basepath/bundle/matchit
git clone https://github.com/Raimondi/delimitMate $basepath/bundle/delimitMate
git clone https://github.com/vim-airline/vim-airline $basepath/bundle/vim-airline
git clone https://github.com/editorconfig/editorconfig-vim $basepath/bundle/editorconfig-vim
git clone https://github.com/kshenoy/vim-signature $basepath/bundle/vim-signature

# Colors ######################################################################

git clone https://github.com/arnau/teaspoon.vim $basepath/bundle/teaspoon
git clone https://github.com/arnau/stonespoon.vim $basepath/bundle/stonespoon

# Cleanup step
apt-get remove -y \
  curl \
  build-essential
apt-get autoremove -y
rm -rf /var/lib/apt/lists/*

cd $basepath
find . -name .git | xargs rm -rf
