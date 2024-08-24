#!/bin/bash

# -----------------------------------------------
# Shell options
# -----------------------------------------------

set -o nounset   # error when referencing undefined variable
# set -o errexit   # exit when command fails
# set -o pipefail  # exit if any command in a pipeline fails
# set -x           # print each command before executing it (helpful for debugging)

# This trap will catch any errors that occur,
# print the line number where the error occurred before exiting.
trap 'echo "Error on line $LINENO"; exit 1' ERR

# -----------------------------------------------
# Source files
# -----------------------------------------------

source $HOME/dot/bin/bash_util.sh

# -----------------------------------------------
# Function definitions
# -----------------------------------------------

create_swap_partition() {
    local disk="/dev/nvme0n1"  # Default disk, change if needed
    local size="16G"           # Default size, change if needed

    # Check for root privileges otherwise exit
    if [ "$EUID" -ne 0 ]; then
        echo "Please run as root or with sudo..."
        echo "moving to next step..."
        return 1
    fi

    # Prompt for disk and size
    read -p "Enter disk to use (default $disk): " input_disk
    disk=${input_disk:-$disk}
    read -p "Enter swap size (default $size): " input_size
    size=${input_size:-$size}

    echo "Creating swap partition on $disk with size $size"

    # Create partition
    parted $disk --script -- mklabel gpt mkpart primary linux-swap 0% $size

    # Get the new partition number
    partition=$(lsblk $disk -nlo NAME,SIZE | grep $size | awk '{print $1}' | grep -o 'p[0-9]*$')
    partition="${disk}${partition}"

    # Format and enable swap
    mkswap $partition
    swapon $partition

    # Add to fstab
    echo "$partition none swap defaults 0 0" >> /etc/fstab

    echo "Swap partition created and enabled on $partition"
    free -h

    pause_for_user
}

install_packages() {
    echo "Installing packages..."
    pacman=(
        alsa-utils alsa-firmware atuin bash-completion bash-language-server 
        bat bluez bluez-utils bridge-utils chrono-date cmake cronie cups 
        discord htop slurp dialog dnsmasq dnsutils dosfstools 
        edk2-ovmf efibootmgr eza wget wireless_tools fd firefox 
        fzf git-cliff git-delta github-cli grim gvfs gvfs-smb hplip inetutils 
        ipset kitty ly marksman mtools nautilus network-manager-applet nfs-utils 
        niri nix nss-mdns ntfs-3g openbsd-netcat openssh os-prober pulseaudio 
        pulseaudio-alsa otf-font-awesome otf-firamono-nerd ttf-firacode-nerd 
        ttf-hack-nerd python-pip python-rich reflector ripgrep skim sof-firmware 
        starship swappy taplo-cli tlp tokei typos uv vde2 virt-manager ttf-nerd-fonts-symbols 
        ttf-nerd-fonts-symbols-common vscode-json-languageserver wpa_supplicant xdg-user-dirs 
        xdg-utils xclip yaml-language-server yazi zathura awesome-terminal-fonts    
        pacman-contrib apparmor jq acpid

        # installed from archinstall script
        # amd-ucode
        # avahi
        # base
        # base-devel
        # grub
        # python
        
        # maybe section
        # pipewire
        # networkmanager         
        # wire-plumber

    )
    sudo pacman -S --needed "${pacman[@]}"
    pause_for_user

    # for your current WM niri
    niri_packages=(
        mako waybar swaybg swayidle swaylock fuzzel wl-clipboard cliphist polkit-gnome playerctl wlsunset 
        libpulse gnome-console brightnessctl libnotify darkman
    )
    sudo pacman -S --needed "${niri_packages[@]}"
    pause_for_user

    # for waybar
    waybar_packages=(
        blueman curl gnome-weather iwd jq mpv mpv-mpris 
        openresolv pavucontrol pipewire-media-session pulseaudio-bluetooth python-pydbus wireguard-tools ydotool

        # maybe section - most from aur
        # jack2
        # gsconnect
        # pikaur
        # ttf-font-logos
    )
    sudo pacman -S --needed "${waybar_packages[@]}"
    pause_for_user

    # Uncomment the appropriate line for your GPU
    # sudo pacman -S --needed xf86-video-amdgpu  # AMD GPU
    sudo pacman -S --needed nvidia nvidia-utils nvidia-settings  # NVIDIA GPU
    pause_for_user
}


