#=============================================================================
# This script runs as the second stage of the Wiki update, called from
# wiki_update.ps1.  This script allows us to update content outside of the
# directories under Git version control (i.e., outside of those noted above,
# for which we ran 'git pull').
#
# Commands run by this script are intended to either be (a) always executed
# every time this script is run, or (b) executed only once.  In the case of
# commands that are executed only once, a unique tag (a string of text) is
# used to identify a given set of commands.  Before a set of commands is
# executed, the file /scripts/stage2.tags is checked and the commands are
# executed only if the tag is not found.  At the end of the set of commands,
# the stage2.tags file is updated with that set's associated tag.  This
# prevents that set of commands from being executed multiple times.
#
# Examples of 
#
#-----------------------------------------------------------------------------
# 2020.06.29   GJS   Original script
#-----------------------------------------------------------------------------

# Use this section to run commands that are executed every time the Wiki
# update process is run.

# do whatever you need to do...

# now update the primary wiki_update.ps1 script
'bob, uncle'
