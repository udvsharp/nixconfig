{   # TODO: add this to common modules
    # TODO: ssh, gpg, github gitlab
    programs.git.enable = true;
    
    programs.git = {
        userName = "Dmitry Vasyliev";
        userEmail = "dmitry.vasyliev@protonmail.com";

        aliases = {
            panicfire = "!sh -c 'git commit -am wip && shutdown -h now'";
            # Debug git aliases `git debug <alias>`
            debug = "!GIT_TRACE=1 git";
            # Pretty graph log
            log-graph = "log --graph --abbrev-commit --decorate --all";
            # Short version of status
            status-short = "status --short --branch --renames --ahead-behind";
            # Last commit info - detailed (with diff)
            last = "log -1 HEAD --stat";
            # Verbose remote list - with links
            remote-verbose = "remote --verbose";
            # Log all unpushed commits #TODO: conflicts?
            unpushed = ''!f() {
                if [ -z "$1" ] || [ -z "$2" ]; then
                    echo "Error: Both arguments must be provided.";
                    echo "Usage: git unpushed <remote> <branch>";
                    return 1;
                fi

                git fetch "$1";

                commit=$(git merge-base HEAD "$1/$2");

                git log --oneline "$commit"..HEAD;
            }; f'';
            # Interactive rebase all unpushed commits
            rebase-unpushed = ''!f() {
                if [ -z "$1" ] || [ -z "$2" ]; then
                    echo "Error: Both arguments must be provided.";
                    echo "Usage: git unpushed <remote> <branch>";
                    return 1;
                fi
                
                commit=$(git merge-base HEAD "$1/$2");
                git rebase --interactive "$commit";
            }; f'';

            ### Additional Shorthands
            lg = "log-graph";
            sts = "status-short";
            rv = "remote-verbose";
            up = "unpushed";
            rebup = "rebase-unpushed";
        };

        extraConfig = {
            core = {
                # editor = "code --wait";
                editor = "nvim";
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