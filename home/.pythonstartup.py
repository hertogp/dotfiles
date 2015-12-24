"""
Python startup script.
"""

# add $home/lib/python to python path
import sys
import os
sys.path.append(os.path.join(os.getenv('HOME'), 'lib/python'))

# add completion to python prompt
#import rlcompleter
#import readline
#readline.parse_and_bind("tab: complete")

# clean up
del sys, os
