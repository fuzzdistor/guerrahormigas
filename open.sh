#!/bin/zsh

PROYECTO="GuerraHormigas"

PHARO_BIN="/home/fuzz/Pharo/vms/120-x64/pharo"
IMAGE_PATH="/home/fuzz/Pharo/images/"$PROYECTO"/"$PROYECTO".image"

SOURCE_DIR="/home/fuzz/"$PROYECTO"/src"
GENERATED_DIR="/home/fuzz/"$PROYECTO"/gen"

OUTPUT_FILE=""$PROYECTO"_gen.st"

# check if GENERATED_DIR exists and create it if necessary 
if [ ! -d "$GENERATED_DIR" ]; then
    mkdir -p "$GENERATED_DIR"
fi

echo "" > "$GENERATED_DIR"/"$OUTPUT_FILE"

for file in "$SOURCE_DIR"/*.st; do
    if [ -f "$file" ]; then
        cat "$file" >> "$GENERATED_DIR"/"$OUTPUT_FILE"
        echo "" >> "$GENERATED_DIR"/"$OUTPUT_FILE"
        echo "! !" >> "$GENERATED_DIR"/"$OUTPUT_FILE"
    fi
done

#sed -i -E 's/^([[:alnum:]_]+)( [[:alnum:]_]+)? >> ([[:alnum:]_])[[:space:]]*("([^"]+)")?$/! !\n!\1\2 methodsFor:'\''\5'\''!\n\3/' "$GENERATED_DIR"/"$OUTPUT_FILE"
# make the CLASS [class] >> MESSAGE[possible arguments] ["possible protocol"] into !CLASS [class] methodsFor:'[possible protocol]'!\nMESSAGE[possible arguments]
sed -i -E 's/^([[:alnum:]_]+)( [[:alnum:]_]+)? >> ([^"]+)[[:space:]]*?("?([^"]+)"?)?$/! !\n!\1\2 methodsFor:'\''\5'\''!\n\3/' "$GENERATED_DIR"/"$OUTPUT_FILE"
# fill empty methods protocols with 'as yet unclassified'
sed -i -E "s/methodsFor:''/methodsFor:'as yet unclassified'/" "$GENERATED_DIR"/"$OUTPUT_FILE"
# correctly delimit package with ! character on class declaration
sed -i -E "s/^[[:space:]]*package:[[:space:]]*'([[:alnum:]_]+)'[[:space:]]*$/    package: '\1'!/" "$GENERATED_DIR"/"$OUTPUT_FILE"
# change linefeeds into ^M characters for better formatting
sed -i -E ':a;N;$!ba;s/\n/\r/g' "$GENERATED_DIR"/"$OUTPUT_FILE"

# TODO: fix multiple linebreaks on comments for some reason

$PHARO_BIN $IMAGE_PATH load "$GENERATED_DIR"/"$OUTPUT_FILE"

