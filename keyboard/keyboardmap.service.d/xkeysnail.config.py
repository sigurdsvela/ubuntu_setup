import re
from xkeysnail.transform import *

define_keymap(None, {
	# Cursor Moovment
    K("Super-LEFT"): K("home"),
	K("Super-RIGHT"): K("end"),
	K("Super-Shift-LEFT"): K("Shift-home"),
	K("Super-Shift-RIGHT"): K("Shift-end"),
	K("Super-UP"): K("PAGE_UP"),
	K("Super-DOWN"): K("PAGE_DOWN"),
	K("Shift-Super-UP"): K("Shift-PAGE_UP"),
	K("Shift-Super-DOWN"): K("Shift-PAGE_DOWN"),
	K("M-LEFT"): K("C-LEFT"),
	K("M-RIGHT"): K("C-RIGHT"),
	K("M-Shift-LEFT"): K("C-Shift-LEFT"),
	K("M-Shift-RIGHT"): K("C-Shift-Right"),

	K("M-BACKSPACE"): K("C-BACKSPACE"), # Delete to beginning of word
	K("M-DELETE"): K("C-DELETE"), # Delete to end of word
	K("Super-BACKSPACE"): K("C-U"), # Delete to beginning of line


	# Clippboard
	K("Super-c"): K("C-c"), #Copy
	K("Super-v"): K("C-v"), #Paste
	K("Super-x"): K("C-x"), #Cut

	# UndoRedo
	K("Super-z"): K("C-z"), #Undo
	K("Super-Shift-z"): K("C-Shift-z"), #Redo

	# Save
	K("Super-S"): K("C-S"), #Save
	K("Super-Shift-S"): K("C-Shift-S"), #Save As

	# Window Controll
	K("C-LEFT") : K("Super-LEFT"), #Workspace Left
	K("C-RIGHT") : K("Super-RIGHT"), #Wordspace Right
	K("C-UP") : K("Super-S"), #Show All Windows
	K("C-DOWN") : K("Super-S"), #Show All Windows
	K("Super-Tab") : K("RAlt-Tab"), #Show All Windows
	K("Super-Shift-Tab") : K("RAlt-Shift-Tab"), #Show All Windows


	# Application Controll
	K('Super-F'): K('C-F'), # Find
	K('Super-W'): K('C-W'), # Close Window
	K('Super-Q'): K('C-Q'), # Close Application
})

define_keymap(re.compile("Firefox", re.IGNORECASE), {
	K('Super-T'): K('C-T'),
	K('Super-Shift-T'): K('C-Shift-T'),
	K('Super-Enter'): K('Alt-Enter'),
})


define_keymap('Io.elementary.terminal', {
	K("Super-c"): K("C-Shift-c"),
	K("Super-v"): K("C-Shift-v")
})

define_keymap(re.compile("code|vscode", re.IGNORECASE), {
	K("Super-Alt-DOWN") : K("Super-RAlt-DOWN"),
	K("Super-Alt-UP") : K("Super-RAlt-UP")
})
