#! /usr/bin/env bash

function code() {
    pkg_path='/Applications/Visual Studio Code - Insiders.app'
    bin_path='Contents/Resources/app/bin/code'
    exe_path=$(printf '%s/%s' "${pkg_path}" "${bin_path}");
    "${exe_path}" "$@"
}

export code