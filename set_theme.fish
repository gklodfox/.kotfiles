#!/usr/bin/env fish

set -l DOTFILES_DIR $HOME/.kotfiles
set -l THEME_DIR $DOTFILES_DIR/fox-theme

if not test -d $THEME_DIR
    echo "fox-theme directory not found! Cloning into $THEME_DIR"
    git clone https://github.com/0xstepit/flow.nvim.git $THEME_DIR

    echo "making flow-teme extras"
    cd $THEME_DIR
    make extras
end

set -l MOON_ECLIPSE_THEME_DIR $THEME_DIR/extra/moon-eclipse
echo "Theme directory is: $MOON_ECLIPSE_THEME_DIR"

set -l FOX_ALACRITTY_DIR $DOTFILES_DIR/fox-alacritty-config/.config/alacritty
echo "Fox alacritty directory is: $FOX_ALACRITTY_DIR"

echo "Setting Alacritty config"
if test -d $FOX_ALACRITTY_DIR
    set -l ALACRITTY_FLOW_FILE $MOON_ECLIPSE_THEME_DIR/alacritty-flow-pink.toml
    set -l ALACRITTY_TARGET_FILE $FOX_ALACRITTY_DIR/flow_theme.toml

    echo "Alacritty theme file: $ALACRITTY_FLOW_FILE will be linked to $ALACRITTY_TARGET_FILE"
    ln -sf $MOON_ECLIPSE_THEME_DIR/alacritty-flow-pink.toml $ALACRITTY_TARGET_FILE
end

echo "Setting fzf, chmoding $MOON_ECLIPSE_THEME_DIR/fzf-flow-pink.sh and executing it"
chmod +x $MOON_ECLIPSE_THEME_DIR/fzf-flow-pink.sh
$MOON_ECLIPSE_THEME_DIR/fzf-flow-pink.sh

echo "Setting tmux"
set -l FOX_TMUX_CONFIG $DOTFILES_DIR/fox-tmux-config/.config/tmux
set -l TMUX_FLOW_TARGET_FN tmux_flow_pink.conf
set -l TMUX_FLOW_FILE $MOON_ECLIPSE_THEME_DIR/tmux-flow-pink.conf
set -l TMUX_FLOW_TARGET_FILE $FOX_TMUX_CONFIG/$TMUX_FLOW_TARGET_FN
echo "tmux config dir: $FOX_TMUX_CONFIG config file: $TMUX_FLOW_FILE wilil be linked to $TMUX_FLOW_TARGET_FILE"
if test -f $FOX_TMUX_CONFIG/tmux.conf
    echo "Tmux theme file: $TMUX_FLOW_FILE will be linked to $TMUX_FLOW_TARGET_FILE"
    ln -sf $TMUX_FLOW_FILE $TMUX_FLOW_TARGET_FILE
    tmux source-file $TMUX_FLOW_TARGET_FILE
    tmux source-file $FOX_TMUX_CONFIG/tmux.conf
end
