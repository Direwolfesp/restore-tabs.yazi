# restore-tabs.yazi

> [!Important]
> This repo was for testing only and it has been archived. If you want this feature, a PR has been made
> to another plugin that already was addresing tabs. [Repo link](https://github.com/MasouShizuka/close-and-restore-tab.yazi)

## Description
[yazi](https://github.com/sxyazi/yazi) plugin that allows to store tabs before exit and restore them with a keybind

## Install
```sh
ya pkg add Direwolfesp/restore-tabs
```

## Configuration

Add this to you `keymap.toml`:

```toml
[[mgr.prepend_keymap]]
on = [ "q" ]
run = "plugin restore-tabs store_session"
desc = "Exits yazi and stores the tabs"

[[mgr.prepend_keymap]]
on = [ "<C-t>" ]
run = "plugin restore-tabs restore_session"
desc = "Restores the tabs from last session"
```
