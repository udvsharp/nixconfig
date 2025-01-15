set -g status-style "bg=default,fg=#{@light_gray}"
set -g status-justify centre

# Left side: Session name with charcoal and steel blue
set -g status-left '#[fg=#{@steel_blue},bg=#{@charcoal}] #S #[default]'

# Right side: Hostname, battery, time, and date using teal, tan, lavender
set -g status-right '#[fg=#{@teal},bg=default] #(acpi --battery | cut -d, -f2) #[fg=#{@tan},bold]%H:%M #[fg=#{@lavender}]%d/%m/%y #[fg=#{@steel_blue}]#H'
