# vim-session

Automatic session management for vim.
Works with the built in `mksession` command, and `vim -S` 

## Usage

* `:mksession` *`file`*: Start a session, saving it *`file`*

* `vim -S` *`file`*: Start vim using the session stored in *`file`*

* `:SessionSave`, `:w`, `:e`, `:bd` (and friends): Update the session

* `:SessionEnable`: Enable automatic session updating / saving

* `:SessionDisable`: Disable automatic session updating / saving
