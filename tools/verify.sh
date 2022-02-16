#! /bin/zsh

function signed() {
    BASE_FILE=${2/*\//}
    wget -nc -nv --no-check-certificate "$2" || { echo "Could Not Download $BASE_FILE"; exit 1; }
    wget -nc -nv --no-check-certificate "$2.$1" || return 0 # Signature missing, skip
    gpg --verify "$BASE_FILE.$1" || { echo "Cannot Verify $BASE_FILE Download"; exit 1; }
    rm "$BASE_FILE.$1" || { echo "Could Not Cleanup Download for $BASE_FILE"; exit 1; }
}

function signed-ni() {
    BASE_FILE=${1/*\//}
    PACKAGE=${BASE_FILE//_*/}
    BLOCK=$(sed -e '/Package: '"$PACKAGE"'$/,/Priority/!d' < Packages) || { echo "Could Not Open Packages"; return; }
    SHA=$(echo "$BLOCK" | grep 'SHA256' | sed -e 's/.*: //g')
    wget -nc -nv --no-check-certificate $1 || { echo "Could Not Download $BASE_FILE"; exit 1; }

    # Requires two spaces
    echo "$SHA  $BASE_FILE" | shasum -a 256 -c - || { echo "Cannot Verify $BASE_FILE Download"; exit 1; }
}
