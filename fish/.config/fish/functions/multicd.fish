function multicd --description "Go up a number of directories (... turns into cd ../../, and .... into cd ../../../)"
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
