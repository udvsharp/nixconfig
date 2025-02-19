# Vi copies
set-window-option -g mode-keys vi
bind-key -Tcopy-mode-vi v send -X begin-selection
bind-key -Tcopy-mode-vi y send -X copy-selection-and-cancel

# Navigation
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R