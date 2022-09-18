#!/usr/bin/dash

B_path="${1%/}"
img="codeshot_$(date +%Y-%m-%d_%H:%M:%S).jpg"
scrot "$img" -z -a $(slop -f '%x,%y,%w,%h')
[ ! -f "$img" ] && notify-send "No screenshot captured." && exit 0
code="$(tesseract --psm 6 $img - | sed 's|^|        |')"
mv "$img" "$B_path/images/"
echo "\n![code shot](./images/$img)\n" >> "$B_path/main.md"
echo "$code\n" >> "$B_path/main.md"
