INSIDERS_DIR="/Applications/Visual Studio Code - Insiders.app/Contents/Resources/app/bin"
DIR="/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

if [ -d "$INSIDERS_DIR" ]; then
  PATH="$INSIDERS_DIR:$PATH"
elif [ -d "$DIR" ]; then
  PATH="$DIR:$PATH"
fi
