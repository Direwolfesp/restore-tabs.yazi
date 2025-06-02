# restore-tabs.yazi

### Install
`ya pkg add Direwolfesp/restore-tabs.yazi`

### Usage
add this to you keymap.toml
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
