#!/bin/bash

alias git-clean='git branch --merged | egrep -v "(^\*|master|staging)" | xargs git branch -d'
alias git-root='cd `git rev-parse --show-cdup`'
alias ssrelease='echo "smart-system-`date '+%Y%m%d%H%M%S'`"'
alias simbora='tmux new-session -s RD\; splitw -h \; selectp -t 1\; splitw -v \; renamew "Coding" \; attach'

ssh-staging() {
  TARGET_IP=${1:-172.31.12.200}
  ssh -vv -i ~/.ssh/plugcrm-key-master.pem ec2-user@$TARGET_IP
}
