#!/usr/bin/env python

import argparse

class Color():
    def __init__(self, term, gui):
        self.term = term
        self.gui   = gui


class Rule():
    def __init__(self, name, style, fg, bg):
        self.name = name
        self.style = style
        self.fg = fg
        self.bg = bg


class Rules():
    def __init__(self):
        self._rules = []

    def add(self, *args):
        self._rules.append(Rule(*args))

    def print_gui(self):
        pass

    def print_term(self):
        max_name  = max(len(x.name) for x in self._rules)
        max_style = max(len(x.style) for x in self._rules)
        max_fg    = max(len(x.fg.term) for x in self._rules)
        max_bg    = max(len(x.bg.term) for x in self._rules)

        for r in self._rules:
            name  = f"hi {r.name.ljust(max_name)}  "
            style = f"cterm={r.style.ljust(max_style)}  "
            fg    = f"ctermfg={r.fg.term.ljust(max_fg)}  "
            bg    = f"ctermbg={r.bg.term.ljust(max_bg)}"

            l =  name
            l += style if r.style    else " "*len(style)
            l += fg    if r.fg.term  else " "*len(fg)
            l += bg    if r.bg.term  else " "*len(bg)
            print(l)

    def print_gui(self):
        max_name  = max(len(x.name) for x in self._rules)
        max_style = max(len(x.style) for x in self._rules)
        max_fg    = max(len(x.fg.gui) for x in self._rules)
        max_bg    = max(len(x.bg.gui) for x in self._rules)

        for r in self._rules:
            name  = f"hi {r.name.ljust(max_name)}  "
            style = f"cterm={r.style.ljust(max_style)}  "
            fg    = f"ctermfg={r.fg.gui.ljust(max_fg)}  "
            bg    = f"ctermbg={r.bg.gui.ljust(max_bg)}"

            l =  name
            l += style if r.style    else " "*len(style)
            l += fg    if r.fg.gui  else " "*len(fg)
            l += bg    if r.bg.gui  else " "*len(bg)
            print(l)


class App():
    def get_rules(self):
        r = Rules()
        r.add('Normal',         '',                 white,      bg)
        r.add('Comment',        '',                 bblack,     default)
        r.add('Constant',       '',    	            red,        default)
        r.add('Operator',	    'bold',	            green,      default)
        r.add('Statement',      'bold',	            blue,       default)

        r.add('SignColumn',     '',	                default,    bg)

        r.add('Directory',      '',                 blue,       default)
        r.add('ErrorMsg',	    'bold',	            red,	    black)
        r.add('NonText',	    '',	                bblack,     default)
        r.add('SpecialKey',     '',	                bblack,     default)
        r.add('LineNr',	        '',	                bblack,     default)
        r.add('IncSearch',      'reverse',          default,    default)
        r.add('Search',         '',			        black,	    yellow)
        r.add('Visual',	        'bold',		        white,	    bblack)
        r.add('VisualNOS',	    'bold,underline',   default,    default)
        r.add('MoreMsg',        '',			        green,      default)
        r.add('ModeMsg',	    'bold',	            default,    default)
        r.add('Question',       '',			        green,      default)
        r.add('WarningMsg',     '',			        red,	    default)
        r.add('WildMenu',       '',			        black,      yellow)
        r.add('Folded',         '',		            bwhite,     black)
        r.add('FoldColumn',     '',		            blue,       white)

        # Diff
        r.add('DiffAdd',        '',			        default,	blue)
        r.add('DiffChange',     '',			        default,	magenta)
        r.add('DiffDelete',	    'bold',		        bblue,      cyan)
        r.add('DiffText',	    'bold',		        default,	red)

        # Window separator lines
        r.add('StatusLine',	    '',                 white,      none)
        r.add('StatusLineNC',	'',	                white,      none)
        r.add('VertSplit',     'bold',	            bblack,     none)
        r.add('Title',	        '',			        magenta,    default)

        # Popup menu
        r.add('Pmenu',		    '',			        white,      black)
        r.add('PmenuSel',	    'bold',			    white,      bblack)

        r.add('PreProc',        '',		            blue,       default)
        r.add('Type',	        '',			        green,      default)

        r.add('Identifier',     '',	                green,      default)
        r.add('Ignore',         '',			        bblack,     default)
        r.add('Error',	        'bold',			    red,        black)
        r.add('Todo',	        'bold',			    black,      yellow)
        r.add('Underlined',	    'underline',		blue,       default)
        r.add('Self',			'', 		        bblack,     default)

        r.add('Number',	        '',			        red,        default)
        r.add('String',	        '',			        red,        default)
        r.add('Character',	    '',			        red,        default)
        r.add('Number',	        '',			        red,        default)
        r.add('Boolean',	    '',			        red,        default)
        r.add('Float',		    '',			        red,        default)

        r.add('Function',		'bold',	            green,      default)
        r.add('Conditional',	'bold',		        blue,       default)
        r.add('Repeat',		    'bold',	            blue,       default)

        r.add('Label',		    '',			        blue,       default)
        r.add('Keyword',	    '',			        blue,       default)
        r.add('Exception',	    'bold',	            blue,       default)

        # C stuff
        r.add('Include',		'bold',	            blue,       default)
        r.add('Define',		    '',		            blue,       default)
        r.add('Macro',		    '',			        blue,       default)
        r.add('PreCondit',	    '',			        blue,       default)
        r.add('StorageClass',   '',		            green,      default)
        r.add('Structure',	    'bold',		        green,      default)
        r.add('Typedef',	    'bold',		        green,      default)
        return r

    def parse_args(self):
        parser = argparse.ArgumentParser(description='Generate themes')
        parser.add_argument('-g', '--gui',         help="print out gui theme", action='store_true')
        parser.add_argument('-t', '--term',        help="print out term theme", action='store_true')
        args = parser.parse_args()

        r = self.get_rules()

        if args.gui:
            r.print_gui()
        else:
            r.print_term()

    def run(self):
        self.parse_args()


# color mapping is used in get_rules() to map IDs to colors
black    = Color('black',     '#444444')
bblack   = Color('darkgray',  '#888888')
red      = Color('red',       '#FF8278')
bred     = Color('',          '#FF8278')
green    = Color('green',     '#A6E22E')
breen    = Color('',          '#B6E354')
yellow   = Color('yellow',    '#EADC84')
byellow  = Color('',          '#EADC84')
blue     = Color('blue',      '#77BEE0')
bblue    = Color('lightblue', '#77BEE0')
magenta  = Color('magenta',   '#DD91F3')
bmagenta = Color('',          '#DD91F3')
cyan     = Color('cyan',      '#9999CC')
bcyan    = Color('',          '#9999CC')
white    = Color('white',     '#DDDDDD')
bwhite   = Color('',          '#CCCCCC')
bg       = Color('235',       '#2E2E2E')
fg       = Color('',          '#848484')
default  = Color('',          '')
none     = Color('NONE',      'NONE')



if __name__ == "__main__":
    app = App()
    app.run()
