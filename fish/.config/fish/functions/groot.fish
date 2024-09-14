function groot --wraps='cd (git rev-parse --show-toplevel)' --description 'alias groot=cd (git rev-parse --show-toplevel)'
  cd (git rev-parse --show-toplevel) $argv
        
end