enable_system_services() {
    echo ":: Enabling system services..."
    echo ""
    services=(
        "bluetooth" # bluetooth connection
        "reflector.timer" # automatically updates the mirror list
        "systemd-timesyncd.service" # for system clock to remain accurate
        "cronie.service" # for scheduling tasks (cron jobs)
        "acpid" # manage power and hardware events
        "apparmor.service" # for enabling AppArmor for enhanced security
        "ly.service" # for the display manager
        "paccache.timer" # for cleaning up old packages from the pacman cache

        # already enabled?
        "fstrim.timer" # ensure your SSD receive regular TROM operations that helps longevity and perf
        "iwd.service" # a lightweight app for wifi connections
        "systemd-timesyncd.service" # for system clock to remain accurate
        
        # maybe section
        # "NetworkManager" # internet connection
        # "cups.service" # for connecting to printer
        # "avahi-daemon" # for printing services, works in conjuction with cups
        # "tlp" # optimize battery life on Linux systems (laptops)
        # "firewalld" # firewall solution
        # "sshd" # for remote access
    )

    # enable services
    for service in "${services[@]}"; do
        if sudo systemctl is-enabled --quiet "$service"; then
            echo ":: $service is already enabled."
        else
            echo ":: Enabling $service..."
            sudo systemctl enable "$service"
        fi
    done
    pause_for_user

    # Ask for optional services
    echo ""
    echo ":: Do you want to enable any additional services? (y/n)"
    read -r response
    if [[ "$response" =~ ^[Yy]$ ]]; then
        for service in "${optional_services[@]}"; do
            echo "Do you want to enable $service? (y/n)"
            read -r opt
            if [[ "$opt" =~ ^[Yy]$ ]]; then
                enable_services "$service"
            fi
        done
    fi
}

setup_fwupd() {
    # Check if function is run as root
    if [ "$EUID" -ne 0 ]; then
        echo "This function needs to be run as root"
        echo "Moving to the next part..."
        return 1
    fi

    # Install fwupd if not already installed
    if ! pacman -Qs fwupd > /dev/null; then
        echo "Installing fwupd..."
        pacman -S --noconfirm fwupd || return 1
    else
        echo "fwupd is already installed."
    fi

    # Create symlink to enable service on boot
    echo "Creating symlink for fwupd service..."
    ln -sf /usr/lib/systemd/system/fwupd.service /etc/systemd/system/multi-user.target.wants/fwupd.service

    # Reload systemd manager configuration
    echo "Reloading systemd manager configuration..."
    systemctl daemon-reload

    # Start the fwupd service
    echo "Starting fwupd service..."
    systemctl start fwupd.service

    # Check if service is enabled
    if systemctl is-enabled fwupd.service > /dev/null 2>&1; then
        echo "fwupd service is enabled and will start on boot."
    else
        echo "Warning: Unable to confirm if fwupd service is enabled."
    fi

    # Check service status
    echo "Checking fwupd service status..."
    systemctl status fwupd.service

    echo "fwupd setup complete."
    pause_for_user
}

add_user() {
    echo ""
    echo ":: Do you want to add a new user? (y/n)"
    read -r add_user_response
    if [[ "$add_user_response" =~ ^[Yy]$ ]]; then
        echo ":: Adding a new user..."
        read -p "Enter the username for the new user: " username
        useradd -m -G wheel -s /bin/bash "$username"
        passwd "$username"
        echo ":: $username ALL=(ALL) ALL" | sudo tee "/etc/sudoers.d/$username"
        echo ":: User $username has been added."
    else
        echo ":: Skipping user addition."
    fi
}

