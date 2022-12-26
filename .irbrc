# enable completion in irb
require 'irb/completion'

# setup some irb behaviour
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:PROMPT_MODE] = :SIMPLE

