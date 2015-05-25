#!/bin/zsh

export UNLINK=true

function backupdotfiles {
  echo "WORKING ON: $1"
  if [[ -a $1 ]]; then
    export DOTLESS=`echo $1 | sed s/.//`
    echo "move $1 to $DOTFILES_DIR_RELATIVE_TO_HOME/$DOTLESS/backup"
    mv $1 $DOTFILES_DIR_RELATIVE_TO_HOME/backup/$DOTLESS
  else
    echo "File does not exist"
  fi

}

function symlinkifne {
    echo "WORKING ON: $1"

    # does it exist
    if [[ -a $1 ]]; then
      echo "  WARNING: $1 already exists."

      # If Unlink is requested
      if [ "$UNLINK" = "true" ]; then
          unlink $1
          echo "  Unlinking $1"

          # create the link
          export DOTLESS=`echo $1 | sed s/.//`
          echo "  Symlinking $DOTFILES_DIR_RELATIVE_TO_HOME/$DOTLESS to $1"
          ln -s $DOTFILES_DIR_RELATIVE_TO_HOME/$DOTLESS $1
      else
        echo "  SKIPPING $1."
      fi
    # does not exist
    else
      # create the link
      export DOTLESS=`echo $1 | sed s/.//`
      echo "  Symlinking $DOTFILES_DIR_RELATIVE_TO_HOME/$DOTLESS to $1"
      ln -s $DOTFILES_DIR_RELATIVE_TO_HOME/$DOTLESS $1
    fi
}


echo "This script must be run from the dotfiles directory"
echo "Setting up..."

export DOTFILES_DIR_RELATIVE_TO_HOME=.dotfiles
echo "DOTFILES_DIR_RELATIVE_TO_HOME = $DOTFILES_DIR_RELATIVE_TO_HOME"

pushd ~

if [ $1 = "--backup" ]; then
  backupdotfiles .aliases
  backupdotfiles .emacs
  backupdotfiles .exports
  backupdotfiles .functions
  backupdotfiles .gitconfig
  backupdotfiles .zshrc
fi

symlinkifne .aliases
symlinkifne .emacs
symlinkifne .exports
symlinkifne .functions
symlinkifne .gitconfig
symlinkifne .zshrc

popd

echo "Install mongo hacker"
make -C ~/$DOTFILES_DIR_RELATIVE_TO_HOME/mongo-hacker uninstall
make -C ~/$DOTFILES_DIR_RELATIVE_TO_HOME/mongo-hacker install

echo "Copy Theme"
mkdir $DOTFILES_DIR_RELATIVE_TO_HOME/oh-my-zsh/custom/themes
cp $DOTFILES_DIR_RELATIVE_TO_HOME/themes/furipowerline.zsh-theme $DOTFILES_DIR_RELATIVE_TO_HOME/oh-my-zsh/custom/themes

echo "Create .z"
touch ~/.z


