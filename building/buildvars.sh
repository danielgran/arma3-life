SERVERMODS="$(pwd)/../src/servermods"
SERVERCONFIG="$(pwd)/../src/serverconfiguration"
CLIENTMISSIONS="$(pwd)/../src/clientmissions"


PREPROCESSOR_OUTPUT="$(pwd)/../preprocessor-output"

DESTINATION="$(pwd)/../dist"

SERVERMODS=$(realpath $SERVERMODS)
SERVERCONFIG=$(realpath $SERVERCONFIG)
CLIENTMISSIONS=$(realpath $CLIENTMISSIONS)
PREPROCESSOR_OUTPUT=$(realpath $PREPROCESSOR_OUTPUT)
DESTINATION=$(realpath $DESTINATION)