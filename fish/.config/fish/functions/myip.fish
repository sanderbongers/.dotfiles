function myip --wraps=curl\ -s\ http://httpbin.org/ip\ \|\ jq\ --raw-output\ \'.\[\]\' --description alias\ myip=curl\ -s\ http://httpbin.org/ip\ \|\ jq\ --raw-output\ \'.\[\]\'
  curl -s http://httpbin.org/ip | jq --raw-output '.[]' $argv
        
end
