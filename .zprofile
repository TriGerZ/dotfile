# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";
# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,aliases_custom}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# useful only for Mac OS Silicon M1,
# still working but useless for the other platforms
docker() {
 if [[ `uname -m` == "arm64" ]] && [[ "$1" == "run" || "$1" == "build" ]]; then
    /usr/local/bin/docker "$1" --platform linux/amd64 "${@:2}"
  else
     /usr/local/bin/docker "$@"
  fi
}

# add git ssh key (quiet)
ssh-add --apple-load-keychain -q
