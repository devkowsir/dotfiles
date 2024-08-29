#!/usr/bin/dash

b_path="${1%/}"
t_name="$2"
t_index="$(echo $t_name | sed 's| .*||')"
img="${t_index}_codeshot_$(date +%Y-%m-%d_%H:%M:%S).jpg"
scrot "$img" -z -a $(slop -f '%x,%y,%w,%h')
[ ! -f "$img" ] && notify-send "No screenshot captured." && exit 0
code="$(tesseract --psm 6 $img -)"
mv "$img" "$b_path/images/"
echo "\n![code shot](./images/$img)" >> "$b_path/$t_name.md"
echo "\`\`\`JS\n$code\n\`\`\`" >> "$b_path/$t_name.md"
