#
# Executes commands at login pre-zshrc.
#


### If on OS X:
if [[ "$OSTYPE" = darwin* ]] ; then
  # Tell compilers we have a 64 bit architecture
  # This resolves install issues with mysql, postgres, and
  # other python packages with native non universal binary extensions
  export ARCHFLAGS="-arch x86_64"
  # Ensure Homebrew binaries take precedence
  export PATH=/usr/local/bin:/usr/local/sbin:"$PATH"
fi

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='emacsclient -nw'
export VISUAL='emacsclient -c'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  # ensure MHPCC ssh and kerberos take precedent
  ${HOME}/.poetry/bin
  ${HOME}/local/bin
  ${HOME}/local/miniconda3/bin
  $HOME/local/anaconda3/bin
  /usr/local/krb5/bin
  /usr/local/ossh/bin
  /usr/local/{bin,sbin}
  $path
)


#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-g -i -M -R -S -w -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

