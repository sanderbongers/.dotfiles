function os --description "Write the name of the operating system implementation"
    echo (command uname -s | string lower)
end
