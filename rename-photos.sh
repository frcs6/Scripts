# Repair
#find . -iname '*jpg' -exec jhead -n"IMG_%Y%m%d_%H%M%S" {} +

# Find and rename IMG file
source_dir="/data/Photos/New"
target_dir="/data/Photos/Toutes/Classées"
find_expr="SL_MO_VID_"
for fullfile in "$source_dir"/"$find_expr"*; do
    filename=$(basename -- "$fullfile")
    extension="${filename##*.}"
    filename="${filename%.*}"

    new_folder="$target_dir/${filename:4:4}/${filename:4:4}-${filename:8:2}"
    new_filename="${filename:4:4}-${filename:8:2}-${filename:10:2} ${filename:13:2}-${filename:15:2}-${filename:17:2}"
    tpl_fullfile="$new_folder/$new_filename"
    new_fullfile="$tpl_fullfile.$extension"

    i=1
    while [ -f "$new_fullfile" ]; do
        new_fullfile="$tpl_fullfile-$i.$extension"
        i=$((i + 1))
    done

    echo "$fullfile --> $new_fullfile"

    mkdir -p "$new_folder"
    mv "$fullfile" "$new_fullfile"
done
