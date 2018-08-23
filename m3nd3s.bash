alias git-clear='git branch --merged | grep -v "\*" | grep -v "master" |xargs -n 1 git branch -d'
alias pronto_run='RUBOCOP_CONFIG=./ci/rubocop.yml pronto run'

alias vpn-connect="networksetup -connectpppoeservice 'Bio Ritmo'"
alias vpn-disconnect="networksetup -disconnectpppoeservice 'Bio Ritmo'"

ssh_color_red() {
  echo -ne "\033]6;1;bg;red;brightness;255\a"
  echo -ne "\033]6;1;bg;green;brightness;51\a"
  echo -ne "\033]6;1;bg;blue;brightness;51\a"
}

ssh_color_yellow() {
  echo -ne "\033]6;1;bg;red;brightness;255\a"
  echo -ne "\033]6;1;bg;green;brightness;255\a"
  echo -ne "\033]6;1;bg;blue;brightness;128\a"
}

ssh_color() {
  [[ "$*" =~ "production" ]] && ssh_color_red
  [[ "$*" =~ "staging" ]] && ssh_color_yellow

  ssh $*
  echo -e "\033]6;1;bg;*;default\a"
}

alias ssh=ssh_color

ssrelease() {
  echo "smart-system-`date '+%Y%m%d%H%M%S'`"
}
