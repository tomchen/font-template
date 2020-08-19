# Font Template: the simplest way to create your own font using Adobe Illustrator and FontForge

Adobe Illustrator font templates that allow you to edit shapes of glyphs (characters) altogether in one `.ai` file (or in their separate, respective `.ai` files if you want), then export them as `.svg` files, which can be imported into a font file in free and open-source font maker [FontForge](https://fontforge.org/), and generate final production font files (`.otf`, `.ttf`, `.woff`, `.woff2`, etc.).

## Files

* **`font_template.ai`** ([download](https://github.com/tomchen/font-template/raw/master/font_template.ai)): Adobe Illustrator font template for basic and extended symbols and latin letters (significant CP1252 coverage), each glyph has a separate artboard, so that you can easily export each of them as individual glyph SVG file.
* **`font_template_single.ai`** ([download](https://github.com/tomchen/font-template/raw/master/font_template_single.ai)): Adobe Illustrator font template for a single glyph. If you want, you can use this file instead of (or along with) `font_template.ai`.
* **`batch_import_svg.py`** ([open](https://github.com/tomchen/font-template/raw/master/batch_import_svg.py), then <kbd>Ctrl</kbd>+<kbd>S</kbd> / <kbd>Cmd</kbd>+<kbd>S</kbd> to save): a python script that can import multiple SVG individual glyph files into FontForge's `.sfd` font file (and can optionally convert it to production font files, i.e. `.otf`, `.ttf`, `.woff`, `.woff2`, etc.)

(Instead of downloading the files, you may also `git clone` or [download the whole repository](https://github.com/tomchen/font-template/archive/master.zip))

(**ATTENTION: FontForge Windows Version 20200314 crashes when importing SVG files. This has been fixed but a newer FontForge stable version hasn't been released yet. For now, Windows user should use either a recent non-release build ([2020-08-15 build](https://ci.appveyor.com/api/buildjobs/gvptvmuefmyfmiw7/artifacts/fontforgebuilds%2FFontForge-mingw-w64-i686-829d9e-appveyor.7z)), or old Version 20190801 release ([download](https://github.com/fontforge/fontforge/releases/download/20190801/FontForge-2019-08-01-Windows.exe)).** FontForge Linux versions do not have this bug)

## Usage

Open `font_template.ai`, draw your glyphs in the "Artwork glyph" layer.

(It doesn't matter if your glyph is partially and slightly outside its artboard.)

![AI font template](https://github.com/tomchen/font-template/blob/master/img/1-ai_font_template.png)

After finishing drawing the glyphs, hide "Example glyph" layer. Click "File" -> "Export" -> "Export for Screens".

![AI menu export](https://github.com/tomchen/font-template/blob/master/img/2-ai_menu_export.png)

Select the glyphs you want to export (do not select empty ones), select "SVG" format, click "Export Artboard".

![AI export](https://github.com/tomchen/font-template/blob/master/img/3-ai_export.png)

Exported individual glyph SVG files are inside an "SVG" folder, put it in a folder that also contains the `batch_import_svg.py` script file.

For Windows users, run `C:\Program Files (x86)\FontForgeBuilds\fontforge-console.bat`,* navigate to the folder using `cd <FOLDER_PATH>` and execute the Python script using `ffpython batch_import_svg.py`. An `output.sfd` font file will be generated.

For Mac and Linux users, `cd <FOLDER_PATH>` and execute the `batch_import_svg.py` file with Python 3.

*(\*: for 64 bit Windows it's `Program Files (x86)`, for 32 bit Windows it's `Program Files`)*

![FontForge import](https://github.com/tomchen/font-template/blob/master/img/4-fontforge_import.png)

Open the `output.sfd` font file with FontForge. Adjust glyphs' width (use <kbd>Shift</kbd> key to select all the glyphs you want to adjust width, then, in the menu, select "Metrics" -> "Auto Width", OR, double click a glyph and manually drag its border line).

![FontForge adjust width](https://github.com/tomchen/font-template/blob/master/img/5-fontforge_adjust_width.png)

In the menu, select "File" -> "Generate Fonts..."

![FontForge menu generate font](https://github.com/tomchen/font-template/blob/master/img/6-fontforge_menu_generate_font.png)

Type in a font name, select a font format (typically TrueType or OpenType), click "Generate" button. Then you have your self-made computer font!

![FontForge generate font](https://github.com/tomchen/font-template/blob/master/img/7-fontforge_generate_font.png)

You can stop here and do not need to read the following sections.

## Other optional workflows and tips

### font_template_single.ai file

This font template can be used to draw single glyph and produce single glyph SVG.

The following image depicts the guides of a single glyph.
![Font template single description](https://github.com/tomchen/font-template/blob/master/template_desc/font_template_single_description.png)

In FontForge, select a glyph or open a glyph, then click "File" -> "Import...", select "SVG" as "Format", select your single glyph SVG file and import it.

### batch_import_svg.py file

Modify `batch_import_svg.py` file if you want to open an existing `.sfd` font file, or generate `.otf`, `.ttf`, `.woff`, `.woff2` directly, instead of doing so with FontForge GUI.

### Export all glyphs as individual SVG files in FontForge

In the FontForge menu, click "File" -> "Execute Script"

Copy and paste: `SelectWorthOutputting(); foreach Export("%e_%n.svg"); endloop;`

Select "FF" radial button.

Click "OK" button.

### Join overlapping paths

If a glyph's shape contains multiple overlapping paths, it would be better to join them ([a nice YouTube tutorial](https://www.youtube.com/watch?v=ESj0M0l6Rho)) instead of grouping them or making them a compound path. This step helps to avoid font rendering problems for overlapping paths. However, for seperate (non-overlapping) paths, feel free to use "group" (<kbd>Ctrl</kbd>+<kbd>G</kbd>) or "compound path" ("Object" -> "Compound Path" -> "Make").

### Use existing free and open-source font file

Instead of creating a font file with FontForge from scrach, it's sometimes a good idea to use an existing free and open-source font file as a base and fallback font. Typical open-source fonts with good glyph coverage are Adobe's [Source Sans Pro](https://github.com/adobe-fonts/source-sans-pro/tree/release/TTF) and [Source Serif Pro](https://github.com/adobe-fonts/source-serif-pro/tree/release/TTF). Choose a weight such as "Regular", depending on your needs. Open the font file with FontForge, edit it to create your font. However, if you use an existing font, you may need to edit not only A-Z, a-z but also their [ligatures](https://fontforge.org/docs/tutorial/editexample4.html#creating-a-ligature) such as "ff" and "fi".

### Do not use empty glyphs

When you select glyphs in Illustrator's "Export for Screens" window, you should not select empty glyphs, otherwise, you will see "I'm sorry this file is too complex for me to understand (or is erroneous)" warning when you executing `batch_import_svg.py` script. Nevertheless, the script will not be interrupted and will continue to generate the `output.sfd` file.

### Update your font_template.ai before 2020-08-19

On 19 August 2020, the project's `font_template.ai` file was updated (many artboard names were changed, e.g. `44 ,` were changed to `44 comma`) to fix an [Unicode filename issue](https://github.com/tomchen/font-template/issues/3). If you have downloaded `font_template.ai` before 2020-08-19 and made your `.ai` file based on the old version, you may optionally update the artboard names in your `font_template.ai` by executing an Adobe Illustrator script file [**`/other_files/update_artboard_names.js`**](https://github.com/tomchen/font-template/raw/master/other_files/update_artboard_names.js): open your `.ai` file in Adobe Illustrator, in the menu, click "File" -> "Scripts" -> "Other Script...", find and select `/other_files/update_artboard_names.js` file, click "Open", done. After the update, delete then regenerate your glyph SVG files in `SVG` folder. If you haven't encountered any Unicode or filename related problem, you may continue to use the old version.

### Web fonts (alphabet or icon)

Once you have your own font, you can use it on your web pages (including websites, web applications, Electron-compiled cross-plateform Desktop applications, or even React Native / NativeScript mobile app).

Your font can be alphabet font or monochrome icon font. If you want to show color icons, use SVG or PNG.

Put your `.woff2` and `.woff` font files (`my_font.woff2` and `my_font.woff` in the example) in your CSS folder and insert the following code in your CSS file (it [supports](https://css-tricks.com/snippets/css/using-font-face/#practical-level-of-browser-support) IE9+):

```css
@font-face {
  font-family: 'MyFont';
  src: url('my_font.woff2') format('woff2'),
       url('my_font.woff') format('woff');
}
```

(If you do not want to [support any IE](https://caniuse.com/#search=woff2), you can delete the `.woff` file and use only `.woff2` (the smallest and latest format))

Then use your customized `font-family` name ('MyFont' in the example):

```css
.my-special-font {
  font-family: 'MyFont', sans-serif;
  color: yellow;
  font-size: 20px;
}
```

HTML:

```html
<span class="my-special-font">B</span>
```

If it is a monochrome icon font, the letter B in the HTML code will be shown as the monochrome icon mapping to the letter B. Although web developers usually use characters in Unicode [Private Use Area](https://en.wikipedia.org/wiki/Private_Use_Areas) such as U+EEA0 and U+F2BB instead of basic latin letters and other commonly-used characters over semantics / SEO / accessibility concerns, nobody prevents you from using latin letters. To address those concerns, you may semantically identify a font icon by adding `role` and `aria-label` attributes to your HTML element:

```html
<span role="img" aria-label="A bag" class="my-special-font">B</span>
```

## Real-world example

[Erathian language font in the universe of *(Heroes of) Might and Magic* game series](https://github.com/might-and-magic/erathian-font)

## References and credits

How to Design a custom font using Illustrator and FontForge  
https://www.schoolofmotion.com/blog/custom-font-illustrator-fontforge  
*This project is highly inspired by the fantastic article above which has its own single glyph template, although my template here has different guide proportion, and the native artboard export in lieu of a 3rd-party MultiExporter is used in the font creation flow described by this project.*

Font creation template  
https://community.fontself.com/t/font-creation-template/165  
*This project is highly inspired by Fontself community's awesome template, as my template picks the same glyphs and has the same order. However, my template is a total remake, and does not require Fontself software.*

Notes on dumping SVG outlines into a FontForge file  
https://gist.github.com/psmay/fd3e7e91893f6012b262

FontForge: Export a font's individual glyphs into svg files in batch?  
https://stackoverflow.com/questions/56179680/fontforge-export-a-fonts-individual-glyphs-into-svg-files-in-batch

How to import fontforge to python in windows 7  
https://stackoverflow.com/questions/23365299/how-to-import-fontforge-to-python-in-windows-7

AGL (Adobe Glyph List) glyphlist.txt  
https://github.com/adobe-type-tools/agl-aglfn/blob/master/glyphlist.txt

Using @font-face  
https://css-tricks.com/snippets/css/using-font-face/#practical-level-of-browser-support

Semantically identifying a font icon with role="img"  
https://www.w3.org/WAI/WCAG21/Techniques/aria/ARIA24.html

## License

[MIT License](https://github.com/tomchen/font-template/blob/master/LICENSE) for everything in this repository
