# Font Template: simplest way to create your own font using Adobe Illustrator and FontForge

Adobe Illustrator font templates that allow you to edit shapes of glyphs (characters) altogether in the same .ai file (or in their separate, respective .ai files if you want), then export them as SVG files, which can be imported into font file in free and open-source font maker [FontForge](https://fontforge.org/) and generate final production font files.

## Files

* **font_template.ai**: Adobe Illustrator font template for basic and extended symboles and latin letters (significant CP1252 coverage), each glyph has a separate art board, so that you can easily export each of them as individual glyph SVG file.
* **font_template_single.ai**: Adobe Illustrator font template for a single glyph. If you want, you can use this file instead of (or along with) font_template.ai.
* **batch_import_svg.py**: a python script that can import multiple SVG individual glyph files into FontForge's font file

## Usage

Open font_template.ai, draw your glyphs in the "Artwork glyph" layer

![AI font template](https://github.com/tomchen/font-template/blob/master/img/1-ai_font_template.png)

![AI menu export](https://github.com/tomchen/font-template/blob/master/img/2-ai_menu_export.png)

![AI export](https://github.com/tomchen/font-template/blob/master/img/3-ai_export.png)

![FontForge import](https://github.com/tomchen/font-template/blob/master/img/4-fontforge_import.png)

![FontForge adjust width](https://github.com/tomchen/font-template/blob/master/img/5-fontforge_adjust_width.png)

![FontForge menu generate font](https://github.com/tomchen/font-template/blob/master/img/6-fontforge_menu_generate_font.png)

![FontForge generate font](https://github.com/tomchen/font-template/blob/master/img/7-fontforge_generate_font.png)

### Other optional workflow
#### Export all glyphs as individual SVG files
In the menu, click File -> Execute Script

Copy and paste: `SelectWorthOutputting(); foreach Export("svg"); endloop;`

Select "FF" radial button.

Click "OK" button.

## References and credits

How to Design a custom font using Illustrator and FontForge  
https://www.schoolofmotion.com/blog/custom-font-illustrator-fontforge  
*This project is highly inspired by the fantastic article above which has its own single glyph template, although my template here has different guide proportion, and the native artboard export in lieu of a 3rd-party MultiExporter is used in the font creation flow described by this project.*

Font creation template  
https://community.fontself.com/t/font-creation-template/165  
*This project is highly inspired by Fontself community's awesome template, as my template pick the same glyphs and has the same order. However, my template is a total remake, and does not require Fontself software.*

Notes on dumping SVG outlines into a FontForge file  
https://gist.github.com/psmay/fd3e7e91893f6012b262

FontForge: Export a font's individual glyphs into svg files in batch?  
https://stackoverflow.com/questions/56179680/fontforge-export-a-fonts-individual-glyphs-into-svg-files-in-batch

How to import fontforge to python in windows 7  
https://stackoverflow.com/questions/23365299/how-to-import-fontforge-to-python-in-windows-7

AGL (Adobe Glyph List) glyphlist.txt  
https://github.com/adobe-type-tools/agl-aglfn/blob/master/glyphlist.txt

## License
[MIT License](https://github.com/tomchen/font-template/blob/master/LICENSE)