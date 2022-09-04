#!/bin/zsh

export UNLINK=true

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
symlinkifne .gitconfig
symlinkifne .zshrc
symlinkifne .vimrc
popd
