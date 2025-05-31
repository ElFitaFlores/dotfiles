if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Created by `pipx` on 2025-04-22 15:34:35
set PATH $PATH /home/fita/.local/bin
set fish_greeting

if type -q zoxide
  zoxide init fish | source
end

if type -q nvim
  set -gx EDITOR nvim
end
