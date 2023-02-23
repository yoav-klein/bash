

function exec_curl() {
    method=$1; shift
    uri=$1; shift
    # it's important to quote $@ as such "$@"
    # since it not, Content-Type: and application/json will be 2 separate words
    args=("$@")

    for arg in "${args[@]}"; do
        echo "arg: $arg"
    done
}


args=(-H "Content-Type: application/json" -d {"name":"Yoav"})
exec_curl GET "/" "${args[@]}"

# it's important to quote "${args[@]}" because if not
# Contet-Type: and application/json will arrive as 2 separate words
