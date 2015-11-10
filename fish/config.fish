. ~/.config/fish/colors.fish
. ~/.config/fish/z.fish

set -gx EDITOR vim
set -gx TZ 'America/Los_Angeles'
set PATH ~/bin $PATH

# rbenv
if test (which rbenv ^ /dev/null)
    status --is-interactive; and . (rbenv init -|psub)
end

if test (which hub ^ /dev/null)
    eval (hub alias -s)
end

if test -f ~/.config/fish/local.fish
    . ~/.config/fish/local.fish
end

if test -d ~/go
    set -gx GOPATH ~/go
    set PATH $GOPATH/bin $PATH
end

