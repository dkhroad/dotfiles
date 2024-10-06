if [ `uname` = "Darwin" ]; then
  export M2_HOME=~/Work/apache-maven-3.0.4
else 
  export M2_HOME=~/apache-maven-3.0.4
fi
export M2=$M2_HOME/bin
export PATH=$PATH:$M2
export MAVEN_OPTS=-Xmx512m
