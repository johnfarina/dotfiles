#
# Defines environment variables.
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi


# Custom environment vars... Custom scripts generally go in .zshrc since it's
# only loaded for interactive shells.


### Ansible ###
# If I've created a vault password file, tell Ansible to use it.
# For security, NEVER commit this file to source control.
if [[ -s "${ZDOTDIR:-$HOME}/.ansible_vault_pass.txt" ]]; then
    export ANSIBLE_VAULT_PASSWORD_FILE="${ZDOTDIR:-$HOME}/.ansible_vault_pass.txt"
fi


### NVM ###
# Tell NVM where to store its nodes.
export NVM_DIR="$HOME/.nvm"


### PostgreSQL ###
export PGDATA="/usr/local/var/postgres"


### VirtualEnvWrapper ###
export PROJECT_HOME="$HOME/Code"
# The variable $VIRTUALENVWRAPPER_VIRTUALENV_ARGS tells
# virtualenvwrapper what arguments to pass to virtualenv.
# export VIRTUALENVWRAPPER_VIRTUALENV_ARGS=''