enable_niri_services() {
    echo ""
    echo ":: System setup for niri"
    mkdir -p ~/.config/systemd/user/niri.service.wants
    ln -s /usr/lib/systemd/user/mako.service ~/.config/systemd/user/niri.service.wants/
    ln -s /usr/lib/systemd/user/waybar.service ~/.config/systemd/user/niri.service.wants/
    ln -s ~/dot/systemd/user/swaybg.service ~/.config/systemd/user/swaybg.service
    systemctl --user daemon-reload
    ln -s ~/.config/systemd/user/swaybg.service ~/.config/systemd/user/niri.service.wants/
    ln -s ~/dot/systemd/user/swayidle.service ~/.config/systemd/user/swayidle.service
    systemctl --user daemon-reload
    ln -s ~/.config/systemd/user/swayidle.service ~/.config/systemd/user/niri.service.wants/
    pause_for_user
}

setup_github() {
    local github_username
    local dotfiles_repo
    local repos_dir="$HOME/repos"
    local pics_dir="$HOME/pics"

    # Ask for GitHub username
    read -p "Enter your GitHub username: " github_username

    # Generate SSH key
    ssh-keygen -t ed25519 -C "${github_username}@users.noreply.github.com" -f ~/.ssh/id_ed25519 -N ""

    # Start ssh-agent and add key
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519

    # Display the public key
    echo "Here's your public SSH key."
    echo "Use your favourite browser and add this to your GitHub account:"
    cat ~/.ssh/id_ed25519.pub

    # Wait for user to add key to GitHub
    read -p "Press enter after you've added the key to your GitHub account"

    # Test SSH connection
    ssh -T git@github.com

    # Clone dotfiles repository
    read -p "Enter the name of your dotfiles repository: " dotfiles_repo
    git clone "git@github.com:${github_username}/${dotfiles_repo}.git" "$HOME/dot"

    # Clone dotfiles wiki repository
    read -p "Enter the name of your dotfiles wiki repository: " dotfiles_wiki_repo
    git clone "git@github.com:${github_username}/${dotfiles_wiki_repo}.git" "$HOME/${dotfiles_wiki_repo}"

    # Create pics directory if it doesn't exist
    if [ ! -d "$pics_dir" ]; then
        mkdir -p "$pics_dir"
        echo "Created pics directory at $pics_dir"
    fi

    # Clone wallpapers repository
    read -p "Enter the name of your wallpapers repository: " wallpapers_repo
    git clone "git@github.com:${github_username}/${wallpapers_repo}.git" "$HOME/${wallpapers_repo}"

    # Create repos directory if it doesn't exist
    if [ ! -d "$repos_dir" ]; then
        mkdir -p "$repos_dir"
        echo "Created repos directory at $repos_dir"
    fi
    
    # Ask for additional repositories to clone
    while true; do
        read -p "Enter the name of another repository to clone (or press Enter to finish): " repo_name
        if [ -z "$repo_name" ]; then
            break
        fi
        git clone "git@github.com:${github_username}/${repo_name}.git" "$repos_dir/${repo_name}"
    done

    echo ""
    echo ":: Setup complete!"
    pause_for_user
}

    
add_symlinks() {
    # Array of config directories/files
    configs=(
        "atuin"
        "bat"
        "fd"
        "fuzzel"
        "git"
        "helix"
        "home-manager"
        "kitty"
        "mako"
        "niri"
        "swappy"
        "waybar"
        "yazi"
    )

    # Source and destination directories
    source_dir="$HOME/dot"
    dest_dir="$HOME/.config"

    # Check if destination directory exists, if not create it
    if [ ! -d "$dest_dir" ]; then
        echo "Creating destination directory: $dest_dir"
        mkdir -p "$dest_dir"
    fi    

    # Function to create symlink, overwriting if it exists
    create_symlink() {
        local source="$1"
        local dest="$2"
        if [ -e "$dest" ] || [ -L "$dest" ]; then
            echo "Overwriting existing file/symlink: $dest"
        fi
        ln -sf "$source" "$dest"
        echo "Created/Updated symlink: $dest -> $source"
    }

    # Loop through configs and create symlinks
    for config in "${configs[@]}"; do
        source="$source_dir/$config"
        dest="$dest_dir/$config"
    
        if [ -e "$source" ]; then
            create_symlink "$source" "$dest"
        else
            echo "Warning: $source does not exist. Skipping."
        fi
    done

    # Handle special cases seperatly
    echo ""
    echo ":: Symlinking special cases"
    create_symlink "$source_dir/starship/starship.toml" "$dest_dir/starship.toml"
    create_symlink "$source_dir/ripgrep/.ripgreprc" "$dest_dir/.ripgreprc"    
    create_symlink "$source_dir/python/mypy" "$dest_dir/mypy"    
    create_symlink "$source_dir/python/ruff" "$dest_dir/ruff"    
    create_symlink "$source_dir/typos/typos.toml" "$dest_dir/typos/typos.toml"    
    create_symlink "$source_dir/shell/.bashrc" "$HOME/.bashrc"    
    create_symlink "$source_dir/shell/.bash_profile" "$HOME/.bash_profile"    

    echo ""
    echo ":: Symlinking complete!"
    pause_for_user
}

