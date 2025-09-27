DEBUG=0
function debug_print {
    if [[ ${DEBUG} == 1 ]]; then
        echo $@
    fi
}

function stewfe() {
    if [[ ${TMUX} ]]; then
        debug_print "Inside tmux"
        eval "tmux split-window \-h ${EDITOR} \"$@\""
        return 0
    elif [[ ${LC_TERMINAL} == "iTerm2" && ${SSH_CLIENT} == "" ]]; then
        debug_print "Inside iTerm2 and not ssh'ed"
        eval "stewfe_editor \"$@\""
        return 0
    else
        debug_print "Default"
        eval "${EDITOR} \"$@\""
        return 0
    fi
}
