#!/bin/bash

ELM_FILE_PATH="$1"
#HTML_FILE_PATH=$(sed 's/src/'"$Date"'/g' <<<"$Test")
#HTML_FILE_PATH=${${ELM_FILE_PATH/\.elm}/src\/}
HTML_FILE_PATH=${ELM_FILE_PATH/\.elm}
HTML_FILE_PATH=${HTML_FILE_PATH/\.\/src\/}
HTML_FILE_PATH=${HTML_FILE_PATH/src\/}
HTML_FILE_PATH="${HTML_FILE_PATH}.html"

#echo "$HTML_FILE_PATH"

elm make "$ELM_FILE_PATH" --output "${HTML_FILE_PATH}"
elm reactor
