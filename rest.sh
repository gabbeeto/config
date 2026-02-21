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
