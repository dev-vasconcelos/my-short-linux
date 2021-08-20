alias h='cd ~' # go home bro
alias projdb='docker exec -i database2 psql -U user -d dbproj -c ' # enter in psql interface from dbproj container 
alias p='cd ~/Projects' #projects folder
alias v='vim .' # open vim
alias g='firefox $(git config --get remote.origin.url)' #open git from current dir

alias gnome-terminal='gnome-terminal --full-screen'

#alias nome_bonito='docker exec -i database psql -U user -d $nome_db -c '

alias c='c'
c(){
  if [ ! -z $2 ]; then com=$2; else com="/bin/bash"; fi
  docker exec -ti $1 $com
}

alias prod='ssh_tty_exec prod 192.168.1.15 ' # '$comando'
alias teste='ssh_tty_exec testeuser 192.168.1.14 ' # 'ls'

alias db='docker exec -ti database psql -U user -d postgres' # enger in psql interface from container database

ssh_tty_exec(){
  user=$1
  ip=$2
  args=("$@")  
  if [ ! -z "$3" ]; then
    for (( i=2;i<${#args[@]};i++)); do 
      #echo ${args[${i}]}  
      if (( i == 3)); then com="$com ${BASH_ALIASES[${args[${i}]}]}"; else
        com="$com ${args[${i}]}"; fi
      #com=${BASH_ALIASES[$com}
    done
  fi
  ssh $user@$ip -t $com

}


trabalhar() {
  # wmctrl -n 6
  mysql-workbench &
  firefox &
  code  &
  sleep 5

  wmctrl -r firefox -t 4
  wmctrl -r code -t 1
  wmctrl -r workbench -t 3
  wmctrl -r terminal -t 0
  wmctrl -a terminal
}
