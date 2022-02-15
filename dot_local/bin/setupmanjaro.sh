echo "Setting up a new Manjaro installation"

# Setup mirrors
sudo pacman-mirrors -c Italy,Germany,France

# Setup basic packages
sudo pacman -Syu --noconfirm git firefox zsh alacritty guake base-devel r chezmoi neovim

echo "Installing yay"
cd $HOME
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

yay -Syu --noconfirm rstudio-desktop-bin ttf-meslo-nerd-font-powerlevel10k nvim-packer-git

# Pull config files
chezmoi init git@github.com:MrHedmad/dotfiles.git

echo -n "Showing Chezmoi diffs in 3..."
sleep 1
echo -n "2..."
sleep 1
echo "1..."
sleep 1

chezmoi diff

read -p "Apply? [y/n]: " yn
case $yn in
    [Yy]*) chezmoi apply ;;
    *) echo "Not applied." ;;
esac

echo "Installing Oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing Powerlevel 10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "Installing Latex"
sudo pacman -Syu texlive-most texlive-bibtexextra biber texlive-fontsextra


echo "Done - Welcome to manjaro."

echo -n "Rebooting in 10..."
sleep 1
echo -n "9..."
sleep 1
echo -n "8..."
sleep 1
echo -n "7..."
sleep 1
echo -n "6..."
sleep 1
echo -n "5..."
sleep 1
echo -n "5..."
sleep 1
echo -n "4..."
sleep 1
echo -n "3..."
sleep 1
echo -n "2.."
sleep 1
echo "1..."
sleep 1

sudo reboot
