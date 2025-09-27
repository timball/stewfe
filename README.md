# STEWFE -- Split Terminal Emulator Window For Editing

![img/a-split-terminal-and-editing-session.png]

Do you use [iTerm](https://iterm2.com/) or
[tmux](https://github.com/tmux/tmux/wiki) all day? Do you ever split iTerm or
tmux windows to get more done? Ever want to directly edit a file in a split?
Here's a little set of scripts to make that a little easier.

## Installation

Place `stewfe_editor`` somewhere in your path, like `~/bin/`. Source
`stewfe.(nu|sh)` depending on what shell you use. Opitionally you can an alias
for your editor to `stewfe` or just use the `stewfe` function directly.

### For Bash and Zsh
```sh
$ mv stewfe_editor ~/bin
$ export PATH=${PATH}:~/bin
$ source stewfe.sh
$ # optionally set stewfe to your editor command
$ alias ${EDITOR}=stewfe
$ ${EDITOR} test-file.md
$ stewfe test-file.md
# this should split your iTerm or tmux window into the editor of your choice
```

### for nushell
```nu
$ mv stewfe_editor ~/bin
$ $env.PATH = ($env.PATH | prepend "~/bin")
$ source stewfe.nu
$ # optionally you can now set an alias to your editor to stewfe
$ alias YOUR-EDITOR-CMD = stewfe
$ YOUR-EDITOR-CMD test-file.md
$ stewfe test-file.md
# this should split your iTerm or tmux window into the editor of your choice
```

### Setting for iTerm
There are several settings you must set in order for these script to fully work.

    1. Set iTerm to open new sessions in the current working directory:
       Preferences > Advanced: "Working directory for New Split
       Panes" -> Reuse previous session's directory
    2. To get the focus change to work right you must enable Accessibility for
       iTerm to "control your computer" System Settings -> Privacy &
       Security -> Accessibility -> + sign and navigate to list and add iTerm

## Details

The sourced shell scripts define a shell function `stewfe` that tests for tmux,
iTerm, ssh connections and executes ${EDITOR} in an appropriate context. For the 
iTerm context it executes `stewfe_editor`. 

The shell function depends on ${EDITOR} being set so be sure to set ${EDITOR}
before you source the appropriate shell script. 

Furthermore I would NOT recommend setting ${EDITOR}=stewfe as you'll create a
circular dependancy and you may inadvertently summon the devil.

`stewfe_editor` is needed to call `osascript(1)` to execute ${EDITOR} within
iTerm with the default profile inside a vertical split. For conviance
`osascript` is called again to change window focus to the newly created
${EDITOR} window. You must set iTerm to **Reuse previous session's directory**
(see above).

### Dependencies

- [iTerm](https://iterm2.com/) or [tmux](https://github.com/tmux/tmux/wiki)
- [bash](https://www.gnu.org/software/bash/) or [zsh](https://www.zsh.org/) or [nushell](https://www.nushell.sh/)

## Future work

Have a fix? [Send me a PR!](link) Have an problem that you can't fix? Send an
[Issue Request](link).

- What about terminal emulators that aren't iTerm?
    - There are lots of terminal emulators that aren't iTerm. There are lots of
      folks that use splittable terminal emulators not on a Mac. I hear you,
      please send a PR, or at least write an [Issue](link)

- What about some other editor?
    - Sure you can do that, maybe I should make something support that.

- Installing this is janky.
    - Yup, sorry. It WFM but am HAPPY to take [PRs](link) to make this less
      jank. For instance an install script would be nice, but I also hate when
      things magically mess with my shell configs.

- Can I do this with `screen(1)`?
    - I spent 5m reading docs and couldn't figure it out. I don't thing screen
      has this ability. 

## Credits

Author: @timball
Date: Fri Sep 19 15:44:18 EDT 2025

## License
GPLv3
Keep this open source forever.
