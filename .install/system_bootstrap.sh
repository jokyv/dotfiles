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
# Function definitions
# -----------------------------------------------


install_packages() {
    echo "Installing packages..."
    pacman=(
        amd-ucode alsa-utils alsa-firmware atuin avahi base base-devel bash-completion 
        bash-language-server bat blueman bluez bluez-utils bridge-utils chrono-date 
        cliphist cmake cronie cups discord htop obsidian pavucontrol slurp dialog 
        dnsmasq dnsutils dosfstools edk2-ovmf efibootmgr eza wget wireless_tools fd 
        firefox firewalld fuzzel fzf git-cliff git-delta github-cli grim grub gvfs 
        gvfs-smb hplip inetutils ipset kitty ly mako marksman mtools 
        nautilus network-manager-applet networkmanager nfs-utils niri nix nss-mdns 
        ntfs-3g openbsd-netcat openssh os-prober pulseaudio pulseaudio-alsa python 
        otf-font-awesome otf-firamono-nerd ttf-firacode-nerd ttf-hack-nerd 
        python-pip python-rich reflector ripgrep skim sof-firmware 
        starship swappy swaybg swaylock taplo-cli tlp tokei typos uv vde2 virt-manager 
        ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-common
        vscode-json-languageserver waybar wl-clipboard wpa_supplicant xdg-user-dirs 
        xdg-utils yaml-language-server yazi zathura awesome-terminal-fonts    
    )

    sudo pacman -S --needed "${pacman[@]}"
    
    # Uncomment the appropriate line for your GPU
    # sudo pacman -S --needed xf86-video-amdgpu  # AMD GPU
    sudo pacman -S --needed nvidia nvidia-utils nvidia-settings  # NVIDIA GPU
}

enable_systems() {
    echo "Enabling system services..."
    services=(
        "NetworkManager"
        "bluetooth"
        "cups.service"
        "sshd"
        "avahi-daemon"
        "tlp"
        "reflector.timer"
        "fstrim.timer"
        # "libvirtd" # do i need this?
        "firewalld"
        # "acpid"
        "systemd-timesyncd.service"
    )

    # enable services
    for service in "${services[@]}"; do
        if systemctl is-enabled --quiet "$service"; then
            echo "$service is already enabled."
        else
            echo "Enabling $service..."
            systemctl enable "$service"
        fi
    done

    # Ask for optional services
    echo "Do you want to enable any additional services? (y/n)"
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

add_user() {
    echo "Do you want to add a new user? (y/n)"
    read -r add_user_response
    if [[ "$add_user_response" =~ ^[Yy]$ ]]; then
        echo "Adding a new user..."
        read -p "Enter the username for the new user: " username
        useradd -m -G wheel -s /bin/bash "$username"
        passwd "$username"
        echo "$username ALL=(ALL) ALL" | sudo tee "/etc/sudoers.d/$username"
        echo "User $username has been added."
    else
        echo "Skipping user addition."
    fi
}

ask_reboot() {
    echo "It's recommended to reboot your system to ensure all changes take effect."
    echo "Would you like to reboot now? (y/n)"
    read -r ask_reboot_response
    if [[ "$ask_reboot_response" =~ ^[Yy]$ ]]; then
        echo "Rebooting system..."
        reboot
    else
        echo "Please remember to reboot your system later for all changes to take effect."
    fi
}

# -----------------------------------------------
# Main execution
# -----------------------------------------------

main() {
    echo "Starting post-installation setup..."

    install_packages
    enable_systems
    add_user

    echo "Post-installation setup complete."

    ask_reboot
}

# Run the main function
main
