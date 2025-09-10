function ls --wraps=lsd --description 'alias ls=lsd -l --all --human-readable --group-dirs=first'
  lsd -l --all --human-readable --group-dirs=first $argv
        
end
