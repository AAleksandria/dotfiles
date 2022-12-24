set fish_greeting

# pnpm
set -gx PNPM_HOME "/Users/alexsad/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH

# nvm
function nvm
  bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end
