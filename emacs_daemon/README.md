# Emacs Daemon with systemd

## 1. Stow Unit file

From root:

```bash
cd dotfiles
```

Run:

```bash
stow emacs_daemon
```

Will create symlink of user service unit in: `~/.config/systemd/user/emacs.service`

## 2. Enable Unit

```bash
systemctl --user enable --now emacs
```

Now you can run emacs by using the client (it will speed up emacs opening)
