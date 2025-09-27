#!/usr/bin/env nu

const DEBUG = false
def debug_print [msg: string] {
  if $DEBUG {
    print $msg
  }
}

def stewfe [file: string] {

  if ('TMUX' in $env) {
    debug_print "Inside tmux"
    ^$"tmux" "split-window" "-h" "vim" $"($file)"
  } else if ($env.LC_TERMINAL? == "iTerm2" and 'SSH_CLIENT' not-in $env) {
    debug_print "Inside iTerm2 no ssh"
    ^$"($env.HOME)/bin/iterm_vi" $"($file)"
  } else {
    debug_print "Default editor session"
    ^$"($env.EDITOR)" $"($file)"
  }
}
