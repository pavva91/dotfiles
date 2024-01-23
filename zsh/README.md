# ZSH Configuration

Took from here: - (https://dev.to/abdfnx/oh-my-zsh-powerlevel10k-cool-terminal-1no0)[https://dev.to/abdfnx/oh-my-zsh-powerlevel10k-cool-terminal-1no0]

Will use:

1. Oh-My-ZSH (OMZ) - (https://ohmyz.sh/)[https://ohmyz.sh/]
2. PowerLevel10k - (https://github.com/romkatv/powerlevel10k)[https://github.com/romkatv/powerlevel10k]

## Install Oh-My-ZSH

```bash
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## Install PowerLevel10k

```bash
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

### Enable PowerLevel10k

in `~/.zshrc` file:

```bash
ZSH_THEME="powerlevel10k/powerlevel10k"
```

### PowerLevel10k configure

```bash
p10k configure
```

## Plugins

1. zsh-syntax-highlighting
2. zsh-autosuggestions

### Install zsh-syntax-highlighting

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### Install zsh-syntax-autosuggestions

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Add to `~/.zshrc`:

```bash
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
```
