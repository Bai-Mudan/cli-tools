function jvm --description "change JAVA home with version, name or vendor"
     set -gx JAVA_HOME ( /usr/libexec/java_home -v $argv )
     java -version
end