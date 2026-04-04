<img src="./attachments/Screenshot 2026-04-05 at 2.37.27 AM.png">

```bash
git clone https://github.com/projectmanoj/Dotfile.git ~/Dotfile
cd Dotfile
stow karabinder
```

```bash
mkdir Dotfile
cd Dotfile
mkdir -pv karabinder/.config
mv ~/.config/karabinder karabinder/.config
nvim
stow karabinder # creates symlink for karabinder/* to $HOME directory
# in this case $HOME/.config/karabinder/*

```
