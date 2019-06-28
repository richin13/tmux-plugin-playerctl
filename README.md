# tmux-plugin-playerctl

A tmux plugin for using [playerctl](https://github.com/acrisci/playerctl) to display [MPRIS](https://www.freedesktop.org/wiki/Specifications/mpris-spec/) meta-data about the music currently playing.

## Pre-requisites

Make sure you have *playerctl* installed.

```bash
# If you're in Arch
sudo pacman -S playerctl
```

See [playerctl](https://github.com/acrisci/playerctl#installing)'s instructions to get more details about installing it in other OS.

## Installation

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`:

```
set -g @plugin 'richin13/tmux-plugin-playerctl'
```

Hit `prefix + I` to fetch the plugin and source it.

If format strings are added to `status-right`, they should now be visible.

### Manual installation

Clone the repository

```bash
git clone https://github.com/richin13/tmux-plugin-playerctl ~/path/to/local/repo
```

Add the following line to your `.tmux.conf`:

```bash
run-shell ~/path/to/local/repo/playerctl.tmux
```


## Usage

The currently available options are:

- `#{playerctl_artist}`: Display the song's artist information
- `#{playerctl_title}`: Display the song's title information
- `#{playerctl_album}`: Display the song's album information
- `#{playerctl_full}`: Display the song info in the format [Artist] - [Title]

Just add the desired option to your `.tmux.conf` like this:

```bash
set -g status-right   "#{playerctl_full}"
```

## License

See [LICENSE](./LICENSE)
