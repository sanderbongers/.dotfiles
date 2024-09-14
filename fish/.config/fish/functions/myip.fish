function myip --description "Print external IP address"
    curl -w '%{stdout}\n' https://ifconfig.me
end