setup_atuin_bash() {
    echo ":: Downloading .bash-preexec.sh"
    curl https://raw.githubusercontent.com/rcaloras/bash-preexec/master/bash-preexec.sh -o ~/.bash-preexec.sh
    pause_for_user
}

setup_python_env() {
    # Check if uv is installed
    if ! command -v uv &> /dev/null; then
        echo "uv is not installed. Installing uv..."
        curl -LsSf https://astral.sh/uv/install.sh | sh
        # Add uv to PATH for the current session
        export PATH="$HOME/.cargo/bin:$PATH"
    fi

    # Set the name for the virtual environment
    local venv_name="uv_default"
    local venv_path="$HOME/$venv_name"

    # Create the virtual environment
    if [ ! -d "$venv_path" ]; then
        echo "Creating virtual environment $venv_name using uv..."
        uv venv "$venv_path"
        echo ":: Virtual environment created at $venv_path"
    else
        echo ":: Virtual environment $venv_name already exists at $venv_path"
    fi

    # Activate the virtual environment
    echo ""
    echo ":: Activating virtual environment..."
    source "$venv_path/bin/activate"

    # Verify the activation
    if [ "$VIRTUAL_ENV" = "$venv_path" ]; then
        echo "Virtual environment $venv_name is now active"
        echo "Python version:"
        python --version

        # Install packages from requirements.txt
        local requirements_file="$HOME/dot/python/requirements.txt"
        if [ -f "$requirements_file" ]; then
            echo "Installing packages from $requirements_file"
            uv pip install -r "$requirements_file"
            echo "Package installation complete"
        else
            echo "Requirements file not found at $requirements_file"
        fi

        echo "To deactivate, run 'deactivate'"
    else
        echo ""
        echo ":: Failed to activate the virtual environment"
    fi
    pause_for_user
}

ask_reboot() {
    echo ""
    echo ":: It's recommended to reboot your system to ensure all changes take effect."
    echo ":: Would you like to reboot now? (y/n)"
    read -r ask_reboot_response
    if [[ "$ask_reboot_response" =~ ^[Yy]$ ]]; then
        echo ":: Rebooting system..."
        reboot
    else
        echo "::Please remember to reboot your system later for all changes to take effect."
    fi
}

# -----------------------------------------------
# Main execution
# -----------------------------------------------

main() {
    echo ""
    echo ":: Starting post-installation setup..."
    echo ""

    create_swap_partition
    install_packages
    enable_system_services
    setup_fwupd
    add_user # this is done using archinstall script at the beginning
    enable_niri_services
    setup_github
    add_symlinks
    setup_atuin_bash
    setup_python_env

    echo ""
    echo ":: Post-installation setup completed!"
    echo ""

    ask_reboot
}

# Run the main function
main
