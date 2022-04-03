SERVERMODS="$(pwd)/../src/servermods"
SERVERCONFIG="$(pwd)/../src/serverconfiguration"
CLIENTMISSIONS="$(pwd)/../src/clientmissions"
BINARIES="$(pwd)/../src/root"
PREPROCESSOR_OUTPUT="$(pwd)/../preprocessor-output"
DESTINATION="$(pwd)/../dist"

BINARIES=$(realpath $BINARIES)
SERVERMODS=$(realpath $SERVERMODS)
SERVERCONFIG=$(realpath $SERVERCONFIG)
CLIENTMISSIONS=$(realpath $CLIENTMISSIONS)
PREPROCESSOR_OUTPUT=$(realpath $PREPROCESSOR_OUTPUT)
DESTINATION=$(realpath $DESTINATION)