DIR="/Applications/Visual Studio Code - Insiders.app/Contents/Resources/app/bin"

if [ -d "$DIR" ]; then
  PATH="$DIR:$PATH"
fi
