-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                    Global Variables & Themes                ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

-- Initialize a dedicated global theme table

-- Generated Asset Target
_G.image = "{{image}}"

-- Generated Material You Theme Colors
<* for name, value in colors *>
_G.{{name}} = "rgba({{value.default.hex_stripped}}ff)"
<* endfor *>