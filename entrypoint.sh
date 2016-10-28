#!/bin/bash
if [ ! -f /debug0 ]; then
    touch /debug0
    run_opts=''

    while getopts ':hsd' flag; do
        case "${flag}" in
            h)
                echo "options:"
                echo "-h  show brief help"
                echo "-s  setup mode, no nginx/uwsgi, direct start and call the --setup process."
                echo "-d  internal server mode, direct start with 'python app.py'"
                exit 0
                ;;
            s)
                echo "* setup mode selected..."
                touch /debug1
                run_opts='--setup'
                ;;
            d)
                echo "* internal/direct mode selected..."
                touch /debug1
                setup_mode=''
                ;;
            *)
                echo "Error: invalid options, see -h for help"
                break
                ;;
        esac
    done
fi

if [ -e /debug1 ]; then
    echo "* Running app with internal server"
    if [ "${run_opts}" == "--setup" ]; then
        echo "** - setup mode enabled..."
    fi
    python todo.py ${run_opts}
else
    echo "* Something went horribly wrong; you need to run this app using either -d or -s, see -h for more details..."
    exit 1
fi
