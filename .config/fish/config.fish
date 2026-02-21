source /usr/share/cachyos-fish-config/cachyos-config.fish

alias hx 'helix'
alias download 'yt-dlp -f "bestvideo[height<=720]+bestaudio/best[height<=720]" --embed-subs  --add-metadata --cookies-from-browser firefox --merge-output-format mkv '
alias downloadP 'yt-dlp -o  "%(playlist_index)03d - %(title)s.%(ext)s" -f "bestvideo[height<=720]+bestaudio/best[height<=720]" --embed-subs --add-metadata --cookies-from-browser firefox--merge-output-format mkv '

set -x EDITOR "helix"

fish_add_path ~/.cargo/bin ~/.local/bin

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end
