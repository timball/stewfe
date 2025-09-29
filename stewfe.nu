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
  } else if ($env.TERM_PROGRAM? == "iTerm.app" and 'SSH_CLIENT' not-in $env) {
    debug_print "Inside iTerm2 no ssh"
    ^$"($env.HOME)/bin/stewfe" $"($file)"
  } else if ($env.TERM_PROGRAM? == "ghostty" and 'SSH_CLIENT' not-in $env) {
    debug_print "Inside Ghostty and not ssh'ed"
    ^$"($env.HOME)/bin/ghostty_vi" $"($file)"
  } else {
    debug_print "Default editor session"
    ^$"($env.EDITOR)" $"($file)"
  }
}
