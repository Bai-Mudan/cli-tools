function jvm() {
    # shellcheck disable=SC2155
    export JAVA_HOME=$(/usr/libexec/java_home -v "$@")
    java -version
}