"""
Python startup script.
- only read when pointed to by PYTHONSTARTUP
- only executed when starting an interactive prompt

"""

# add $home/lib/python to python path
import sys
import os
sys.path.append(os.path.join(os.getenv('HOME'), 'lib/python'))

# add completion to python prompt
import rlcompleter
import readline
readline.parse_and_bind("tab: complete")

print()
print("Ran {!r} for more pleasant REPL experience".format(os.getenv('PYTHONSTARTUP')))
print("- added {!r} to python path".format(os.getenv('HOME'), 'lib/python'))

# clean up
del sys, os
