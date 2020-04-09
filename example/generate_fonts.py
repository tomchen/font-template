import fontforge

font = fontforge.open('output.sfd')

font.generate('output.otf')
font.generate('output.ttf')
font.generate('output.woff')
font.generate('output.woff2')
