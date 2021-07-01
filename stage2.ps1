#=============================================================================
# This script runs as the second stage of the Wiki update, called from
# wiki_update.ps1.  This script allows us to update content outside of the
# directories that are under Git version control (i.e., outside of those for
# which we can run 'git pull').
#
# Commands run by this script can either be (a) executed every time this
# script is run, (b) executed only once, or (c) executed only when
# specifically requested.
#
# In the case of commands that are executed only once, a unique tag - a string
# of text - is used to identify a set of commands.  Before a set of commands
# is executed, the file /scripts/stage2.tags is checked and the commands are
# executed only if the tag is not found.  At the end of the set of commands,
# the stage2.tags file is updated with that set's associated tag.  This
# prevents that set of commands from being executed multiple times.
#
# A unique tag is also used to identify a set of commands that are executed
# only when specifically requested.  In this case, the tag must be specified
# on the command line to this script.  This script is normally called from
# the wiki_update.ps1 script; wiki_update.ps1 passes any command-line
# arguments to this script.
#
#-----------------------------------------------------------------------------
# 2020.06.29   GJS   Original script
#-----------------------------------------------------------------------------

#=============================================================================
Function executeOnceCheck($tagToCheck)
{
# check the tags file
    $true
}

#=============================================================================
Function executeOnceSaveTag($tagToCheck)
{
# update the tags file - include tag and date info
    $true
}

#=============================================================================
Function executeOnDemandCheck($tagToCheck)
{
# check to see if this tag was one of the arguments passed to the script
    $true
}

#=============================================================================
# main script
#-----------------------------------------------------------------------------
# Use this section to execute commands that are executed every time the Wiki
# update process is run.  No special checks are performed before executing
# the commands.

# Invoke-Expression -Command /scripts/example.ps1

#-----------------------------------------------------------------------------
# Use this section to execute commands that are executed only once.

$currentTag='execute once tag'  # use var to avoid typos between here and executeOnceSaveTag() call
if (executeOnceCheck($currentTag)){
    # put commands here
    $currentTag

    executeOnceSaveTag($currentTag)
}

# Clean up the tags in the tag file; delete anything over 90 days old

#-----------------------------------------------------------------------------
# Use this section to execute commands that are executed only when
# specifically requested.

if (executeOnDemandCheck('execute on demand tag'))
    # put commands here
    'execute on demand tag'
}

# Use this section to execute commands that are executed 
# blah, blah, blah...
