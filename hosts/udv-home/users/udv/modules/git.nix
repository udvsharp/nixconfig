{
    # TODO: ssh, gpg, github gitlab
    programs.git.enable = true;
    
    programs.git = {
        userName = "Dmitry Vasyliev";
        userEmail = "dmitry.vasyliev@protonmail.com";

        aliases = {
            # Pretty graph log
            log-graph = "log --graph --abbrev-commit --decorate --all";
            # Short version of status
            status-short = "status --short --branch --renames --ahead-behind";
            # Last commit info - detailed (with diff)
            last = "log -1 HEAD --stat";
            # Verbose remote list - with links
            remote-verbose = "remote --verbose";

            ### Additional Shorthands
            lg = "log-graph";
            sts = "status-short";
            rv = "remote-verbose";
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