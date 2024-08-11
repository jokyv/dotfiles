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
        bash-language-server bat bluez bluez-utils bridge-utils chrono-date 
        cmake cronie cups discord htop obsidian slurp dialog 
        dnsmasq dnsutils dosfstools edk2-ovmf efibootmgr eza wget wireless_tools fd 
        firewalld fzf git-cliff git-delta github-cli grim grub gvfs 
        gvfs-smb hplip inetutils ipset kitty ly marksman mtools 
        nautilus network-manager-applet networkmanager nfs-utils niri nix nss-mdns 
        ntfs-3g openbsd-netcat openssh os-prober pulseaudio pulseaudio-alsa python 
        otf-font-awesome otf-firamono-nerd ttf-firacode-nerd ttf-hack-nerd 
        python-pip python-rich reflector ripgrep skim sof-firmware 
        starship swappy swaylock taplo-cli tlp tokei typos uv vde2 virt-manager 
        ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-common
        vscode-json-languageserver wpa_supplicant xdg-user-dirs 
        xdg-utils yaml-language-server yazi zathura awesome-terminal-fonts    
    )
    sudo pacman -S --needed "${pacman[@]}"

    # for your current WM niri
    niri_packages=(
        mako waybar swaybg swayidle wl-clipboard cliphist polkit-gnome playerctl wlsunset 
        libpulse gnome-console brightnessctl libnotify darkman
    )
    sudo pacman -S --needed "${niri_packages[@]}"

    # for waybar
    waybar_packages=(blueman curl firefox fuzzel gnome-weather gsconnect iwd jq mpv 
        mpv-mpris openresolv pavucontrol pikaur pipewire-media-session 
        pulseaudio-bluetooth python-pydbus ttf-font-logos wireguard-tools ydotool
    )
    sudo pacman -S --needed "${waybar_packages[@]}"

    # Uncomment the appropriate line for your GPU
    # sudo pacman -S --needed xf86-video-amdgpu  # AMD GPU
    sudo pacman -S --needed nvidia nvidia-utils nvidia-settings  # NVIDIA GPU
}


enable_systems() {
    echo ":: Enabling system services..."
    echo ""
    services=(
        "iwd.service" # a lightweight app for wifi connections
        # "NetworkManager" # internet connection
        "bluetooth" # bluetooth connection
        # "cups.service" # for connecting to printer
        # "avahi-daemon" # for printing services, works in conjuction with cups
        # "sshd" # for remote access
        # "tlp" # optimize battery life on Linux systems (laptops)
        "reflector.timer" # automatically updates the mirror list
        "fstrim.timer" # ensure your SSD receive regular TROM operations that helps longevity and perf
        # "firewalld" # firewall solution
        "acpid" # manage power and hardware events
        "systemd-timesyncd.service" # for system clock to remain accurate
        "cronie.service" # for scheduling tasks (cron jobs)

        "fwupd.service" # for firmware updates on supported hardward
        "paccache.timer" # for cleaning up old packages from the pacman cache
        "apparmor.service" # for enabling AppArmor for enhanced security
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

niri_service() {
    echo ""
    echo ":: System setup for niri"
    mkdir -p ~/.config/systemd/user/niri.service.wants
    ln -s /usr/lib/systemd/user/mako.service ~/.config/systemd/user/niri.service.wants/
    ln -s /usr/lib/systemd/user/waybar.service ~/.config/systemd/user/niri.service.wants/
    ln -s ~/dot/dot/systemd/user/swaybg.service ~/.config/systemd/user/swaybg.service
    systemctl --user daemon-reload
    ln -s ~/.config/systemd/user/swaybg.service ~/.config/systemd/user/niri.service.wants/
    ln -s ~/dot/dot/systemd/user/swayidle.service ~/.config/systemd/user/swayidle.service
    systemctl --user daemon-reload
    ln -s ~/.config/systemd/user/swayidle.service ~/.config/systemd/user/niri.service.wants/
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

    install_packages
    enable_systems
    add_user

    echo ""
    echo ":: Post-installation setup complete."
    echo ""

    ask_reboot
}

# Run the main function
main
