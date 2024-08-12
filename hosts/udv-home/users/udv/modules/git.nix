{
    # TODO: ssh, gpg, github gitlab
    programs.git.enable = true;
    
    programs.git = {
        userName = "Dmitry Vasyliev";
        userEmail = "dmitry.vasyliev@protonmail.com";

        aliases = {
            # LogGraph - Pretty graph log
            lg = "log --graph --abbrev-commit --decorate --all";
            # STatusShort - short version of status
            sts = "status --short --branch --renames --ahead-behind";
            # Last commit info - detailed (with diff)
            last = "log -1 HEAD --stat";
            # Verbose remote list - with links
            rv = "remote --verbose";
        };

        # TODO: migrate to vim for that :)
        extraConfig = {
            core = {
                editor = "code --wait";
            };
            merge = {
                tool = "vscode";
            };
            diff = {
                tool = "vscode";
            };
            mergetool = {
                vscode = {
                    cmd = "code --wait $MERGED";
                    trustExitCode = true;
                };
            };
            difftool = {
                vscode = {
                    cmd = "code --wait --diff $LOCAL $REMOTE";
                };
            };
        };
    };
}