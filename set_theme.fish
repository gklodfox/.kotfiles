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

# $ set -U fish_color_normal normal
# $ set -U fish_color_command ff0087
# $ set -U fish_color_quote 005fd7
# $ set -U fish_color_redirection 8787ff --bold
# $ set -U fish_color_end ff0000
# $ set -U fish_color_error brred
# $ set -U fish_color_param ff87d7
# $ set -U fish_color_comment 870087
# $ set -U fish_color_selection white --bold --background=brblack
# $ set -U fish_color_search_match white --bold --background=brblack
# $ set -U fish_color_history_current --bold
# $ set -U fish_color_operator brcyan
# $ set -U fish_color_escape brcyan
# $ set -U fish_color_cwd green
# $ set -U fish_color_cwd_root red
# $ set -U fish_color_valid_path --underline=single
# $ set -U fish_color_autosuggestion 8700af
# $ set -U fish_color_user brgreen
# $ set -U fish_color_host normal
# $ set -U fish_color_host_remote yellow
# $ set -U fish_color_history_current --bold
# $ set -U fish_color_status red
# $ set -U fish_color_cancel --reverse
# $ set -U fish_pager_color_background
# $ set -U fish_pager_color_prefix normal --bold --underline=single
# $ set -U fish_pager_color_progress brwhite --bold --background=cyan
# $ set -U fish_pager_color_completion normal
# $ set -U fish_pager_color_description yellow --italics
# $ set -U fish_pager_color_selected_background --reverse
# $ set -U fish_pager_color_selected_prefix
# $ set -U fish_pager_color_selected_completion
# $ set -U fish_pager_color_selected_description
# $ set -U fish_pager_color_secondary_description
# $ set -U fish_color_keyword
# $ set -U fish_pager_color_secondary_prefix
# $ set -U fish_color_option
# $ set -U fish_pager_color_secondary_background
# $ set -U fish_pager_color_secondary_completion

