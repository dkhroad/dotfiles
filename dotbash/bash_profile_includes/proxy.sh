function disable_proxy () {
    unset http_proxy
    unset https_proxy
    unset ftp_proxy
}

function enable_proxy () {
    export http_proxy="http://proxy.vcd.hp.com:8080"
    export https_proxy="${http_proxy}"
    export ftp_proxy=http://proxy.vcd.hp.com:8080
    export no_proxy="localhost,127.0.0.1,10.0.2.15,10.0.2.2,10.0.2.3"
}

#enable_proxy 
