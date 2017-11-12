# locally downloaded packages
find ${GOPATH}/src/ -maxdepth 2 -mindepth 2 | sed "s~${GOPATH}/src/~~"
find ${GOPATH}/src/ -maxdepth 3 -mindepth 2 -type d -not -name '.*' | sed "s~${GOPATH}/src/~~"
# pipe to `wc -l` to count
