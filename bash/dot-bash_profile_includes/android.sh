if [ `uname` = "Darwin" ];then
  export PATH=$PATH:~/Work/android-sdk-macosx/tools
else
  export PATH=$PATH:~/android-sdk-linux/tools:$HOME/android-sdk-linux/platform-tools
fi

