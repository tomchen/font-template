mkdir -p SVG

cp "../example/SVG/65 A.svg" .

(cat ../template_desc/font_template-glyph_list-char-dec-filename_table.txt; echo) | sed 1d | while IFS=$'\t' read -r -a arr
do
 cp "65 A.svg" "SVG/${arr[2]}.svg"
done
rm "65 A.svg"

cp ../batch_import_svg.py .

# Windows
# run C:\Program Files (x86)\FontForgeBuilds\fontforge-console.bat, navigate to the folder using cd <FOLDER_PATH> and execute the Python script by using:
# ffpython batch_import_svg.py

# Mac / Linux
# fontforge -lang=py -script batch_import_svg.py
