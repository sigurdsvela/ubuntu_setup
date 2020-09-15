alias scode="sudo code --user-data-dir=/home/sigsve/.vscode $@"
alias reboot-bios="sudo systemctl reboot --firmware-setup"
alias wsens="watch -n 1 sensors \"it8620-isa-0a60\""
alias winxi="watch --color -n 1 inxi -F"

alias keyd-start="sudo service keyboardmap start"
alias keyd-stop="sudo service keyboardmap stop"
alias keyd-restart="sudo service keyboardmap restart"
alias keyd-status="sudo service keyboardmap status"

keyd-watch() {
    sudo service keyboardmap stop
    sleep 1
    sudo xkeysnail /etc/systemd/system/keyboardmap.service.d/xkeysnail.config.py
    sudo service keyboardmap start
}
