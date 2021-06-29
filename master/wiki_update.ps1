#=============================================================================
# wiki_update.ps1
#
# Script to update the Wiki, labs, and related content on the VM by retrieving
# content from GitHub repositories.
#
#-----------------------------------------------------------------------------
# (original)   JH    Original script
#
# 2020.06.14   IV    Added Wiki rebuild after 'git pull' commands
#
# 2020.06.28   GJS
#
#  - organized commands into logical blocks
#  - moved Wiki rebuild and clearing Google Chrome cache to an 'if' block;
#    only execute if updates to source content were retrieved
#  - updated labyrinth check to include a check for an existing file
#    /var/www/sec530-wiki/labyrinth/weblabyrinth, to avoid an error condition
#    where the 'ln' command attempts to create a symlink over an existing file
#  - added comments
#-----------------------------------------------------------------------------

# Update content in the /labs directory structure, discarding any local
# changes to files.
Set-Location /labs
sudo -u student git reset --hard origin/master
sudo -u student git pull

# Update content in the /var/www/sec530-wiki directory structure, discarding
# any local changes to files.  Capture the results of the 'git pull' so that
# we can check whether any updates were retrieved.
Set-Location /var/www/sec530-wiki
git reset --hard origin/mkdocs-migration
git pull | Tee-Object -variable strWikiGitResults

# Update content in the /scripts directory structure, discarding any local
# changes to files.
Set-Location /scripts
git reset --hard origin/master
git pull

# Check the results of the Wiki 'git pull'; if there were any updates, then
# rebuild the Wiki site.
if($strWikiGitResults -ne 'Already up-to-date.'){
    docker run -it -v /var/www/sec530-wiki:/mkdocs hasecuritysolutions/mkdocs:1.3

    # Clear the Google Chrome cache so that Wiki updates are reflected in
    # the browser without students having to do a hard refresh of pages.
    Remove-Item -path ~/.cache/google-chrome/ -recurse -ErrorAction SilentlyContinue | Out-Null
}

# If the /var/www/sec530-wiki/labyrinth directory exists and
# /var/www/sec530-wiki/labyrinth/weblabyrinth does *not* exist, then create a
# symbolic link from /opt/weblabyrinth to
# /var/www/sec530-wiki/labyrinth/weblabyrinth.
if((Test-Path -Path '/var/www/sec530-wiki/labyrinth') -and -not(Test-Path -Path '/var/www/sec530-wiki/labyrinth/weblabyrinth')){
    ln -s /opt/weblabyrinth/ /var/www/sec530-wiki/labyrinth
}

# As a final step, update this script file.
#
# We can't directly maintain this file on the GitHub repository.  If we did,
# then running the 'git pull' would potentially update this script while it
# was running and cause a problem if the running process refers to the source
# file.  Instead we use the following steps:
#
#  - Update the /scripts/master/wiki_update.ps1 as part of the 'git pull'
#    (executed above when updating the /scripts directory).
#
#    That file is considered the master copy of the wiki_update.ps1 script.
#
#  - Move and rename the running /scripts/wiki_update.ps1 file.
#
#    Since we're moving and renaming within the same file system, its inode is
#    preserved and the running process continues without errors until exit.
#
#  - Copy the new /scripts/master/wiki_update.ps1 file to
#    /scripts/wiki_update.ps1.
#
#    The new version of the file is now ready for the next execution of
#    /scripts/wiki_update.ps1.

# Continue if:
#  - /scripts/master/wiki_update.ps1 exists
#  - /scripts/master/wiki_update.ps1 and /scripts/wiki_update.ps1 aren't the
#    same
if((Test-Path -Path '/scripts/master/wiki_update.ps1') -and ((Get-FileHash /scripts/wiki_update.ps1 -Algorithm 'SHA256').Hash -ne (Get-FileHash /scripts/master/wiki_update.ps1 -Algorithm 'SHA256').Hash)){
    # Make sure that the /scripts/backup directory exists.  This is where
    # we'll keep up to 3 old copies of the wiki_update.ps1 script (for
    # emergency recovery).
    if (-not(Test-Path -Path /scripts/backup)){
        New-Item -Path /scripts/ -Name backup -ItemType Directory | Out-Null
    }

    # move rename the running /scripts/wiki_update.ps1 file
    Move-Item -Path /scripts/wiki_update.ps1 -Destination ('/scripts/backup/wiki_update.ps1.' + (Get-Date -format 'yyyy-MM-dd.HH-mm-ss'))
}

#=============================================================================
