{ config, lib, packages, dotsrc, ... }:

{
    home.sessionVariables = {
        EDITOR = "nvim";
    };

    programs.neovim = {
        enable = true;
        
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;

        defaultEditor = true;
    };

    # xdg.configFile = {
    #     "nvim".source = config.lib.file.mkOutOfStoreSymlink "${dotsrc}/nvim";
    # };

    # home.activation.neovim =
    #     lib.home-manager.hm.dag.entryAfter [ "linkGeneration" ] # bash
    #         ''
    #         LOCK_FILE=$(readlink -f ~/.config/nvim/lazy-lock.json)
    #         echo $LOCK_FILE
    #         [ ! -f "$LOCK_FILE" ] && echo "No lock file found, skipping" && exit 0

    #         STATE_DIR=~/.local/state/nix/
    #         STATE_FILE=$STATE_DIR/lazy-lock-checksum

    #         [ ! -d $STATE_DIR ] && mkdir -p $STATE_DIR
    #         [ ! -f $STATE_FILE ] && touch $STATE_FILE

    #         HASH=$(nix-hash --flat $LOCK_FILE)

    #         if [ "$(cat $STATE_FILE)" != "$HASH" ]; then
    #         echo "Syncing neovim plugins"
    #         $DRY_RUN_CMD ${config.programs.neovim.finalPackage}/bin/nvim --headless "+Lazy! restore" +qa
    #         $DRY_RUN_CMD echo $HASH >$STATE_FILE
    #         else
    #         $VERBOSE_ECHO "Neovim plugins already synced, skipping"
    #         fi
    #     '';
}
