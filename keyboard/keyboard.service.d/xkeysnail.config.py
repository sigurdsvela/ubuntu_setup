import re
from xkeysnail.transform import *

define_keymap(None, {
	# Line Start/End
    K("Super-LEFT"): K("home"),
	K("Super-RIGHT"): K("end"),
	K("Super-Shift-LEFT"): K("Shift-home"),
	K("Super-Shift-RIGHT"): K("Shift-end"),
	K("Super-UP"): K("PAGE_UP"),
	K("Super-DOWN"): K("PAGE_DOWN"),
	K("Shift-Super-UP"): K("Shift-PAGE_UP"),
	K("Shift-Super-DOWN"): K("Shift-PAGE_DOWN"),

	# Line Start/End
    K("M-LEFT"): K("C-LEFT"),
	K("M-RIGHT"): K("Super-RIGHT"),
	K("M-Shift-LEFT"): K("Super-Shift-LEFT"),
	K("M-Shift-RIGHT"): K("Super-Shift-Right"),

	K("LSuper-SPACE"): K("LC-SPACE"),
	K("LC-SPACE"): K("LSuper-SPACE"),
})
