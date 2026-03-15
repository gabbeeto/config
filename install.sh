# install stuff
sudo pacman -S cachyos-gaming-meta --noconfirm --needed
sudo pacman -S cachyos/umu-launcher --noconfirm --needed
sudo pacman -S protonup-qt --noconfirm --needed
sudo pacman -S discord --noconfirm --needed
sudo pacman -S steam --noconfirm --needed
sudo pacman -S keyd --noconfirm --needed
sudo pacman -S yt-dlp --noconfirm --needed

# best terminal file manager and dependencies
sudo pacman -S yazi  7zip  poppler fd ripgrep  zoxide resvg imagemagick   --noconfirm --needed

# for c++ and godot
sudo pacman -S clang scons python3 --noconfirm --needed
# apps for that I use daily
sudo pacman -S curl unzip obs-studio go helix zellij npm nodejs python-pip python-pipx python discord flatpak fzf arch-wiki-docs jre-openjdk mpv blender pavucontrol man-db man-pages less --noconfirm --needed

#prism launcher for minecraft
sudo pacman -S prismlauncher --needed --noconfirm

# for taking pictures
sudo pacman -S snapshot --noconfirm --needed


# dependencies for raylib and raylib
sudo pacman -S alsa-lib  libx11 libxrandr libxi libxcursor libxinerama libxkbcommon lib32-wayland lib32-libxkbcommon raylib --noconfirm --needed

flatpak-install-if-needed() {
    if ! flatpak list --app | grep -q "$1"; then
        flatpak install --noninteractive flathub "$1"
    else
        flatpak update --noninteractive "$1"
    fi
}

flatpak-install-if-needed org.kde.krita
flatpak-install-if-needed org.gimp.GIMP
flatpak-install-if-needed com.orama_interactive.Pixelorama
flatpak-install-if-needed org.inkscape.Inkscape
flatpak-install-if-needed com.chatterino.chatterino
flatpak-install-if-needed org.libreoffice.LibreOffice
flatpak-install-if-needed org.luanti.luanti
flatpak-install-if-needed org.vinegarhq.Vinegar
flatpak-install-if-needed org.vinegarhq.Sober 
flatpak-install-if-needed org.zealdocs.Zeal
flatpak-install-if-needed net.ankiweb.Anki
flatpak-install-if-needed net.nokyan.Resources
flatpak-install-if-needed org.tenacityaudio.Tenacity
flatpak-install-if-needed org.libretro.RetroArch
flatpak-install-if-needed org.DolphinEmu.dolphin-emu

npm-install-if-needed() {
    if ! npm list -g "$1" --depth=0 | grep -q "$1"; then
        sudo npm install -g "$1" --no-fund --no-audit
    else
        sudo npm update -g "$1" --no-fund --no-audit
    fi
}

 # install language servers for helix
npm-install-if-needed vscode-langservers-extracted
npm-install-if-needed @olrtg/emmet-language-server
npm-install-if-needed typescript
npm-install-if-needed typescript-language-server

sudo pacman -S python-lsp-server --noconfirm --needed
sudo pacman -S lua-language-server --noconfirm --needed

# for godot language server
sudo pacman -S nmap --needed --noconfirm
pipx install "gdtoolkit==4.*"
pipx upgrade "gdtoolkit==4.*"

# fuse2 for appimages
sudo pacman -S fuse2 --noconfirm --needed





sudo systemctl enable keyd --now
sudo systemctl start keyd

echo "alias hx='helix'" >> ~/.bashrc

echo "alias download='yt-dlp -f \"bestvideo[height<=720]+bestaudio/best[height<=720]\" --embed-subs  --add-metadata --merge-output-format mkv '" >> ~/.bashrc
echo "alias downloadP='yt-dlp -o  \"%(playlist_index)03d - %(title)s.%(ext)s\" -f \"bestvideo[height<=720]+bestaudio/best[height<=720]\" --embed-subs --add-metadata --merge-output-format mkv '" >> ~/.bashrc
echo "export EDITOR=\"helix\"" >> ~/.bashrc
echo "export PATH=\$PATH:~/.cargo/bin" >> ~/.bashrc
echo 'export PATH="$PATH:$HOME/.local/bin"' >> ~/.bashrc


# I use the y command to navegate through yazi
echo "function y() {
	local tmp=\"\$(mktemp -t \"yazi-cwd.XXXXXX\")\" cwd
	yazi \"\$@\" --cwd-file=\"\$tmp\"
	IFS= read -r -d '' cwd < \"\$tmp\"
	[ -n \"\$cwd\" ] && [ \"\$cwd\" != \"\$PWD\" ] && builtin cd -- \"\$cwd\"
	rm -f -- \"\$tmp\"
}" >> ~/.bashrc




sudo keyd reload

git config --global init.defaultBranch main
git config --global pull.rebase false
git config --global core.editor "helix"
