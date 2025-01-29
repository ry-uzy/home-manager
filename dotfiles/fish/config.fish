if status is-interactive
    starship init fish | source
    alias br="bun run"
    alias bi="bun install"
    alias ...="cd ../.."
    alias ..="cd .."
    set -Ux EDITOR hx
    set -Ux NIX_PATH "nixos-config=/home/ryuz/.config/home-manager/configuration.nix"
    fish_add_path /run/current-system/sw/share/asdf-vm/asdf.sh
    git config --global alias.co checkout
    git config --global alias.br branch
    git config --global alias.ci commit
    git config --global alias.st status
end
