# run this script to setup local .vim folder
# skip if pathogen has already been installed
# force update with --update

if [ ! -f "$HOME/.vim/autoload/pathogen.vim" ] || [ "$1" == "--update" ]; then
  echo Updating .vim files.
  mkdir -p ~/.vim/autoload ~/.vim/bundle
  curl -SsLo ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
  SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  exec ${SCRIPT_DIR}/update_bundles.rb
fi
