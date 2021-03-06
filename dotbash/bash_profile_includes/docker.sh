alias dkr='docker'
alias drmi='docker images --no-trunc| grep none | awk '{print $3}' | xargs  docker rmi -f'
alias dke='docker ps -a --no-trunc | grep 'Exit' | awk '{print $1}' | xargs  docker rm'
alias dka='docker ps -a --no-trunc | awk '{print $1}' | xargs  docker rm'
alias djenkm='docker run --rm -i -t -p 8080:8080 -p 9090:9090 -p 2222:22 -e SSH_KEYS="$(cat ~/.ssh/id_rsa.pub)" dkhroad/jenkins:v2'
alias djenks='docker run --rm -t -i  --name=jenkins_swarm_slave_1    dkhroad/jenkins_swarm_slave:v2 -executors 3 -name dkhroad_slave_1 -master http://192.168.59.103:8080'
