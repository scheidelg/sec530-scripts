# FINISHED:
#  - 1.1
#  - 1.2
#  - 1.3
#  - 1.4
#  - 2.1 EXCEPT:
#
#     TO DO: set OpenVPN-Start parameter $ip_version to only accepp values '4' and '6'
#
#     TO DO: test [ OpenVPN-Start '6' ] (ex 2.3) -- and then update ex. 2.3 example precheck output
#
#     TO DO: check whether the OpenVPN process successfully started, based on $openvpn_process values
#
#     TO DO: TEST 'audit' precheck and postcheck when you actually have network connectivity...
#
#     TO DO: identify (test) whether telnet will terminate on a SIGINT; if so, then add $true to the arguments for the [ Processes-Named-All-Stop 'telnet' ] command; if not, make sure that $true isn't an argument
#
#     TO DO: create a screenshot for the xfce4-terminal window that opens for the OpenVPN connection
#
#  - 2.2
#
#  - 2.3 EXCEPT THE NOTES ABOVE FOR 2.1 !!!
#
#  - 2.4 --- in progress
#
#     TO DO: find PowerShell commands to create the empty file and change ownership
#
#  - 3.1

#===============================================================================
# (info on what each of the cleanup, postcheck, and precheck checks are intended
# for)
#
# To have a set of commands executed as part of the cleanup, postcheck, or
# precheck for a given EXERCISE_LABEL, create functions named:
#
#     _Exercise-EXERCISE_LABEL-cleanup
#     _Exercise-EXERCISE_LABEL-postcheck
#     _Exercise-EXERCISE_LABEL-precheck
#
# (info that you don't have to create a precheck function if there's a cleanup script or postcheck function)
#
# (info on Universal-* functions, how they work)
#
# (info on order of Universal and _Exercise-*-* functions, with examples)
#
# (info on the x_hash -- or a reference to the information further in the comments)
#
# (info on error handling)
#
#-------------------------------------------------------------------------------
# NOTE: We *could* have different precheck functions kick off new terminal
# windows with Docker containers that provide terminal output or are even
# interactive, instead of having the student start them.  However, this would
# (as far as I can see, without getting really convoluted) require that we:
#
#  - run this script with 'sudo -E' (instead of just 'sudo')
#
#  - start the Docker containers with 'sudo -E -u student xfce4-terminal -x
#    DOCKER_COMMAND', for example:
#
#        sudo -E -u student xfce4-terminal -x docker run -it -u root
#        -p 10443:10443 -p 10080:10080 -v /labs/polarproxy:/var/log/PolarProxy
#        --name polarproxy gscheidel/polarproxy
#
#  - and maybe use Start-Process so that we can start as a detacted process...
#-------------------------------------------------------------------------------

# TO DO: change all labels off of numbers and to plain key words

# TO DO: add bonus challenges and steps to exercise 1.3 (layer 2 attacks)

# TO DO: any new PNG files:
#  - copyright info on any new PNG files
#  - save in your local EWB GitHub, save in local SEC530-labs-v4 GitHub;
#    commit & push both

# TO DO: review all functions and make sure variables are declared with scope
# and variable type

# TO DO: add 'sudo password tip' to all Exercise Cleanup instructions that call check.ps1

# TO DO: make sure functions are named using 'object-verb' (e.g., Help-Display)

# TO DO: make sure functions are listed in alphabetical order

# Run through all exercises and update as you go.
#
# Then come back and look at any functions or checks that aren't associated with
# current exercises, and figure out what to do with them.
#
# Then come back and address all of your comments, 'NOTE', and 'TO DO' items
#
# Also, it looks like we need to review the /labs subdirectories.  For example,
# /labs/3.3/mitmproxy was still there even though ex. 3.3 is using PolarProxy
# and w/PolarProxy didn't (until I just created one) have a precheck or postcheck
# step.

# TO DO: consider moving all exercise labels to works instead of exercise numbers

# TO DO: update all exercise instructions for new postcheck/precheck messages

# TO DO: VPN exercises need to have termination of the VPN as part of the cleanup for sure; maybe as part of the
# postcheck (if one exists) - probably create a function that terminates any openvpn processes
#
# currently these exercises don't have precheck or postcheck instructions, so that would need to be added to the
# exercise instructions.  for postcheck, would still need "close any open terminal window" message (see exercise 1.1
# for an example).

# TO DO: exercise instructions - remediating web vulnerabilities - add precheck / postcheck instructions

# TO DO: update individual precheck, postcheck, cleanup scripts to have return values that can be referenced by
# calling functions, and then used as a basis for displaying "success / you may proceed" or
# "failure / ask your instructor for help" messages

# TO DO: for the PCAP analysis exercise:
#  - copy the PCAP files to a /labs directory on GitHub
#  - have the precheck script check for that directory and if present then delete the files from the Desktop and instead
#    symlink to that /labs directory
#  - log a GitHub issue - the Desktop PCAPS directory can be removed from the /home/student/Desktop

# TO DO: look at all exercises that use PCAPs, and see whether the hash checks that are in *some* of the exercises
# can/should be replicated to all such exercises

# TO DO: move the top-level change history information to a separate file

# TO DO: update 2.1 exercise instructions to include the precheck script, and the "cleaning up..."
# message that is displayed

# should there be a sigma postcheck?  are there containers that need to be stopped?

# TO DO: look at Web-Vulnerabilities, and calls to it from 4.1 and remediating... cleanly
# allocate actions across/to precheck, postcheck, and cleanup

# TO DO: Exercise instruction update: NEED TO UPDATE EXERCISE 2.2 INSTRUCTIONS TO NOT PERFORM POSTCHECK!
# TO DO: Exercise instruction update: UPDATE 2.2 ADMONITION ABOUT DELETING john.pot to note that the exercise precheck script does this

# TO DO: Update exercises with prechecks and postchecks so that example text shows the 'Stopping any Docker containers...'
# text.

# make sure there are two blank lines between each function

# for intro comments for _Exercise* functions, just have one intro up top w/general explanation, and
# then individual comments only for things specific to that function

# add 'you may proceed', 'clean up complete, 'post-check complete' messages to all executions
#
# AND UPDATE THE LAB INFORMATION ACCORDINGLY!!!


# TO DO : script intro comments at the very top of the script file

# move 3.3 prep steps into a precheck, postcheck, and/or cleanup

# in functions listing the available exercise labels, SORT THE VALUES

# when populating $x_hash, make sure to check whether the hash already exists, if needed to set the first value... !!!

# function intro / comments for documentation, including variable definitions & author/date

# MAKE SURE TO ADD COPYRIGHT INFO TO THE MAIN COMMENTS BLOCK!!!


# update notes (scratch pad text):
#   kept core functionality and "look and feel" when executed with no errors;
#    minor updates to commands run for exercise prechecks, postchecks, and cleanups.

# - changed terminology from 'lab' to 'exercise' [2023.05.13 GJS]
#
# - added "-ForegroundColor $color_error" to all "Please ask your instructor
#   for help" messages [2023.05.13 GJS]
#
# - tweaked argument prompts [2023.05.13 GJS]
#
# - tweaked '-check' error message [2023.05.13 GJS]
#
# - moved /labs/dtf/es_data check to after argument checks [2023.05.13 GJS]
#
# - added '-h' and '-help' options [2023.05.13 GJS]
#
# - got rid of interactive input of '-check' and '-exercise' value arguments
#   [2023.05.13 GJS]
#
# - updated exercise argument checks
#
#    - added "remediate"
#
#    - updated error message so that it lists valid exercise labels
#
#    - changed order of array items to preferred order to list in error message
#
#    - changed 'all' to 'ALL', case-sensitive
#
#   [2023.05.13 GJS]
#
# - updated precheck, postcheck, and cleanup actions for '1.2' and '2.2'
#
#    - got rid of "1.2" precheck and postcheck; both were hold-overs from when
#      exercise 1.2 was the "Router SNMP Security" exercise with John the Ripper
#
#    - moved Cleanup-John() contents to _Exercise-2.2-cleanup(), since it's only
#      called from there; deleted Cleanup-John()
#
#    - removed Docker-Containers-Stop() call from _Exercise-2.2-*(); it isn't needed in
#      postcheck since no Docker containers are started or used in this exercise
#
#    - removed cleanup actions from _Exercise-2.2-postcheck() - not needed; and
#      from _Exercise-2.2-precheck() - automatically calls
#      _Exercise-2.2-cleanup()
#
#    - after the above changes, there's nothing left in _Exercise_precheck-2.2()
#       or _Exercise_Postcheck-2.2(); deleted the functions
#   [2023.05.15 GJS]
#
# - added 'Stopping any Docker containers...' message to Docker-Containers-Stop()
#   [2023.05.15 GJS]
#
# - "Auditing Router Security" - updates to 2.1 and 2.5
#
#   2.5 precheck, postcheck, and cleanup were from old versions of the exercises
#   where 2.5 was "Auditing Router Security", which is now 2.1.
#
#    - Moved 2.5 cleanup actions to 2.1 cleanup function, and added info message
#      "Removing any previous working files..."
#
#    - Updated cleanup to refer to the correct (new) filenames created during
#      the exercise
#
#    - Deleted old 2.5 precheck and postcheck actions; they only called
#      Docker-Containers-Stop, and no containers are used in this exercise
#
#   [2023.05.15 GJS]
#
# - Removed old '3.3' precheck and postcheck; these were hold-overs from when
#   exercise 3.3 used mitmproxy. [2023.05.18 GJS]

#===============================================================================
# Set function attributes for the script.  Note that this must be done before
# any function definitions, script code, or variable assignments.

# Disable positional parameters, so that a user has to use named arguments. For
# example, we want the user to type something like this:
#
#     check.ps1 -exercise 1.1 -check precheck
#
# And not be able to use:
#
#     check.ps1 1.1 precheck
[CmdletBinding(PositionalBinding=$false)]

# Basic argument processing and assignment to parameters. We're not using
# advanced param() features because we don't need them; and this is to be
# executed by the user from the command-line and we want fine control over the
# error messages.  The advantage of using param() here is that it allows easy
# assignment of named argument values to parameters; the primary disadvantage
# (that we're living with) is that we don't have fine control over the error
# message when arguments are used without a argument value, or when arguments
# arguments are used multiple times.
param (
    [Alias('ex','x')]
    [string]$exercise = '',
    [Alias('l')]
    [string]$lab = '',
    [Alias('s')]
    [string]$sub = '',
    [Alias('c')]
    [string]$check = '',
    [Alias('help')]
    [switch]$h = $false,
    [switch]$v = $false
)


#===============================================================================
# function _Exercise-*-*
#-------------------------------------------------------------------------------
# These notes apply to all _Exercise-*-* functions (e.g.,
# _Exercis-cleanup-1.1, _Exercise-postcheck-5.2, _Exercise-precheck-egress).
#
# See general script comments for an explanation of how the _Exercise-*-*
# functions are used.
#
#-------------------------------------------------------------------------------
# General post-2023-05-13 changes:
#
#  - Moved exercise-specific actions from if{} statements to individual
#    functions that are called for each exercise.
#
#  - Removed individual 'you may proceed' and similar messages from precheck
#    actions, since generic 'success' messages are now automatically displayed
#    after all successful executions of the script
#
#-------------------------------------------------------------------------------
# Arguments: (none)
#
#-------------------------------------------------------------------------------
# Return: (none)
#
#-------------------------------------------------------------------------------


#===============================================================================
# function _Exercise-TEST-cleanup
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-TEST-cleanup {
    if ($v) { Write-Host 'Inside: _Exercise-TEST-cleanup' }
}


#===============================================================================
# function _Exercise-TEST-postcheck
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-TEST-postcheck {
    if ($v) { Write-Host 'Inside: _Exercise-TEST-postcheck' }
}


#===============================================================================
# function _Exercise-TEST-precheck
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-TEST-precheck {
    if ($v) { Write-Host 'Inside: _Exercise-TEST-precheck' }
}


#===============================================================================
# function _Exercise-flow-postcheck
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-flow-postcheck {
    Set-Location /labs/1.4

    docker-compose stop

    # remove the container; filter output to ignore normal output strings:
    #     "No stopped containers" (if we run this w/out any of the
    #                              docker-compose containers being present in a
    #                              stopped state)
    (docker-compose rm -s -f 2>&1) | Select-String -Pattern "^No stopped containers$" -NotMatch
}


#===============================================================================
# function _Exercise-flow-precheck
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-flow-precheck {
    # always stop all Docker containers as part of the precheck of any exercise
    # that uses containers
    Docker-Containers-Stop $true

    # putting blank lines here only because the docker-compose output is funky
    # vis-a-vis redrawing the screen cursor position; the blank lines keep
    # previous command output from being overwritten
    Write-Host
    Write-Host
    Set-Location /labs/1.4
    docker-compose up -d

    WebServices-Verify `
        ( `
            ('9200', $false, 'sec530', 'Elasticsearch', $true), `
            ('5601', $false, '/app/kibana', 'Kibana', $false) `
        )
}


#===============================================================================
# function _Exercise-2.4-cleanup
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-2.4-cleanup {

    Write-Host 'Restoring /labs/2.4/student/auth and /labs/2.4/squid.conf...'

    # remove both files
    #
    # First check for whether they exist, so that if they don't then we don't
    # generate an error; then remove *without* ignoring errors so that we do
    # get other errors.
    if (Test-Path -Path '/labs/2.4/student/auth') {
        Remove-Item -Recurse -Force /labs/2.4/student/auth
    }
    if (Test-Path -Path '/labs/2.4/squid.conf') {
        Remove-Item -Recurse -Force /labs/2.4/squid.conf
    }

# TO DO: find PowerShell commands to create the empty file and change ownership
    # create the empty auth file and change ownership
    touch /labs/2.4/student/auth
    chown student:student /labs/2.4/student/auth

    # restore the squid.conf from the backup
    Copy-Item -Force /labs/2.4/backup/squid.conf /labs/2.4/squid.conf

<#
# TO DO: Delete this old content after testing the new version
x    # EDIT: only try to delete the file if it already exists, and then don't
x    # ignore errors.
x    #
x    # Review how this file impacts regular web communications; if it has an
x    # impact then it more properly belongs in the postcheck actions.
x    Remove-Item -Force /labs/2.4/student/auth -ErrorAction SilentlyContinue

x    # EDIT: instead of squid_original.conf, use /labs/2.4/backup/squid.conf;
x    # and DO NOT igore errors
x    #
x    # ALSO... This more properly belongs in postcheck, to restore the original
x    # environment.
x    Copy-Item -Force /labs/2.4/squid_original.conf /labs/2.4/squid.conf -ErrorAction SilentlyContinue
#>
}


#===============================================================================
# function _Exercise-2.4-postcheck
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-2.4-postcheck {

    [string]$local:iptables_command = ''
    [string]$local:iptables_output = ''

    # stop the Docker containers that were started during this exercise
    Write-Host "Checking for and stopping webserver and squid..."
    Docker-container-stop 'webserver'
    Docker-container-stop 'squid'

    # delete the iptables rules that were created during the exercise
    iptables-Rule-Delete 'OUTPUT' 'DROP all -- 0.0.0.0/0 172.17.0.3'
    iptables-Rule-Delete 'OUTPUT' 'LOGGING all -- 0.0.0.0/0 172.17.0.3'

    # flush all rules from and delete LOGGING
    foreach ($iptables_command in ('-F LOGGING', '-X LOGGING') {
        # run the iptables command, filtering out the 'No chain/target/match by
        # that name' error
        $iptables_output = (iptables $iptables_command 2>&1) | Select-String -SimpleMatch 'iptables: No chain/target/match by that name.' -NotMatch

        # if there was any other error, then throw it
        if ($iptables_output -ne $null) {
            throw "[throw]'iptables $iptables_command 2>&1' error: $iptables_output"
        }
    }


<#
# TO DO: Delete this old content after testing the new version
x    # EDIT: granularly stop Docker containers, instead of stopping all
x    Docker-Containers-Stop

x    # EDIT: be more granular - get rid of the specific iptables rules and chains
x    #
    # BUT.... I wonder if there's a way to be reset the iptables service so that
    # it reverts to the configuration in place after startup... then we wouldn't
    # have to worry about whether a student mangled the commands.
x    iptables -F

    # EDIT: instead of just giving a warning to the user, figure out how to
    # programmatically change the proxy back to System Proxy (AND TEST IT)
    Write-Host 'Make sure you have changed your proxy back to System Proxy before proceeding' -ForegroundColor $color_info
#>
}


#===============================================================================
# function _Exercise-2.4-precheck
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-2.4-precheck {
    # always stop all Docker containers as part of the precheck of any exercise
    # that uses containers
    Docker-Containers-Stop $true

<#
# TO DO: Delete this old content after testing the new version
    # EDIT: don't need these lines, because they'll be done in either the
    # post-check or cleanup... confirmed, cleanup
    Remove-Item -Force /labs/2.4/student/auth -ErrorAction SilentlyContinue
    Copy-Item -Force /labs/2.4/squid_original.conf /labs/2.4/squid.conf

    # move this to whichever of post-check or cleanup removes this file, so that
    # generic/standard file is created instead of just deleting the version
    # modified during the exericse... confirmed, cleanup; include the 'chown'
    touch /labs/2.4/student/auth

    # ??? why do we need to restart the entire Docker service, vs. just a
    # specific container?
    service docker restart

    # keep - check prechecks for earlier exercises to see if we already have
    # a wrapper function
    docker start squid

    # instead of going to sleep after starting squid, create some sort of check
    # that confirms whether Squid is responding... Oh look, there's one
    # below!
    Start-Sleep -Seconds 1

    # same comment as for 'docker start squid'
    docker start webserver

    # same general comment as for the previous Start-Sleep
    Start-Sleep -Seconds 5

    # use your existing WebServices-Verify function for this
    $check = 1
    if($(curl http://172.17.0.2:3128) -match 'squid'){
        Write-Host 'Squid is running' -ForegroundColor $color_info
    } else {
        Write-Host 'Squid is not running' -ForegroundColor $color_error
        $check = 0
    }

    # use your existing WebServices-Verify function for this
    $output = (Invoke-WebRequest -Uri http://172.17.0.3 -Proxy http://172.17.0.2:3128).Content
    if($output -match 'Connection forwarded courtesy of'){
        Write-Host 'Web proxy pre-verification passed' -ForegroundColor $color_info
    } else {
        Write-Host 'Web proxy connections from Squid to Web Server not working' -ForegroundColor $color_error
        $check = 0
    }

    # this is overkill... we already did the rm and touch at the top of this
    # (and we're planning on moving to either cleanup or postcheck)
    rm /labs/2.4/student/auth
    touch /labs/2.4/student/auth

    # OK, this isn't something we already did... check if there's an existing
    # file in the standard VM, then decide how to handle this
    chown student:student /labs/2.4/student/auth

    # not needed, because we'll throw errors if we need to abort, and the
    # general wrapper will print this message
    if($check -eq 1){
        Write-Host 'You may proceed with the exercise.' -ForegroundColor $color_success
    }
#>
}


#===============================================================================
# function _Exercise-3.1-cleanup
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-3.1-cleanup {
    Write-Host 'Removing generated log files, PCAP, and Bro output files...'
    Remove-Item -Recurse -Force -ErrorAction SilentlyContinue /labs/3.1/dnstunnel.pcap
    Remove-Item -Recurse -Force -ErrorAction SilentlyContinue /labs/3.1/bro
    Remove-Item -Recurse -Force -ErrorAction SilentlyContinue /labs/3.1/bro-dns

    Write-Host 'Removing copied ~/sensitive_data.csv file...'
    Remove-Item -Recurse -Force -ErrorAction SilentlyContinue /home/student/sensitive_data.csv
}


#===============================================================================
# function _Exercise-3.1-postcheck
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-3.1-postcheck {
    Docker-container-stop 'externalattackerbox' $true
}


#===============================================================================
# function _Exercise-3.1-precheck
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-3.1-precheck {
    # always stop all Docker containers as part of the precheck of any exercise
    # that uses containers
    Docker-Containers-Stop $true

    # start the externalattackerbox; we do *not* need to start the pcifileserver
    # for this exercise
    Docker-container-start 'externalattackerbox' $true

    # check for the existence and correct hash of sample1.pcap
    Check-File '/labs/3.1/sample1.pcap' '3040063E8BD7DC1690EB59A26DC9EE1B00CE1242' 'https://sec530.com/sample1.pcap'

    # check to make sure the externalattackerbox is live on the network
    if(-not (Test-Connection -ComputerName '5.30.5.2' -Quiet -Count 1)){
        throw "[throw]Something is wrong. Please ask your instructor for help."
    }
}


#===============================================================================
# function _Exercise-3.2-cleanup
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-3.2-cleanup {
    Remove-Item -Recurse -Force /labs/3.2/student/bro_logs/* -ErrorAction SilentlyContinue
    Remove-Item -Recurse -Force /labs/3.2/student/suricata_logs/* -ErrorAction SilentlyContinue
}


#===============================================================================
# function _Exercise-3.2-postcheck
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-3.2-postcheck {
    Docker-Containers-Stop
    Remove-Item -Recurse -Force /labs/3.2/student/bro_logs/* -ErrorAction SilentlyContinue
    Remove-Item -Recurse -Force /labs/3.2/student/suricata_logs/* -ErrorAction SilentlyContinue
}


#===============================================================================
# function _Exercise-3.2-precheck
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-3.2-precheck {
    if (!(Test-Path /labs/3.2/capture.pcap)){
        Invoke-WebRequest -Uri https://sec530.com/capture.pcap -OutFile /labs/3.2/capture.pcap
    }
    if((Get-FileHash -Path /labs/3.2/capture.pcap -Algorithm SHA1).Hash -ne 'E978D7BB4C559D6A0BF8829FF0B08AE2AEF7A636'){
        Write-Host 'PCAP for exercise is invalid. Downloading PCAP file.' -ForegroundColor Red
        Invoke-WebRequest -Uri https://sec530.com/capture.pcap -OutFile /labs/3.2/capture.pcap
    }
    cd /labs/3.2
    docker-compose up -d
    Wait-Elasticsearch 'sec530'
    Verify-FilebeatIsRunning
    Verify-LogstashIsRunning
    Verify-EveBoxIsRunning
    Write-Host "`nYou may proceed with the exercise."
}


#===============================================================================
# function _Exercise-4.1-postcheck
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-4.1-postcheck {
    Web-Vulnerabilities-Actions
}


#===============================================================================
# function _Exercise-4.1-precheck
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-4.1-precheck {
    Web-Vulnerabilities-Actions
}


#===============================================================================
# function _Exercise-4.2-postcheck
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-4.2-postcheck {
    Docker-Containers-Stop
}

#===============================================================================
# function _Exercise-4.2-precheck
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-4.2-precheck {
    Remove-Item -Force /labs/4.2/student/cc_finder.ps1 -ErrorAction SilentlyContinue
    # change the false positive to a number that isn't actually a valid Visa number
    sed -i 's/4754968841931981/4754968841931982/' /home/student/database_reference.csv
}


#===============================================================================
# function _Exercise-4.3-postcheck
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-4.3-postcheck {
    Docker-Containers-Stop
}


#===============================================================================
# function _Exercise-4.3-precheck
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-4.3-precheck {
}


#===============================================================================
# function _Exercise-5.1-cleanup
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-5.1-cleanup {
    Copy-Item -Force /etc/apache2/backup/000-default.conf /etc/apache2/sites-enabled/000-default.conf
    Remove-Item -Force /etc/apache2/ssl/* -ErrorAction SilentlyContinue
    service apache2 restart
}


#===============================================================================
# function _Exercise-5.1-postcheck
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-5.1-postcheck {
    Docker-Containers-Stop
}


#===============================================================================
# function _Exercise-5.1-precheck
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-5.1-precheck {
# TO DO: consider how this might need to be tweaked if this is ALREADY present...
# what happens if this precheck is run multiple times?
    # Modify /home/student/.bashrc so that the terminal prompt is prepended
    # by '(SSH client)' when connecting via SSH.  This provides a visual
    # indicator that is useful for an Ex 5.1 bonus step. - 2022.03.25 GJS
    sed -i 's/^PS1=\"\\n\${PS1} *\"/if [[ -n \$SSH_CLIENT ]]; then PS1=\"\\n(SSH client) \${PS1}\"; else PS1=\"\\n\${PS1}\"; fi/' /home/student/.bashrc

    docker rm -f secure_webserver
    chmod 777 /labs/5.1/index.php
    & docker run -d --name secure_webserver --net=bridge -p 443:443 -p 8080:80 -v /labs/5.1/apache/mods-enabled:/etc/apache2/mods-enabled -v /labs/5.1/apache/ssl:/etc/apache2/ssl -v /labs/5.1/apache/sites-enabled/000-default.conf:/etc/apache2/sites-enabled/000-default.conf -v /labs/5.1/index.php:/app/index.php -v /labs/5.1/apache/apache2.conf:/etc/apache2/apache2.conf tutum/apache-php
    Start-Sleep -Seconds 3
    # TO DO: need to review this and figure out why there's another instance of
    # Docker-Containers-Stop here, vs, stopping the specific
    # container that's started a few lines above this
    Docker-Containers-Stop
}


#===============================================================================
# function _Exercise-5.2-postcheck
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-5.2-postcheck {
    Docker-Containers-Stop
}


#===============================================================================
# function _Exercise-5.2-precheck
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-5.2-precheck {
    cd /labs/5.2
    docker-compose up -d
    Wait-Elasticsearch 'labmeinc'
    Verify-LogstashIsRunning
    Write-Host "`nYou may proceed with the exercise."
}


#===============================================================================
# function _Exercise-5.4-cleanup
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-5.4-cleanup {
    Copy-Item -Force /labs/5.4/backup/security.conf /etc/apache2/conf-enabled/security.conf -ErrorAction SilentlyContinue | Out-Null
    Copy-Item -Force /labs/5.4/backup/apache2.conf /etc/apache2/apache2.conf -ErrorAction SilentlyContinue | Out-Null
    Copy-Item -Force /labs/5.4/backup/000-default.conf /etc/apache2/sites-enabled/000-default.conf -ErrorAction SilentlyContinue | Out-Null
    Remove-Item -Force /var/www/sec530-wiki/site/labyrinth -ErrorAction SilentlyContinue
    #Copy-Item -Force /etc/apache2/backup/index.md /var/www/sec530-wiki/index.md
    service apache2 restart
}


#===============================================================================
# function _Exercise-5.4-postcheck
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-5.4-postcheck {
    Docker-Containers-Stop
}


#===============================================================================
# function _Exercise-5.4-precheck
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-5.4-precheck {
    Copy-Item -Force /labs/5.4/backup/security.conf /etc/apache2/conf-enabled/security.conf -ErrorAction SilentlyContinue | Out-Null
    Copy-Item -Force /labs/5.4/backup/apache2.conf /etc/apache2/apache2.conf -ErrorAction SilentlyContinue | Out-Null
    #Copy-Item -Force /labs/5.4/backup/modsecurity.conf /etc/modsecurity/modsecurity.conf -ErrorAction SilentlyContinue | Out-Null
    Copy-Item -Force /labs/5.4/backup/000-default.conf /etc/apache2/sites-enabled/000-default.conf -ErrorAction SilentlyContinue | Out-Null
    #Copy-Item -Force /etc/modsecurity/rules/local-rules.conf.bak /etc/modsecurity/rules/local-rules.conf -ErrorAction SilentlyContinue | Out-Null
    service apache2 restart
}


#===============================================================================
# function _Exercise-egress-cleanup
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-egress-cleanup {
    Write-Host 'Removing copied ~/sensitive_data.csv files...'
    if (Test-Path -Path '/home/student/sensitive_data.csv') {
        Remove-Item -Recurse -Force /home/student/sensitive_data.csv
    }
    if (Test-Path -Path '/labs/egress/apache2/uploads/sensitive_data.csv') {
        Remove-Item -Recurse -Force /labs/egress/apache2/uploads/sensitive_data.csv
    }
}


#===============================================================================
# function _Exercise-egress-postcheck
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
# Variables
#
# $iptables_command string     Loop variable used to hold the iptables commands
#                              to execute.
#
# $iptables_ouput   string     Output captured from the iptables commands.
#
#-------------------------------------------------------------------------------
function _Exercise-egress-postcheck {

    [string]$local:iptables_command = ''
    [string]$local:iptables_output = ''

    # stop the pcifileserver and externalattackerbox
    Write-Host "Checking for and stopping pcifileserver and externalattackerbox..."
    Docker-container-stop 'pcifileserver'
    Docker-container-stop 'externalattackerbox'

    # clean up iptables INPUT and OUTPUT rules
    Write-Host 'Cleaning up iptables rules...'
    iptables-Rule-Delete 'INPUT' 'LOGGING-IN all -- 0.0.0.0/0 0.0.0.0/0'
    iptables-Rule-Delete 'INPUT' 'DROP all -- 172.17.0.2 5.30.5.1'
    iptables-Rule-Delete 'OUTPUT' 'LOGGING-OUT all -- 0.0.0.0/0 0.0.0.0/0'
    iptables-Rule-Delete 'OUTPUT' 'ACCEPT udp -- 0.0.0.0/0 5.30.5.0/24 udp dpt:53'
    iptables-Rule-Delete 'OUTPUT' 'ACCEPT tcp -- 0.0.0.0/0 5.30.5.0/24 tcp dpt:443'
    iptables-Rule-Delete 'OUTPUT' 'DROP tcp -- 0.0.0.0/0 5.30.5.0/24 tcp dpt:10000'

    # flush all rules from and delete LOGGING-IN and LOGGING-OUT
    foreach ($iptables_command in ('-F LOGGING-IN', '-X LOGGING-IN', '-F LOGGING-OUT', '-X LOGGING-OUT') {
        # run the iptables command, filtering out the 'No chain/target/match by
        # that name' error
        $iptables_output = (iptables $iptables_command 2>&1) | Select-String -SimpleMatch 'iptables: No chain/target/match by that name.' -NotMatch

        # if there was any other error, then throw it
        if ($iptables_output -ne $null) {
            throw "[throw]'iptables $iptables_command 2>&1' error: $iptables_output"
        }
    }
}


#===============================================================================
# - consolidated two separate 'exercise egress precheck' sections from old
#   version of check.ps1 [2023.05.13 GJS]
#
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-egress-precheck {

    # always stop all Docker containers as part of the precheck of any exercise
    # that uses containers
    Docker-Containers-Stop $true

    # NOTE: Could put the 'docker start' commands in a wrapper function
    Write-Host "Starting pcifileserver and externalattackerbox..."
    Docker-container-start 'pcifileserver'
    Docker-container-start 'externalattackerbox'

    # make sure that the uploads directory is world-writable
    chmod 777 -R /labs/egress/apache2/uploads

    # check to make sure the pcifileserver and externalattackerbox are live on
    # the network
    if(-not ((Test-Connection -ComputerName '172.17.0.2' -Quiet -Count 1) -and (Test-Connection -ComputerName '5.30.5.2' -Quiet -Count 1))) {
        throw "[throw]Something is wrong. Please ask your instructor for help."
    }
}


#===============================================================================
# function _Exercise-ipv6-cleanup
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-ipv6-cleanup {
    # check for and remove the OpenVPN stderr file, just in case it wasn't
    # cleaned up in the OpenVPN-Start function
    Write-Host 'Removing temp files...'
    if (Test-Path -Path '/labs/xfce4-terminal-openvpn.err') {
        Remove-Item -Force /labs/xfce4-terminal-openvpn.err
    }
}


#===============================================================================
# function _Exercise-ipv6-postcheck
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-ipv6-postcheck {
    # terminate any OpenVPN processes
    Write-Host "Terminating any OpenVPN processes..."
    Processes-Named-All-Stop 'openvpn' $true 'OpenVPN'

    Write-Host "Terminating any telnet processes..."
    Processes-Named-All-Stop 'telnet'
# TO DO: identify whether telnet will terminate on a SIGINT; if so, then add $true to the arguments for the above command
}


#===============================================================================
# function _Exercise-ipv6-precheck
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-ipv6-precheck {
    # start the OpenVPN connection to the cloud router lab, and verify that it's
    # working
    OpenVPN-Start '6'
}


#===============================================================================
# function _Exercise-ja3-postcheck
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-ja3-postcheck {
    JA3-Actions
}


#===============================================================================
# function _Exercise-ja3-precheck
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-ja3-precheck {
    JA3-Actions
}


#===============================================================================
# function _Exercise-l2-precheck
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
# Variables
#
# $bonus_error_flag boolean    Flag used in verification loop for bonus PCAP
#                              files, to indicate if we've run into an error.
#
# $bonus_file       string[]   Temp variable used in the verification loop for
#                              bonus PCAP files
#
#-------------------------------------------------------------------------------
function _Exercise-l2-precheck {

    [boolean]$local:bonus_error_flag = $false
    [string []]$local:bonus_file = $null

    Write-Host "Checking for valid PCAP files..."

    # NOTE: Creating the /labs/layer2attacks/pcaps/ and
    # /labs/layer2attacks/pcaps/bonus/ directories won't do any good if we don't
    # have a way to populate the PCAPs.  See the note below about being able to
    # download missing or invalid PCAPs...

    # check for the existence of /labs/layer2attacks/pcaps/ directory; if
    # it doesn't exist, then create it
    if (-not (Test-Path -Path '/labs/layer2attacks/pcaps/')) {
        New-Item -ItemType Directory -Path '/labs/layer2attacks/pcaps/'
    }

    # check for the existence of /labs/layer2attacks/pcaps/bonus/ directory; if
    # it doesn't exist, then create it
    if (-not (Test-Path -Path '/labs/layer2attacks/pcaps/bonus/')) {
        New-Item -ItemType Directory -Path '/labs/layer2attacks/pcaps/bonus/'
    }

    # if /home/student/Desktop/pcaps/ doesn't exist, or exists but isn't a
    # symbolic link to /labs/layer2attacks/pcaps, then delete
    # /home/student/Desktop/pcaps and recreate as a symbolic link to
    # /labs/layer2attack/pcaps
    if (-not ((Test-Path '/home/student/Desktop/pcaps') `
        -and (Get-Item '/home/student/Desktop/pcaps').LinkType -ceq 'SymbolicLink' `
        -and (Get-Item '/home/student/Desktop/pcaps').Target -ceq '/labs/layer2attacks/pcaps')) {

        # NOTE: silently continuing on an error because we can get here if
        # /home/student/Desktop/pcaps doesn't exist at all.  We'll still catch
        # errors because New-Item will fail if an existing directory or file is
        # present.
        Remove-Item -LiteralPath '/home/student/Desktop/pcaps' -Force -Recurse -ErrorAction SilentlyContinue

        New-Item -ItemType SymbolicLink -Path '/home/student/Desktop/pcaps' -Target '/labs/layer2attacks/pcaps/' | Out-Null
    }

    # NOTE: Other exercises with PCAPs identify locations from which PCAPS can
    # be downloaded.  I don't know that these PCAPs are hosted anywhere, so
    # we're just checking for the file existence and valid SHA1 hash.

    # check for correct /home/student/Desktop/pcaps/[1,2,3,4,5,6].pcap
    Check-File '/home/student/Desktop/pcaps/1.pcap' 'CBDE82EEF14C94BEEB010E5EF15F5804BDE4D1E6'
    Check-File '/home/student/Desktop/pcaps/2.pcap' '187452C6517CEF2BAE5654E0A4FD7015CF83E5D4'
    Check-File '/home/student/Desktop/pcaps/3.pcap' '9E990663393BD49F6F134346CC6B80013A9DB0D8'
    Check-File '/home/student/Desktop/pcaps/4.pcap' '8BE28D2D2B5B1F04E977D4F9633F544E54D0DA20'
    Check-File '/home/student/Desktop/pcaps/5.pcap' '5176A678194B31C8E7B2ECE47A885248188F154B'
    Check-File '/home/student/Desktop/pcaps/6.pcap' '5D1CE3E268B54BE49B0EE91DFC10E19EF042700F'

    # now check for valid /home/student/Desktop/pcaps/bonus/*.pcap files

    foreach ($bonus_file in `
        ( `
            ('/home/student/Desktop/pcaps/bonus/6in4.pcap',   'BD1E508380A92D38B5C212C55CD5195413C12120'), `
            ('/home/student/Desktop/pcaps/bonus/6to4.pcap',   '847C5EF8F3AAF255E482553A96792F1E2D90B468'), `
            ('/home/student/Desktop/pcaps/bonus/arp.pcap',    '1E9146517230F6C8D9D132A1A1F6FD03A0E09F2B'), `
            ('/home/student/Desktop/pcaps/bonus/smurf.pcap',  'AB05C603B2A5108BBC9756B17228D279CF00B6D4'), `
            ('/home/student/Desktop/pcaps/bonus/Teredo.pcap', 'C6E7AE8A6D82F4786C347A406AF73DA7D4FDFF68') `
        )) { 

        # Since these are not essential to the exercise, we don't want to error
        # out if one of the files is invalid.  So catch errors and just warn if
        # there's a problem.
        try {
            Check-File $bonus_file[0] $bonus_file[1]
        } catch {
            if (-not $bonus_error_flag) {
                # flag that we've already caught one error with the bonus files,
                # so that we don't display this intro message once per bonus
                # file error
                $bonus_error_flag = $true

                Write-Host "WARNING: There is an error with one of the /home/student/Desktop/pcaps/bonus/ files. You can continue with the exercise, but won't be able to complete any bonus steps." -ForegroundColor $color_warning
            }

            # All 'throw' messages that we generate programmatically will start with the
            # string '[throw]' (because we'll make sure to start them that way).  If
            # this is an error that we threw, then display the message (but without the
            # leading '[throw]').
            if ($Error[0].FullyQualifiedErrorId.StartsWith('[throw]')) {
                Write-Host " - $($Error[0].FullyQualifiedErrorId.Substring(7))" -ForegroundColor $color_warning
            }

            # If this is not an error that we threw, then display the error as normal.
            else {
                $Error[0]
            }
        }
    }
}


#===============================================================================
# function _Exercise-polarproxy-cleanup
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-polarproxy-cleanup {
    Write-Host 'Removing downloaded PolarProxy CER files...'
    Remove-Item -Force /home/student/Downloads/polarproxy*.cer -ErrorAction SilentlyContinue

    Write-Host 'Removing /labs/polarproxy/polarproxy.pem file...'
    Remove-Item -Force /labs/polarproxy/polarproxy.pem -ErrorAction SilentlyContinue

    Write-Host 'Removing /labs/polarproxy/sec530.pcap file...'
    Remove-Item -Force /labs/polarproxy/sec530.pcap -ErrorAction SilentlyContinue
}


#===============================================================================
# function _Exercise-polaryproxy-postcheck
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
# Variables
#
# $rule_number      array      The rule numbers that match on the iptables rule
#                              used to redirect traffic to PolarProxy.
#
# $counter          integer    For loop counter; processing $rule_number to
#                              delete rules.
#
#-------------------------------------------------------------------------------
function _Exercise-polarproxy-postcheck {
    # stop and remove the polarproxy Docker container
    Docker-container-rm 'polarproxy' $true

    # Remove the Firefox certificate stores, into which the PolarProxy 
    # certifcate is imported during the exercise.
    #
    # NOTE: If libnss3-tools were installed on the SEC530 VM, then we could
    # use the certutil command to granularly delete the PolarProxy certificate,
    # instead of deleting the entire certificate database.
    Write-Host 'Removing any certificates imported into FireFox...'
    Get-ChildItem -Path /home/student/.mozilla/firefox/ -File -Include cert?.db -Recurse -Force -ErrorAction SilentlyContinue | Remove-Item -Force -ErrorAction SilentlyContinue

    # Get rid of the iptables rule that redirects 443/tcp to PolarProxy, if it
    # exists.
    #
    # There should only be one rule, but we do this as a loop in case the user
    # ran the command to add the rule multiple times.  Process the rules in
    # reverse order so that the identified rule numbers don't change as we
    # delete rules.
    #
    # NOTE: There may be other rules that have been automatically added to other
    # chains, but they will either have been removed with the PolarProxy Docker
    # container was terminated, or will be state-related and will time out.
    Write-Host "Removing any iptables 'redirect to PolarProxy' rules..."
    iptables-Rule-Delete 'OUTPUT' 'REDIRECT tcp -- 0.0.0.00 0.0.0.00 owner UID match 1000 tcp dpt:443 redir ports 10443' $true
}


#===============================================================================
# function _Exercise-polaryproxy-precheck
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-polarproxy-precheck {
    # always stop all Docker containers as part of the precheck of any exercise
    # that uses containers
    Docker-Containers-Stop $true
}


#===============================================================================
# function _Exercise-remediate-postcheck
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-remediate-postcheck {
    Remediate-Actions
}


#===============================================================================
# function _Exercise-remediate-precheck
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-remediate-precheck {
    Remediate-Actions
}


#===============================================================================
# function _Exercise-router-cleanup
#-------------------------------------------------------------------------------
# NOTE: The 'auditing a router' and 'SNMP security' exercises are very similar
# in terms of precheck, postcheck, and cleanup functions, so we're combining
# those functions and using ($sub -eq 'audit') and ($sub -eq 'snmp') to
# distinguish between the two when needed.
#
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-router-cleanup {
    # double-check $sub, in case script argument checking is messed up; if so,
    # throw an error
    #
    # check for a missing argument
    if ($sub -eq '') {
        throw '[throw]Missing $sub argument to _Exercise-router-cleanup'

    # if a different $sub argument was used, throw an error
    } elseif ($sub -cne 'audit' -and $sub -cne 'snmp') {
        throw '[throw]Invalid $sub argument passed to _Exercise-router-cleanup'
    }

    Write-Host 'Removing any previous working files...'

    # delete working files relevant to the 'Auditing Router Security' exercise
    if ($sub -eq 'audit') {
        if (Test-Path -Path '/home/student/router12.conf') {
            Remove-Item -Force /home/student/router12.conf
        }
        if (Test-Path -Path '/home/student/Desktop/router12.html') {
            Remove-Item -Force /home/student/Desktop/router12.html
        }
        if (Test-Path -Path '/home/student/router13.conf') {
            Remove-Item -Force /home/student/router13.conf
        }
        if (Test-Path -Path '/home/student/Desktop/router13.html') {
            Remove-Item -Force /home/student/Desktop/router13.html
        }

    # delete working files relevant to the 'Router SNMP Security' exercise
    } elseif ($sub -eq 'snmp') {
        if (Test-Path -Path '/home/student/passwords.txt') {
            Remove-Item -Force /home/student/passwords.txt
        }

        # remove john.pot so that students can re-run the exercise and see the
        # password cracked again
        if (Test-Path -Path '/opt/john/run/john.pot') {
            Remove-Item -Force /opt/john/run/john.pot
        }
    }

    # check for and remove the OpenVPN stderr file, just in case it wasn't
    # cleaned up in the OpenVPN-Start function
    Write-Host 'Removing temp files...'
    if (Test-Path -Path '/labs/xfce4-terminal-openvpn.err') {
        Remove-Item -Force /labs/xfce4-terminal-openvpn.err
    }

    # delete temp files relevant to the 'Router SNMP Security' exercise
    if ($sub -eq 'snmp') {
        # remove john.pot so that students can re-run the exercise and see the
        # password cracked again
        if (Test-Path -Path '/opt/john/run/john.pot') {
            Remove-Item -Force /opt/john/run/john.pot
        }
    }
}


#===============================================================================
# function _Exercise-router-postcheck
#-------------------------------------------------------------------------------
# NOTE: The 'auditing a router' and 'SNMP security' exercises are very similar
# in terms of precheck, postcheck, and cleanup functions, so we're combining
# those functions and using ($sub -eq 'audit') and ($sub -eq 'snmp') to
# distinguish between the two when needed.
#
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-router-postcheck {
    # terminate any OpenVPN processes
    Write-Host "Terminating any OpenVPN processes..."
    Processes-Named-All-Stop 'openvpn' $true 'OpenVPN'

    Write-Host "Terminating any telnet processes..."
    Processes-Named-All-Stop 'telnet'
# TO DO: identify whether telnet will terminate on a SIGINT; if so, then add $true to the arguments for the above command

}


#===============================================================================
# function _Exercise-router-precheck
#-------------------------------------------------------------------------------
# NOTE: The 'auditing a router' and 'SNMP security' exercises are very similar
# in terms of precheck, postcheck, and cleanup functions, so we're combining
# those functions and using ($sub -eq 'audit') and ($sub -eq 'snmp') to
# distinguish between the two when needed.
#
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-router-precheck {
    # start the OpenVPN connection to the cloud router lab, and verify that it's
    # working
    OpenVPN-Start '4'
}


#===============================================================================
# function _Exercise-sigma-precheck
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-sigma-precheck {
}


#===============================================================================
# function _Exercise-threatmodeling-cleanup
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-threatmodeling-cleanup {
    # Removing existing copies of the JSON files generated by the dettect.py
    # script.  When the dettect.py script generates an output file, it checks
    # for the target file name and automatically appends '_1', '_2', etc. to
    # the new file name if the target file already exists.  By removing
    # existing files, students will always see the same file names generated
    # when they run the script commands.  Note that copies of the output files
    # (as they should be when generated during the exericse) are already saved
    # in the /labs/threathmodeling/output/backup directory.
    # [2022.03.09 GJS]
    #
    # This used to be in precheck; moved to cleanup because it's part of
    # cleaning up temp and working files generated during the exercise (and
    # precheck now automatically calls the associated cleanup function).
    # [2023.05.13 GJS]
    #
    # NOTE: Remove-Item doesn't generate an error if no files are found
    # matching a wildcard spec; so we don't need to check first whether there
    # are files to delete, and don't need to catch that error.
    Write-Host 'Removing any existing dettect.py output files...'
    Remove-Item -Force /labs/threatmodeling/output/*.json
}


#===============================================================================
# function _Exercise-threatmodeling-postcheck
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-threatmodeling-postcheck {
    # stop and remove the ATT&CK Navigator Docker container
    Docker-container-rm 'navigator' $true

    # stop and remove the DeTT&CT Docker container
    Docker-container-rm 'dettect' $true
}


#===============================================================================
# function _Exercise-threatmodeling-precheck
#-------------------------------------------------------------------------------
# See 'function _Exercise-*-*' comments for general notes on _Exercise-*-*
# functions.
#-------------------------------------------------------------------------------
function _Exercise-threatmodeling-precheck {
    # always stop all Docker containers as part of the precheck of any exercise
    # that uses containers
    Docker-Containers-Stop $true
}


#===============================================================================
# function Check-File
#-------------------------------------------------------------------------------
# Check for the existence of file, and optionally retrieve the file from a URL.
#
# If the second argument is a non-empty string, then check whether the file has
# a matching SHA1 hash.
#
# If either of these checks fail:
#
#  - If the function was passed a non-empty URL and a non-zero # of times to
#    retry, then try downloading the file; if that fails, then throw an error.
#
#  - Else throw an error.
#
# NOTE: This is an evolution of the original script checking for and downloading
# PCAP files.  I don't know why the original script did this instead of just
# relying on the PCAP files being present in the content synced from the GitHub
# repository (after all, we don't check for the presence and correct hash for
# the Apache configuration files, other data files, etc.)... But as long as
# we're doing it, this function adds a bit of robustness and reliability to the
# process. [2023.05.13 GJS]
#
#-------------------------------------------------------------------------------
# Arguments
#
# $file             string     Path (usually full) to the file.
#                   required
#
# $hash             string     The correct SHA1 hash of the file.
#
#                              If not passed or passed as an emptry string, then
#                              the function does not check the hash.
#
#                              Default: $null
#
# $URL              bool       The URL from which the file can be retrieved.
#
#                              If not passed, then the function does not attempt
#                              to download the file.
#
#                              Default: $null
#
# $retry_limit      integer    Number of times to try downloading the file.
#
#                              Only takes effect if $URL is passed and is not an
#                              empty string.
#
#                              If this argument isn't passed, then the default #
#                              of retries is used.  If the argument is passed as
#                              0, then no attempts are performed even if $URL is
#                              set (so use 0 if you don't want to download but
#                              do want the source $URL to be displayed in an
#                              error message).
#
#                              Default: 2
#
#-------------------------------------------------------------------------------
# Variables
#
# $counter          integer    For loop counter when attempting to download a
#                              file.  Initial value dictates the number of times
#                              we'll try to download a valid file.
#
# $status           integer    0 = file has not been tested yet
#                              1 = file is not present
#                              2 = file hash is incorrect
#                              3 = SUCCESS! (file is present and - if tested -
#                                  hash is correct)
#
#-------------------------------------------------------------------------------
# Return: (none)
#
#-------------------------------------------------------------------------------
function Check-File {
    param (
        [Parameter(Mandatory)]
        [string]$file,
        [Parameter(Mandatory = $false)]
        [AllowEmptyString()]
        [string]$hash = '',
        [Parameter(Mandatory = $false)]
        [string]$URL = '',
        [ValidateRange('NonNegative')]
        [Parameter(Mandatory = $false)]
        [int]$retry_limit = 2
    )

    # NOTE: DO NOT SET $retry_limit DEFAULT TO A NEGATIVE VALUE OR ELIMINATE
    # PARAMETER ATTRIBUTE [ValidateRange('NonNegative')]!

    # setting a local variable instead of just using $retry_limit as a counter
    # so that error text can distinguish between 'failed to download' vs.
    # 'never tried'
    [int]$local:counter = $retry_limit

    # initial status is 'file has not been tested yet'
    [int]$local:status = 0

    # loop until we either are successful or give up
    while ($status -ne 3) {
        # if the file does not exist and we aren't supposed to check the hash,
        # then set a failure status
        if (-not (Test-Path $file)) {
            $status = 1

        # the file exists and we are supposed to check the hash, so check the
        # hash; if the hash doesn't match, then set a failure status
        #
        # NOTE: Checking for ($hash -ne '') to cover the default value of the
        # argument; and because we allow an empty string to be passed, to allow
        # for the case where we don't check the hash but do want to download a
        # missing file (i.e., $URL was passed)
        } elseif ($hash -ne '' -and (-not ((Get-FileHash -Path $file -Algorithm SHA1).Hash -eq $hash))) {
            $status = 2

        # the file exists and either we aren't supposed to check for the hash,
        # or the hash matches; set success status
        } else { $status = 3 }

        # if the checks didn't pass...
        if ($status -ne 3) {

            # if a URL wasn't provided, then there's nothing we can do; just
            # throw an error
            if ($URL -eq '') {
                # set the error text differently depending on whether the file
                # was missing, vs. an invalid hash
                throw "[throw]File $file is $(if ($status -eq 1) { 'missing' } else { 'invalid' })."

            # if $counter was initially set to or was decremented 0, then
            # stop trying and throw an error
            } elseif ($counter -eq 0) {
                # set the error text differently depending on whether the file
                # was missing, vs. an invalid hash
                #
                # set the errot text differently depending on whether we ever
                # tried to download a valid file
                throw "[throw]File $file is $(if ($status -eq 1) { 'missing' } else { 'invalid' }); $( if ($retry_limit -eq 0) { "source file should be at" } else { "failed to download valid file from" }) $URL."

            # else try to download the file
            } else {

                # set the message text differently depending on whether the file
                # was missing, vs. an invalid hash
                Write-Host "File $file is $(if ($status -eq 1) { 'missing' } else { 'invalid' }), downloading..." -ForegroundColor $color_info
                Invoke-WebRequest -Uri $URL -OutFile $file

                $counter--
            }
        }
    }
}


#===============================================================================
# function Docker-container-rm
#-------------------------------------------------------------------------------
# Stop and force removal of a running container, if it is present (in any
# state), based on the container name.
#
# Putting this in a function so that we can re-use the wrapper that checks for
# whether the container is running, which allows us avoid docker generating
# normal status messages while still seeing other error messages (which we'd
# miss if we just redirected to /dev/null).
#
# This also allows us to implement error handling later, if that becomes
# necessary.
#
#-------------------------------------------------------------------------------
# Arguments
#
# $container_name   string     The name of the container to remove.
#                   required
#
# $noisy            bool       Display information message?
#
#-------------------------------------------------------------------------------
# Variables
#
# $container_ID     string     Docker short container ID returned by 'docker ps'
#
#-------------------------------------------------------------------------------
# Global variables
#
# $v                bool       $true = verbose messages
#
#-------------------------------------------------------------------------------
# Return: (none)
#
#-------------------------------------------------------------------------------
function Docker-container-rm {
    param (
        [Parameter(Mandatory)]
        [string]$container_name,
        [Parameter(Mandatory = $false)]
        [boolean]$noisy = $false
    )

    [String]$local:container_ID = $null

    if ($noisy) { Write-Host "Checking for and removing $container_name..." }
    elseif ($v) { Write-Host "Checking for container $container_name..." }

    # only try to remove the container if such a container exists; match on the
    # exact container name, and make sure that the results are *only* a single
    # short container ID (12 hexadecimal characters)
    #
    # NOTE: Checking for uppercase A-F shouldn't really be necessary since the
    # Docker short container ID should be lowercase to start with; this is just
    # future-proofing.
    $container_ID = (docker ps --filter "name=^/${container_name}$" -q -a)
    if ($container_ID -match "^[0-9a-fA-F]{12}$") {
        if ($v) { Write-Host "Removing container $container_ID - $container_name..." }

        # remove the container; filter output to ignore normal output strings:
        #     "$container_ID"
        (docker rm -f $container_ID 2>&1) | Select-String -Pattern "^$container_ID$" -NotMatch
    }
}


#===============================================================================
# function Docker-container-start
#-------------------------------------------------------------------------------
# Start a container, based on the container name.
#
# Putting this in a function so that we can manage the output messages.
#
# This also allows us to implement error handling later, if that becomes
# necessary.
#
#-------------------------------------------------------------------------------
# Arguments
#
# $container_name   string     The name of the container to stop.
#                   required
#
# $noisy            bool       Display information message?
#
#-------------------------------------------------------------------------------
# Global variables
#
# $v                bool       $true = verbose messages
#
#-------------------------------------------------------------------------------
# Return: (none)
#
#-------------------------------------------------------------------------------
function Docker-container-start {
    param (
        [Parameter(Mandatory)]
        [string]$container_name,
        [Parameter(Mandatory = $false)]
        [boolean]$noisy = $false
    )

    if ($noisy -or $v) { Write-Host "Starting container $container_name..." }

    # start the container; filter output to ignore normal output strings:
    #     "$container_name"
    (docker start $container_name 2>&1) | Select-String -Pattern "^$container_name$" -NotMatch
}


#===============================================================================
# function Docker-container-stop
#-------------------------------------------------------------------------------
# Stop a running container, based on the container name.
#
# Putting this in a function so that we can re-use the wrapper that checks for
# whether the container is running, which allows us avoid docker generating
# normal status messages while still seeing other error messages (which we'd
# miss if we just redirected to /dev/null).
#
# This also allows us to implement error handling later, if that becomes
# necessary.
#
#-------------------------------------------------------------------------------
# Arguments
#
# $container_name   string     The name of the container to stop.
#                   required
#
# $noisy            bool       Display information message?
#
#-------------------------------------------------------------------------------
# Variables
#
# $container_ID     string     Docker short container ID returned by 'docker ps'
#
#-------------------------------------------------------------------------------
# Global variables
#
# $v                bool       $true = verbose messages
#
#-------------------------------------------------------------------------------
# Return: (none)
#
#-------------------------------------------------------------------------------
function Docker-container-stop {
    param (
        [Parameter(Mandatory)]
        [string]$container_name,
        [Parameter(Mandatory = $false)]
        [boolean]$noisy = $false
    )

    [String]$local:container_ID = $null

    if ($noisy) { Write-Host "Checking for and stopping $container_name..." }
    elseif ($v) { Write-Host "Checking for container $container_name..." }

    # only try to remove the container if such a container exists; match on the
    # exact container name, and make sure that the results are *only* a single
    # short container ID (12 hexadecimal characters)
    #
    # NOTE: Checking for uppercase A-F shouldn't really be necessary since the
    # Docker short container ID should be lowercase to start with; this is just
    # future-proofing.
    $container_ID = (docker ps --filter "name=^/${container_name}$" -q)
    if ($container_ID -match "^[0-9a-fA-F]{12}$") {
        if ($v) { Write-Host "Stopping container $container_ID - $container_name..." }

        # remove the container; filter output to ignore normal output strings:
        #     "$container_ID"
        (docker stop $container_ID 2>&1) | Select-String -Pattern "^$container_ID$" -NotMatch
    }
}


#===============================================================================
# function Docker-containers-rm
#-------------------------------------------------------------------------------
# Stop and force removal of any containers based on a given image.
#
#-------------------------------------------------------------------------------
# Arguments
#
# $image_name       string     The name of the image to look for.
#                   required
#
# $noisy            bool       Display information message?
#
#-------------------------------------------------------------------------------
# Variables
#
# $container_ID     string     Docker short container ID returned by
#                              'docker ps'.
#
# $container_name   string     Name of the container returned by 'docker ps'.
#
# $image_base       string     Image name returned by 'docker ps'.
#
# $line             string     Line of output returned by 'docker ps'.
#
#-------------------------------------------------------------------------------
# Global variables
#
# $v                bool       $true = verbose messages
#
#-------------------------------------------------------------------------------
# Return: (none)
#
#-------------------------------------------------------------------------------
function Docker-containers-rm {
    param (
        [Parameter(Mandatory)]
        [string]$image_name,
        [Parameter(Mandatory = $false)]
        [boolean]$noisy = $false
    )

    [String]$local:container_ID = $null
    [String]$local:container_name = $null
    [String]$local:image_base = $null
    [String]$local:line = $null

    if ($noisy) { Write-Host "Checking for and removing images based on $image_name..." }
    elseif ($v) { Write-Host "Checking for images based on $image_name..." }

    # process the output of the 'docker ps -a' command
    foreach ($line in (docker ps -a)) {

        # compress to get rid of duplicate spaces
        $line = $line -replace '( ){2,}',' '

        # get the container ID and image from which the container was
        # instantiated (first two fields in the line)
        $container_ID, $image_base, $null = $line.Split(' ',3)

        # get the container name (last field in the line)
        #
        # looking at the last field avoids issues with spaces in the
        # other fields such as COMMAND or CREATED
        $container_name = $line.Split(' ')[-1]

        # if $image_name (the image to delete) does NOT contain a ':' character,
        # then we want to remove all images regardless of image tag / version...
        # so strip the tag / version information from $image_base (the found
        # image name) before comparing $image_name to $image_base
        if (-not ($image_name -clike "*:*")) {
            $image_base = $image_base.Split(':',2)[0]
        }

        # if $image_name and $image_base are the same, then delete the container
        if ($image_base -ceq $image_name) {

            # only try to remove the container if the found container ID is a valid
            # single short container ID (12 hexadecimal characters)
            #
            # NOTE: Checking for uppercase A-F shouldn't really be necessary since
            # the Docker short container ID should be lowercase to start with; this
            # is just future-proofing.
            if ($container_ID -match "^[0-9a-fA-F]{12}$") {
                if ($v) { Write-Host "Removing container $container_ID - $container_name..." }

                # remove the container; filter output to ignore normal output strings:
                #     "$container_ID"
                (docker rm -f $container_ID 2>&1) | Select-String -Pattern "^$container_ID$" -NotMatch
            }
        }
    }
}


#===============================================================================
# We always want to make sure that there aren't any Docker containers running
# before an exercise -- *especially* exercises that use Docker containers
# themselves.  So we should always call this function from the
# _Exercise-EXERCISE_LABEL-precheck functions for any exercise that uses Docker
# containers.
#
# We should generally *not* call this function from
# _Exercise-EXERCISE_LABEL-postcheck functions, as postchecks should granularly
# stop just the containers that the exercise uses.
#
# NOTE: Consider adding additional error checking here on the 'docker stop'
# output; and maybe checking that the containers are actually all stopped.
#
# TO DO: function header comments!
function Docker-Containers-Stop {
    param (
        [Parameter(Mandatory = $false)]
        [boolean]$noisy = $false
    )

    if ($v -or $noisy) { Write-Host 'Stopping any Docker containers...' }
    docker stop $(docker ps -aq) | Out-Null
}


#===============================================================================
# function Docker-image-rm
#-------------------------------------------------------------------------------
# Remove an image, if it is present, based on the image name.
#
# If this function is just based an image name without any tag, then all images
# with that name will be removed, regardless of tag.  For example:
#
#     hasecuritysolutions/mkdocs
#
# But if the image name includes a tag, then only images with that name and tag
# will be removed.  For example:
#
#    hasecuritysolutions/mkdocs:1.3
#
# Putting this in a function so that we can re-use the wrapper that checks for
# whether the image exists, which allows us to handle that while still seeing
# other error messages (which we'd miss if we just redirected to /dev/null).
#
# This also allows us to implement error handling later, if that becomes
# necessary.
#
#-------------------------------------------------------------------------------
# Arguments
#
# $image_name       string     The name of the image to remove.
#                   required
#
#-------------------------------------------------------------------------------
# Variables
#
# $image_ID         string     Docker short image ID returned by
#                              'docker image ls'
#
#-------------------------------------------------------------------------------
# Global variables
#
# $v                bool       $true = verbose messages
#
#-------------------------------------------------------------------------------
# Return: (none)
#
#-------------------------------------------------------------------------------
function Docker-image-rm {
    param (
        [Parameter(Mandatory)]
        [string]$image_name
    )

    [String]$local:image_ID = $null

    if ($v) { Write-Host "Checking for image $image_name..." }

    # process the output of the 'docker image ls' command
    foreach ($line in (docker image ls $image_name -q -a)) {

        # only try to remove the image if such an image exists; match on the exact
        # image name, and make sure that the results are *only* a single short image
        # container ID (12 hexadecimal characters)
        #
        # NOTE: Checking for uppercase A-F shouldn't really be necessary since the
        # Docker short image ID should be lowercase to start with; this is just
        # future-proofing.
        if ($image_ID -match "^[0-9a-fA-F]{12}$") {
            if ($v) { Write-Host "Removing image $image_ID - $image_name..." }

            # remove the image; filter output to ignore normal output strings:
            #     "Untagged: [...]"
            #     "Deleted: [...]"
            (docker image rm -f $image_ID 2>&1) | Select-String -Pattern "^Untagged: ", "^Deleted: " -NotMatch
        }
    }
}


#===============================================================================
# TO DO: Probably need to update this help if/when all precheck, postcheck,
# cleanup actions are updated consistent with the comments above the JA3
# actions (below).
function Help-Display {

    [String]$local:exercise_label=$null
    [String]$local:sub_label=$null

    Write-Host @"
SYNOPSIS

    $($MyInvocation.ScriptName.split('/')[-1]) -exercise EXERCISE_LABEL -check CHECK_TYPE [-h|-help]

OPTIONS

    -check CHECK_TYPE

        Identify the type of check to be performed.

            precheck  : Check & setup the lab environment before an exercise.

                        A precheck automatically performs the exercise's
                        postcheck actions, cleanup actions, and then precheck
                        actions.

            postcheck : Restore the lab environment to a normal working state
                        after an exercise, by removing or reverting the changes
                        made during the exercise.

            cleanup   : Clean up temp and working files.

    -h, -help

        Display this help.

    -s, -sub

        Multiple exercises might be so similar that the cleanup, postcheck, or
        precheck actions are almost but not -quite- identical.  This option is
        used with -exercise to identify a 'subroutine' label that distinguishes
        between such cases.

    -x, -ex, -exercise EXERCISE_LABEL

        Identify the exercise for which the lab environment is to be managed.

    -v

        Display verbose status messages, mostly to follow the progress of the
        script.

EXERCISE LABEL AND CHECK COMBINATIONS

    The following EXERCISE_LABEL and CHECK_TYPE combinations are supported.

        Exercise Label / Sub Label           Precheck?   Postcheck?   Cleanup?
        --------------                       ---------   ----------   --------
"@

    # NOTE: The lists of label/check and label/title information give us a way
    # to make sure that we haven't made any mistakes in defining the $x_hash
    # variable or the exercise functions (i.e.,
    # _Exercise-EXERCISE_LABEL-precheck, _Exercise-EXERCISE_LABEL-precheck, 
    # _Exercise-EXERCISE_LABEL-cleanup).
    #
    # If we run the help and don't get the results that we expect, then we
    # should figure out why...

    # iterate through all exercise labels, case-sensitive sort
    foreach ($exercise_label in $x_hash.keys | Sort-Object -CaseSensitive) {
         # write the exercise label
         Write-Host "        $($exercise_label.PadRight(37))" -nonewline

        # write the supported check types
        #
        # NOTE: We're reporting that an exercise label supports precheck
        # even if the exercise has a cleanup or postcheck function, or forces
        # a cleanup or postcheck for an exercise; but doesn't have a precheck
        # function or force a precheck.  This is because any exercise that has a
        # cleanup should inherently support a precheck that at *least* executes the
        # cleanup function; and any exercise that has a postcheck function
        # should inherently support a precheck that at *least* executes the
        # postcheck function.
        Write-Host "$(if ($x_hash[$exercise_label].Keys -ccontains 'cleanup' -or $x_hash[$exercise_label].Keys -ccontains 'postcheck' -or $x_hash[$exercise_label].Keys -ccontains 'precheck') { 'Y'.PadLeft(5) } else { '-'.PadLeft(5) })" -nonewline
        Write-Host "$(if ($x_hash[$exercise_label].Keys -ccontains 'postcheck') { 'Y'.PadLeft(12) } else { '-'.PadLeft(12) })" -nonewline
        Write-Host "$(if ($x_hash[$exercise_label].Keys -ccontains 'cleanup') { 'Y'.PadLeft(12) } else { '-'.PadLeft(12) })"

        # for each exercise label, loop through and display any
        # $x_hash[$exercise_label]['subs'].Keys
        #
        # NOTE: The 'if' isn't needed here to avoid an error, only to prevent a
        # blank line from being displayed when an exercise label doesn't have
        # any 'subs'.
        if ($x_hash[$exercise_label]['subs'] -ne $null) {
            Write-Host "            $(($x_hash[$exercise_label]['subs'].Keys | Sort-Object -CaseSensitive) -join ', ')"
        }
    }

    Write-Host @"

EXERCISE LABELS AND TITLES

    The following exercise titles are associated with various EXERCISE_LABEL
    values.

        Exercise Label      Exercise Title(s)
        --------------      -----------------
"@

    # iterate through all exercise labels, case-sensitive sort; only grab
    # labels that have a non-empty title
    foreach ($exercise_label in $x_hash.keys | Where-Object {$x_hash[$_].Keys -ccontains 'title' -and $x_hash[$_].title -ne ''} | Sort-Object -CaseSensitive) {
         # write the exercise label and title
         Write-Host "        $($exercise_label.PadRight(20))$($x_hash[$exercise_label].title)"
    }

    Write-Host @"

EXAMPLES

    Generally speaking, students will run this script as directed.  Here are a
    few example commands as they might appear in exercise instructions:

        sudo pwsh /labs/check.ps1 -exercise threatmodeling -check precheck

        sudo pwsh /labs/check.ps1 -exercise 5.1 -check postcheck

    Note that while it doesn't appear anywhere else in this help content, the
    '-lab' argument is still accepted for backwards-compatibility with previous
    exercise instructions.  The following example commands are equivalent to
    those above, and will work:

        sudo pwsh /labs/check.ps1 -lab threatmodeling -check precheck

        sudo pwsh /labs/check.ps1 -lab 5.1 -check postcheck

--------------------------------------------------------------------------------
[LAST UPDATED: 2023-05-13]                                       [Greg Scheidel]
"@

}


#===============================================================================
# function iptables-Rule-Delete
#-------------------------------------------------------------------------------
# Delete all instances of an iptables rule, given the name of the iptables
# chain, output text that would be generated from '-L', and whether this is a
# NAT rule.
#
#-------------------------------------------------------------------------------
# Arguments
#
# $chain            string     The name of the chain (e.g., INPUT, OUTPUT,
#                   required   FORWARD).
#
# $rule_text        string     The rule text that would be generated with
#                   required   'iptables -L <chain> --line-numbers -n', *after
#                              but not including* the rule number and the space
#                              immediately after the rule number.
#
#                              Multiple spaces can be collapsed in this argument
#                              value (we do so anywhere as part of the
#                              conversion to a regular expression pattern. 
#
# $nat_rule         bool       Is this a NAT rule?  (if yes, then we'll use
#                              '-t nat' in the iptables commands)
#
#-------------------------------------------------------------------------------
# Variables
#
# $rule_number      array      The rule numbers that match on the iptables rule.
#
# $counter          integer    For loop counter; processing $rule_number to
#                              delete rules.
#
#-------------------------------------------------------------------------------
# Return: (none)
#
#-------------------------------------------------------------------------------
function iptables-Rule-Delete {
    param (
        [Parameter(Mandatory)]
        [string]$chain,
        [Parameter(Mandatory)]
        [string]$rule_text,
        [Parameter(Mandatory = $false)]
        [boolean]$nat_rule = $false
    )

    [int]$local:counter = 0
    [string[]]$local:rule_number = 0

    # convert $rule_text into a partial PCRE expression
    #  - get rid of leading and trailing spaces
    #  - replace '.' with '\.'
    #  - replace one or more spaces with ' +'
    #  - (we can add more later if we need to, based on the rules that we end up
    #    processing with this function...)
    $rule_text = $rule_text.Trim() -replace '\.','\.'
    $rule_text = $rule_text -replace '( ){2,}',' +'  

    # convert to the full PCRE expression
    $rule_text = '^(\d+)(?=( +' + $rule_text + '))'

    # find all the rules that match, delete them in reverse order
    $rule_number = (iptables $(if ($nat_rule) { '-t nat' }) -L $chain --line-numbers -n) | Select-String $rule_text
    for ($counter = $rule_number.Count; $counter -gt 0; $counter--) {
        write-host 'rule_number: ' -nonewline 
        write-host $rule_number[$counter-1].Split(' ',2)[0]

        iptables $(if ($nat_rule) { '-t nat' }) -D $chain $rule_number[$counter-1].Split(' ',2)[0]
    }
}


#===============================================================================
# actions taken for the JA3 exercise, common to more than one of precheck/postcheck/cleanup
function JA3-Actions {

    # restore the /usr/share/bro/site/local.bro file
    cp /labs/ja3/backup/bro/local.bro.original /usr/share/bro/site/local.bro

    # remove the /usr/share/bro/site/ja3/ directory, where students will save
    # (may have already saved) the Bro scripts to support JA3
    rm -rf /usr/share/bro/site/ja3/ 2>$nul

    # uninstall the Python pyja3 and dpkg packages; ignore 'skipping
    # package' messages
    sudo -i -u student pip uninstall --disable-pip-version-check -y dpkt 2>&1 | grep -v 'WARNING: Skipping dpkt'
    sudo -i -u student pip uninstall --disable-pip-version-check -y pyja3 2>&1 | grep -v 'WARNING: Skipping pyja3'

    # remove any files and directories in the root of the /labs/ja3
    # directory *except* /labs/ja3/backup
    Get-ChildItem -Path '/labs/ja3' -Exclude 'backup' | Remove-Item -Recurse -Force
}


function Processes-Named-All-Stop {
    param (
        [Parameter(Mandatory)]
        [string]$process_name,
        [Parameter(Mandatory = $false)]
        [boolean]$SIGINT = $false,
        [Parameter(Mandatory = $false)]
        [string]$process_label = ''
    )

    [System.Diagnostics.Process []]$local:process_list = $null
    [System.Diagnostics.Process]$local:process = $null

    # if $process_label wasn't passed, then default to $proces_name
    if ($process_label -eq '') { $process_label = $process_name }

    # Loop to first send a SIGINT and then a SIGKILL to all matching running
    # processes.  On the SIGKILL pass, there *shouldn't* be any processes left
    # running; but erring on the side of caution.
    #
    # The reason we're bothering to do a first pass with SIGINT, instead of
    # jumping straight to SIGKILL, is (a) on general principle, trying to
    # terminate the processes gracefully and (b) so that if we want to we can
    # enable detailed troubleshooting and/or messaging.
    foreach ($signal in $(if ($SIGINT) { (2,9) } else { (2) })) {
        # Get a list of all processes with a name of $process_name.
        #
        # Using '| Where-Object' instead of 'Get-Process -Name' because with
        # the latter, there doesn't appear to be a way to ignore
        # 'NoProcessFoundForGivenName' errors while still trapping on others.
        $process_list = Get-Process | Where-Object { $_.Name -ceq $process_name }

        # send this signal to each of the processes
        foreach ($process in $process_list) {
            # Specify '/bin/kill' to avoid 'kill' being interpreted as an alias
            # for PowerShell's Stop-Process.
            #
            # Using /bin/kill instead of Stop-Process because we may want to
            # send a SIGINT to the process, and Stop-Process does not appear to
            # support it.
            /bin/kill -s $($signal) $($process.Id)
        }
    }

    # Final pass, strictly so that we can warn if we weren't able to stop all
    # of the processes.
    $process_list = Get-Process | Where-Object { $_.Name -ceq $process_name }

    # if there are any processes left, then let the user know
    if ($process_list.Count -ne 0) {
        Write-Host "WARNING: Unable to terminate all $process_label processes." -ForegroundColor $color_warning
    }
}


#===============================================================================
# function OpenVPN-Start
#-------------------------------------------------------------------------------
# Start the OpenVPN command in a new terminal window, to establish a VPN
# connection with one of the cloud lab environments.
#
#-------------------------------------------------------------------------------
# Arguments
#
# $ip_version       string     '4' = connect to the IPv4 environment
#                   required   '6' = connect to the IPv6 environment
#
# $max_time         integer    Maximum amount of time to wait for the OpenVPN
#                              connection to start and the IPv4 test host to
#                              start responding.
#
#-------------------------------------------------------------------------------
# Variables
#
# $openvpn_process  process object
#
#                              Obtained when the xfce4-terminal process is
#                              launched, so that we can do a status check
#                              whether the process was successfully started.
#
# $start_time       DateTime object
#
#                              Time (roughly) that the function started, before
#                              looping to start the OpenVPN connection.
#
# $success          boolean    Flag on whether we passed all the tests for the
#                              OpenVPN connection being established.
#
#-------------------------------------------------------------------------------
# Return: (none)
#
#-------------------------------------------------------------------------------
function OpenVPN-Start {
    param (
        [Parameter(Mandatory = $true)]
        [string]$ip_version,
        [Parameter(Mandatory = $false)]
        [int]$max_time = 60
    )
# TO DO: set OpenVPN-Start parameter $ip_version to only accepp values '4' and '6'

    [System.Diagnostics.Process]$local:openvpn_process = $null
    [DateTime]$local:start_time = Get-Date
    [boolean]$local:success = $false
    [string]$local:openvpn_config = ''
    [string]$local:test_host = ''

    # set OpenVPN config file and test host for IPv4
    if ($ip_version -eq '4') {
        $openvpn_config = '/etc/openvpn/sec530.ovpn'
        $test_host = '10.5.30.10'

    # set OpenVPN config file and test host for IPv6
    } elseif ($ip_version -eq '6') {
        $openvpn_config = '/etc/openvpn/ipv6.ovpn'
        $test_host = '2001:4860:4860::8888'

    # somehow we're not checking IPv4 or IPv6; throw an error
    } else {
        throw "[throw]Invalid IP version argument '$ip_version' passed to OpenVPN-Start."
    }


    Write-Host "Starting IPv$ip_version VPN..."

    # Start the OpenVPN connection as a detached process in a new terminal
    # window.
    #
    #  - Capture the process information in a variable so that we can check
    #    status; make sure the process started.
    #
    #  - Unless we start this script with 'sudo -E', the current environment
    #    won't have SESSION_MANAGER and related environment variables defined.
    #    So when xfce4-terminal is called, we'll get a 'SESSION_MANAGER
    #    environment variable not defined' error.  So we'll use Start-Process
    #    with '-RedirectStandardError' to send that error message to a temp
    #    file, which we can check (and then remove; also remove it in
    #    postcheck).
    $openvpn_process = Start-Process -PassThru -FilePath "xfce4-terminal" -ArgumentList $('-T "OpenVPN" -e "openvpn --config ' + $openvpn_config + '"') -RedirectStandardError '/labs/xfce4-terminal-openvpn.err'

# TO DO: check whether the process successfully started, based on $openvpn_process values

    if ($true) { # TO DO: check whether the process successfully started

        # give a maximum of $max_time for things to start working...
        while ($success -eq $false -and ((Get-Date) - $start_time).TotalSeconds -le $max_time) {

            # check stderr; on anything besides null (because maybe there wasn't
            # any stderr output) and the expected 'SESSION_MANAGER environment
            # variable not defined' error, throw an error
            if ((Get-Content '/labs/xfce4-terminal-openvpn.err') -ne $null -and (Get-Content '/labs/xfce4-terminal-openvpn.err') -cne 'Failed to connect to session manager: Failed to connect to the session manager: SESSION_MANAGER environment variable not defined') {
                throw '[throw]Unexpected error output from xfce4-terminal in /labs/xfce4-terminal-openvpn.err'
            }

            # check to see if we can reach the test host in/through the cloud
            # environment
            if(Test-Connection -ComputerName $test_host -Quiet -Count 1) {
                # hooray!  let the user know!
                Write-Host "IPv$ip_version VPN established, test host $test_host responding" -ForegroundColor $color_success

                # flag so that we (a) exit the loop and (b) can check for an error
                # after we exit the loop
                $success = $true
            } else {
                # bummer... sleep and try again
                Write-Host "Waiting for IPv$ip_version VPN test host to respond..." -ForegroundColor $color_info
                Start-Sleep -Seconds 5
            }
        }

        # check to see if we were successful (vs. timing out)
        #
        # if successful, then remove the OpenVPN stderr file
        if ($success) {
            if (Test-Path -Path '/labs/xfce4-terminal-openvpn.err') {
                Remove-Item -Force /labs/xfce4-terminal-openvpn.err
            }

        # if we weren't successful, then throw an error
        } else {
            throw "[throw]IPv$ip_version VPN test host not responding."
        }

    # if the xfce4-terminal process didn't successfully start, then throw an
    # error
    } else {
        throw '[throw]OpenVPN terminal window was not successfully launched.'
    }
}


#===============================================================================
# actions taken for the remediate exercise, common to more than one of precheck/postcheck/cleanup
function Remediate-Actions {
    Web-Vulnerabilities-Actions

    # restore the original /var/www/sec530-wiki/[docs,site]/test-v[2,3].php
    # files
    Write-Host 'Restoring /var/www/sec530-wiki/docs/test-v2.php...'
    Copy-Item -Force /labs/4.1/backup/test-v2.php /var/www/sec530-wiki/docs/test-v2.php
    Write-Host 'Restoring /var/www/sec530-wiki/docs/test-v2.php...'
    Copy-Item -Force /labs/4.1/backup/test-v2.php /var/www/sec530-wiki/site/test-v2.php

    Write-Host 'Restoring /var/www/sec530-wiki/docs/test-v3.php...'
    Copy-Item -Force /labs/4.1/backup/test-v3.php /var/www/sec530-wiki/docs/test-v3.php
    Write-Host 'Restoring /var/www/sec530-wiki/docs/test-v3.php...'
    Copy-Item -Force /labs/4.1/backup/test-v3.php /var/www/sec530-wiki/site/test-v3.php
}


#===============================================================================
# Actions that should *always* be taken when running this script, for every
# exercise label and check type, *after* running the exercise-specific actions.
function Universal-Actions-After {
    if ($v) { Write-Host 'Inside: Universal-Actions-After' }

    # nothing here yet
}


#===============================================================================
# Actions that should *always* be taken when running this script, for *every*
# exercise label and check type, *before* running the exercise-specific actions.
function Universal-Actions-Before {
    if ($v) { Write-Host 'Inside: Universal-Actions-Before' }

    # change working directory to student's home directory
    Set-Location /home/student

    # clear the Google Chrome and Firefox cache
    Write-Host 'Clearing Google Chrome and Firefox browser caches...'
    Remove-Item -path /home/student/.cache/google-chrome/ -recurse -ErrorAction SilentlyContinue | Out-Null
    Remove-Item -path /home/student/.cache/mozilla/firefox/ -recurse -ErrorAction SilentlyContinue | Out-Null

    #----------------------------------------------------------------------------
    # See https://github.com/sans-blue-team/sec530-labs-v4/issues/64
    #
    # Delete /labs/dtf/es_data if it exists and has not been previously deleted
    # by this script.
    #
    # NOTE: This is a candidate for being addressed in the next version of the
    # SEC530 VM.
    if (-not (Test-Path -Path /scripts/.es_data_check -PathType Leaf) -and (Test-Path /labs/dtf/es_data)) {
        Remove-Item /labs/dtf/es_data -Force -Recurse

        # create a flag file, to let us know that the directory has previously
        # been deleted by this script
        $null > /scripts/.es_data_check
    }

    #----------------------------------------------------------------------------
    # Set the student's FireFox home page and new tab page to a blank page, by
    # editing the user.js file
    #
    # NOTE: This is a candidate for inclusion in the next version of the SEC530
    # VM.  Even then, we might want to keep this action so that we can be certain
    # that the FireFox browser configuration stays the way we want it.

    # find a prefs.js file, so that we can update the user.js file in the same
    # directory
    foreach ($prefs_file in Get-ChildItem -Path /home/student/.mozilla/firefox/ -File -Include prefs.js -Recurse -Force -ErrorAction SilentlyContinue) {

        # if there is already a user.js file, delete the relevant settings so
        # that we don't end up with multiple entries for the same setting
        foreach ($user_file in Get-ChildItem -Path ($prefs_file.DirectoryName + "/user.js") -File -ErrorAction SilentlyContinue) {
            (Get-Content $user_file | Select-String -pattern '^(user_pref\("browser.startup.homepage",)|(user_pref\("browser.newtabpage.enabled",)' -notmatch) | Set-Content $user_file
        }

        # add the desired settings
        Add-Content -Path ($prefs_file.DirectoryName + "/user.js") 'user_pref("browser.startup.homepage", "about:blank");'
        Add-Content -Path ($prefs_file.DirectoryName + "/user.js") 'user_pref("browser.newtabpage.enabled", false);'

        # make sure the user.js file is owned and readable by student
        chown student:student ($prefs_file.DirectoryName + "/user.js")
        chmod 600 ($prefs_file.DirectoryName + "/user.js")
    }

    #----------------------------------------------------------------------------
    # Remove the hasecuritysolutions/polar_proxy Docker image.
    #
    # NOTE: This is a candidate for inclusion in the next version of the SEC530
    # VM.
    Docker-image-rm 'hasecuritysolutions/polar_proxy'

    #----------------------------------------------------------------------------
    # Remove any containers that are instantiated from any version of the
    # hasecuritysolutions/mkdocs Docker image.
    #
    # NOTE: This is a candidate for inclusion in the next version of the SEC530
    # VM (because we don't need old versions of this container floating around);
    # plus iwe should update the /script/wiki_update.ps1 script to add '--rm' to
    # the 'docker run' command when instantiating a container from the
    # hasecuritysolutions/mkdocs image.
    Docker-containers-rm 'hasecuritysolutions/mkdocs'

    #----------------------------------------------------------------------------
    # Remove any containers that are instantiated from any version of the
    # mitmproxy/mitmproxy Docker image.
    #
    # NOTE: This is a candidate for inclusion in the next version of the SEC530
    # VM.  mitmproxy is no longer in use by any exercises.
    Docker-containers-rm 'mitmproxy/mitmproxy'

    #----------------------------------------------------------------------------
    # Remove any containers that are instantiated from any version of the
    # aboutsecurity/attack_navigator Docker image.
    #
    # NOTE: This is a candidate for inclusion in the next version of the SEC530
    # VM (because we don't need old versions of this container floating around).
    #
    # Exercise instructions already added '--rm' to the relevant 'docker run'
    # commands; and this script already removes an 'navigator' Docker container.
    Docker-containers-rm 'aboutsecurity/attack_navigator'

    #----------------------------------------------------------------------------
    # Remove any .DS_Store files under /labs. and /var/www/sec530-wiki/.
    #
    # There shouldn't be any based on the latest GitHub repo, but a student with
    # the original SEC530 VM from ISO 530.21.1 could have at least one such file
    # that can't be deleted by the 'git pull' due to permissions issues.
    Get-ChildItem /labs/ -Include .DS_Store -Recurse -Force -ErrorAction SilentlyContinue | Remove-Item -Force -ErrorAction SilentlyContinue
    Get-ChildItem /var/www/sec530-wiki/ -Include .DS_Store -Recurse -Force -ErrorAction SilentlyContinue | Remove-Item -Force -ErrorAction SilentlyContinue
}


#===============================================================================
# legacy
function Verify-EveBoxIsRunning {
    Start-Sleep -Seconds 2
    try {
        if((Invoke-WebRequest -Uri http://localhost:5636 -ErrorAction SilentlyContinue).Content -match '<title>EveBox'){
            $evebox = 1
        }
    }
    catch {}
    if($evebox -eq 1){
        Write-Host 'Evebox is online' -ForegroundColor $color_success
    } else {
        Write-Host 'Evebox is not running' -ForegroundColor $color_error
    }
}


#===============================================================================
# legacy
function Verify-FilebeatIsRunning {
    $running_containers = (docker ps)
    $output = ''
    foreach($container in $running_containers){
        $output += $container
    }
    if($output -notmatch 'filebeat'){
        Write-Host 'The docker-compose start command has not been ran or there is an error.' -ForegroundColor $color_error
        exit
    }
}


#===============================================================================
# function Verify-John
#
# This function checks whether there is a CPU chipset difference between the
# current OS chipset and that for which john was previously compiled. If there
# is a difference, then the function recompiles john.
#
# However, this function is referenced only in checks for an *old* instance of
# this exercise, back when the exercise was numbered 1.2 (instead of the current
# 2.2). That section of the precheck actions, and therefore this function,
# hasn't been executed for years.
#
# For right now I'm leaving this function alone but it is not actively being
# executed by anything in the script, so it's orphaned.  I'm documenting this
# in GitHub issue https://github.com/sans-blue-team/sec530-labs-v4/issues/80.
# Probably it can be deleted, unless there's a real concern that at some point
# (a) the VM will be running on a significantly different CPU chiptset
# architecture, and (b) that is an issue that varies from student to student vs.
# being one that is addressed for the VM build in general.
#
# If a decision is made to actually run this as part of the exercise prechecks,
# then we can incorporate this into the appropriate precheck function (and
# probably update it to send a return value, so that the calling precheck
# function can determine whether this check and potential recompile was
# successful).  If a decision is made to get rid of it, then we can delete this
# function (and this comment).
#
# [2023.05.15 GJS]
#-------------------------------------------------------------------------------
function Verify-John {
    $tempString1 = /opt/john/run/john 2>&1
    if($tempString1 -match 'is required for this build'){
        Write-Host 'CPU chipset difference. Recompiling John' -ForegroundColor $color_info
        Set-Location /opt/john/src
        ./configure
        Write-Host 'Compiling... One moment please...'
        make -s clean
        make -sj4
        $tempString1 = /opt/john/run/john 2>&1
        if($tempString1 -notmatch 'is required for this build'){
            Write-Host 'John has been recompiled. Please proceed with the exercise.' -ForegroundColor $color_info
        } else {
            Write-Host 'Something went wrong. Please ask your instructor for help.' -ForegroundColor $color_error
        }
    } else {
        Write-Host 'Pre-check passed. Please proceed into the exercise.' -ForegroundColor $color_success
    }
}


#===============================================================================
# legacy
function Verify-LogstashIsRunning {
    $logstash_logs = (docker logs --tail 5 logstash)
    $output = ''
    foreach($line in $logstash_logs){
        $output += $line
    }
    if($output -match 'Pipelines running {:count=>1'){
        $logstash = 1
    }
    if($logstash -eq 1){
        Write-Host 'Logstash is online' -ForegroundColor $color_success
    }
}


#===============================================================================
# function WebServices-Verify
#-------------------------------------------------------------------------------
# Verify that one or more *local* webservices are up and running by querying
# them via HTTP or HTTPS, and seeing if we get the expected response.
#
# We can check for either a partial match on the HTML content, or an exact match
# on a JSON 'content' attribute (which is, for example, useful for
# Elasticsearch).
#
# The function tests for the first service, sleeps 5 seconds if the service
# doesn't respond as expected, and tries again until the service responds or
# $max_time is reached; then repeats for the subsequent services.  The $max_time
# limit applies to *all* services (i.e., if the limit is 360 seconds that the
# function waits a maximum of 360 seconds for all services, not 360 seconds per
# service).
#
#-------------------------------------------------------------------------------
# Arguments
#
# $max_time         integer    Maximum amount of time to wait for *all *of the
#                              web services to start and start responding.
#
# $service_list     Array[]    An array of arrays, where each element of the
#                              secondary arrays identifies an attribute of the
#                              service to test.
#
#         [][0] : Port number of the web service; string
#
#         [][1] : Whether to test via HTTP or HTTPS; boolean; $false=HTTP,
#                 $true=HTTPS
#
#         [][2] : The string to search for in the content retrieved from the
#                 services.
#
#         [][3] : The name of the service, used only in status messages
#                 generated by this function.
#
#         [][4] : Whether to search the retrieved content for any text matching
#                 [][2]; or to perform an exact match on retrieved JSON
#                 '.content' attribute.  $false=any matching text,
#                 $true=JSON '.content'.
#
#     For example, this function could be called with:
#
#         WebServices-Verify `
#           ( `
#               ('9200', $false, 'sec530', 'Elasticsearch', $true), `
#               ('5601', $true, '/app/kibana', 'Kibana', $false) `
#           )
#
#     ...would test whether:
#
#      - http://localhost:9200 responds with JSON that includes a .content
#        attribute of 'sec530' (without quotes)
#
#      - http://localhost:5601 responds with HTML that includes the text
#        '/app/kibana' (without quotes)
#
#-------------------------------------------------------------------------------
# Variables
#
# $start_time       DateTime object
#
#                              Time (roughly) that the function started, before
#                              looping to start the connection tests.
#
# $success          boolean    Flag on whether we passed all the tests for the
#                              all of the services.
#
#-------------------------------------------------------------------------------
# Return: (none)
#
#-------------------------------------------------------------------------------
function WebServices-Verify {
    param (
        [Parameter(Mandatory)]
        [Array []]$service_list,
        [Parameter(Mandatory = $false)]
        [int]$max_time = 360
    )

    [array]$local:service = $null
    [boolean]$local:success = $false
    [DateTime]$local:start_time = Get-Date

    foreach ($service in $service_list) {
        # reset $success to $false for each service to test
        $success = $false

        # NOTE: Changed how the time check is performed.  In the previous version
        # of the function, the time check wouldn't have ever caused the test loop
        # to exit -- and in the edge case where the first time Kibana and
        # Elastic both started responding was when $time was already 360, the
        # loop would have never exited.
        while ($success -eq $false -and ((Get-Date) - $start_time).TotalSeconds -le $max_time) {

            # test whether this service is running; wrap in a try/catch so that
            # the user doesn't see 'connection refused' or similar messages
            try {
                # if the service serves up JSON with a '.content' attribute
                # (e.g., Elasticsearch) then test for an exact match on that...
                if ($service[4]) {
                    if(((Invoke-WebRequest -Uri http://localhost:$($service[0]) -ErrorAction SilentlyContinue).Content | ConvertFrom-Json).cluster_name -eq $service[2]){
                        $success = $true
                    }

                # otherwise test for the content to match *somewhere* in the
                # served content
                } else {
                    if((Invoke-WebRequest -Uri http://localhost:$($service[0]) -ErrorAction SilentlyContinue).Content -match $service[2]){
                        $success = $true
                    }
                }
            } catch {}

            # display a message letting the user know what's going on
            if ($success) {
                Write-Host "$($service[3]) is online" -ForegroundColor $color_success
            } else {
                Write-Host "Waiting on $($service[3]) to start" -ForegroundColor $color_info
                Start-Sleep -Seconds 5
            }
        }
    }

    if (-not $success) {
        throw "[throw]Web services are not responding."
    }
}


#===============================================================================
# function to call for both ex. 4.1 and 'remediating web vulnerabilities', as
# part of precheck, postcheck, and/or cleanup (TO DO: need to come back this and cleanly
# separate between precheck, postcheck, and cleanup actions)
function Web-Vulnerabilities-Actions {
    # stop any running containers
    Docker-Containers-Stop

    # restore the original /etc/modsecurity/modsecurity.conf file to disable
    # ModSecurity
    Write-Host 'Restoring /etc/modsecurity/modsecurity.conf...'
    Copy-Item -Force /labs/4.1/backup/modsecurity.conf /etc/modsecurity/modsecurity.conf

    # restore the original /etc/modsecurity/rules/local-rules.conf files to
    # get rid of all custom rules
    Write-Host 'Restoring /etc/modsecurity/rules/local-rules.conf...'
    Copy-Item -Force /labs/4.1/backup/local-rules.conf /etc/modsecurity/rules/local-rules.conf

    # restart Apache so that the updated ModSecurity configurations take
    # effect
    Write-Host 'Restarting apache2 service...'
    service apache2 restart

    # restore the original /var/www/sec530-wiki/[docs,site]/test.php files and
    # to eliminate any edits made by the student (including as part of the
    # 'Remediate Web Vulnerabilities' bonus exercise)
    Write-Host 'Restoring /var/www/sec530-wiki/docs/test.php...'
    Copy-Item -Force /labs/4.1/backup/test.php /var/www/sec530-wiki/docs/test.php

    Write-Host 'Restoring /var/www/sec530-wiki/site/test.php...'
    Copy-Item -Force /labs/4.1/backup/test.php /var/www/sec530-wiki/site/test.php
}


#===============================================================================
# Main Script
#-------------------------------------------------------------------------------
# Arguments (see Help-Display for more details)
#
# $check            string     the type of check: cleanup, postcheck, precheck
#
# $h                bool       whether to display help
#
# $help             bool       whether to display help
#
# $lab              string     which exercise label to act on
#
#                              NOTE: '-lab' is deprecated in favor of
#                              '-exercise'.  We use a separate parameter
#                              instead of [Alias('lab'] on -exercise so that we
#                              can detect and provide a message when -lab is
#                              used.
#
# $exercise         string     which exercise label to act on
#
# $sub              string     'sub-exercise' identifier
#
# $v                bool       whether to display verbose messages
#
#-------------------------------------------------------------------------------
# Local Variables
#
# $args_bad         bool       have we identified a problem with the arguments?
#
# $color_error      string     color name to use for 'error' messages
#
# $color_info       string     color name to use for 'informational' messages
#
# $color_success    string     color name to use for 'success' messages
#
# $tempString1      string     temporary string variable
#
# $tempString2      string     temporary string variable
#
# $x_hash           hash of hashes
#
#                              See detailed comments below for details on how
#                              this variable is defined and used.
#
#-------------------------------------------------------------------------------
# Automatic Variables Referenced (not comprehensive, just a quick reference)
#
# $args, $Error
#-------------------------------------------------------------------------------

[String]$local:tempString1=$null
[String]$local:tempString2=$null

# define colors to use for different types of output messages
[String]$local:color_error = 'Red'
[String]$local:color_success = 'Green'
[String]$local:color_info = 'Cyan'
[String]$local:color_warning = 'Yellow'

# set an initial flag for whether the arguments are all good; this allows us to
# perform all (or most) argument checks, display multiple error messages, and
# then exit, so that the user doesn't have to try to run the command multiple
# times to figure out multiple argument mistakes
[Boolean]$local:args_bad = $false

# NOTE: The $x_hash variable is used in argument validation and help content,
# and so needs to be defined and updated (based on presence of precheck,
# postcheck, and cleanup functions) before then.

# Use $x_hash to identify different exercises for which precheck, postcheck,
# and clean functions are defined.  The completed structure for the hash is:
#
#     $x_hash = @{
#         'EXERCISE_LABEL' = @{
#             [title = 'EXERCISE_TITLE']
#             [; cleanup = $true][; postcheck = $true][; precheck = $true]
#             [; subs = @{ [SUB_LABEL = $true[; ...]]
#         [; ...]
#     }
#
# Where:
#
#    title     = the title that is displayed in the help content as associated
#                with the EXERCISE_LABEL; set in the variable definition
#
#    cleanup   = flag whether a cleanup function is defined for the associated
#                EXERCISE_LABEL; programmatically set
#
#    postcheck = flag whether a postcheck function is defined for the associated
#                EXERCISE_LABEL; programmatically set
#
#    precheck  = flag whether a precheck function is defined for the associated
#                EXERCISE_LABEL; programmatically set
#
# For example:
#
#     $x_hash = @{
#         'threatmodeling' = @{
#             title = 'Practical Threat Modeling with MITRE ATT&CK';
#             postcheck = $true; precheck = $true
#         };
#         '2.2' = @{
#             cleanup = $true
#         };
#         'egress' = @{ title = 'Egress Analysis'; postcheck = $true };
#         'router' = @{ precheck = $true;
#             subs = @{ router = $true; snmp = $true }
#         }
#     }
#
# Note that every nested hash key beneath each $x_hash['EXERCISE_LABEL']
# (i.e., title, precheck, postcheck, cleanup, subs) is optional; but at least
# one will be defined for each primary hash key in the populated hash.
#
# The cleanup, postcheck, and precheck values are automatically populated based
# based on the existence of functions named
# _Exercise-EXERCISE_LABEL-CHECK_ACTION, where EXERCISE_LABEL is a label used
# as the function's -exercise argument value and CHECK_ACTION is an action
# supported by function's -check argument and 
#
# The only primary and nested hash keys that need to be defined in the variable
# definition are primary hash keys (i.e., EXERCISE_LABEL values) for which a
# secondary 'title' or 'subs' hash key are desired.
#
# For example, consistent with the example above where there are four primary
# hash keys but two primary hash keys have a 'title' secondary hash key and one
# primary hash key has a 'subs' secondary hash key defined, the variable
# definition would simply be:
#
#     $x_hash = @{
#         'threatmodeling' = @{
#             title = 'Practical Threat Modeling with MITRE ATT&CK'
#         };
#         'egress' = @{ title = 'Egress Analysis' };
#         'router' = @{ subs = @{ router = $true; snmp = $true } }
#     }
#
# ...and the remaining primary and secondary hash keys would be automatically
# populated based on the existence of the following functions:
#
#     _Exercise-threatmodeling-precheck
#     _Exercise-threatmodeling-postcheck
#     _Exercise-2.2-cleanup
#     _Exercise-egress-postcheck
#     _Exercise-router-precheck

# TO DO: REVIEW AND UPDATE THIS VARIABLE DEFINITION AGAINST UPDATED _Exercise-*-* FUNCTIONS!

$local:x_hash = @{
    '2.4' = @{ title = 'Proxy Power' };
    '3.1' = @{ title = 'Archiecting for NSM' };
    '3.2' = @{ title = 'Network Securing Monitoring' };
    '4.1' = @{ title = 'Securing Web Applications' };
    '4.2' = @{ title = 'Discovering Sensitive Data' };
    '4.3' = @{ title = 'Secure Virtualization' };
    '5.1' = @{ title = 'Network Isolation and Mutual Authentication' };
    '5.2' = @{ title = 'SIEM Analysis and Tactical Detection' };
    '5.4' = @{ title = 'Advanced Defense Strategies' };
    'egress' = @{ title = 'Egress Analysis' };
    'flow' = @{ title = 'Architecting for Flow Data'};
    'ja3' = @{ title = 'Operationalizing JA3' };
    'l2' = @{ title = 'Layer 2 Attacks' };
    'polarproxy' = @{ title = 'Encryption Considerations' };
    'remediate' = @{ title = 'Remediating Web Vulnerabilities' };
    'router' = @{ title = 'Auditing Router Security, Router SNMP Security'; subs = @{ audit = $true; snmp = $true } };
    'sigma' = @{ title = 'Sigma Generic Signatures' };
    'threatmodeling' = @{ title = 'Practical Threat Modeling with MITRE ATT&CK' };
    'ALL' = @{ title = 'Cleanup ALL exercises' };
    'TESTING' = @{ title = 'TESTING' }
}

# Process the list of functions and update $x_hash to note which exercise
# labels have cleanup, postcheck, or precheck functions associated with them.
foreach ($tempString1 in Get-ChildItem function: | Where-Object { $_.Name -match '^_Exercise-.*-(precheck|postcheck|cleanup)$' } | Select -ExpandProperty 'Name') {

    # split into two strings based on '-' delimiter
    #  - toss the first substring
    #  - keep the second string (which can contain - characters) as the exercise
    #    label
    #  - keep the last substring as the CHECK_TYPE
    $tempString1, $tempString2 = $tempString1.split('-', 3)[1,2]

    # if this exercise label is already present, then update with the secondary
    # hash key
    if ($x_hash.Keys -ccontains $tempString1) {
        $x_hash[$tempString1][$tempString2]=$true

    # if this exercise label is not already present, then create the primary
    # and secondary hash keys in one operation
    } else {
        $x_hash.Add($tempString1, @{ $tempString2=$true })
    }
}

#-------------------------------------------------------------------------------
# Additional argument checks - beyond what we're leveraging from param()

# if '-h' or '-help were used as arguments, then display help and exit
if ($h -or $help) {
    Help-Display
    Exit
}

# checks related to use of (deprecated) -lab argument
if ($lab -ne '') {

    # if -lab was used and -exercise was not, then set $exercise so that we're just
    # using that variable going forward
    if ($exercise -eq '') {
        $exercise = $lab

    # both -exercise and -lab were used
    } else {
        Write-Host "'-exercise' and '-lab' cannot be used together." -ForegroundColor $color_error

        # flag that there was an error with the arguments
        $args_bad=$true
    }
}

# validate -exercise argument values (exercise label)
if ($exercise -cnotin $x_hash.Keys) {

    # add a blank line after a previous error message
    if ($args_bad) { Write-Host }

    if ($exercise -eq '') {
        Write-Host "Missing '-exercise' argument." -ForegroundColor $color_error -nonewline
    } else {
        Write-Host "Invalid '-exercise' argument value." -ForegroundColor $color_error -nonewline
    }

    Write-Host " Valid exercise labels are: $(($x_hash.Keys | Sort-Object -CaseSensitive) -join ', ')" -ForegroundColor $color_info

    # flag that there was an error with the arguments
    $args_bad=$true
}

# validate -check argument values 
if ($check -cnotin ('precheck','postcheck','cleanup')) {

    # add a blank line after a previous error message
    if ($args_bad) { Write-Host }

    if ($check -eq '') {
        Write-Host "Missing '-check' argument." -ForegroundColor $color_error -nonewline
    } else {
        Write-Host "Invalid '-check' argument value." -ForegroundColor $color_error -nonewline
    }

    Write-Host " Value must be either 'precheck', 'postcheck', or 'cleanup'." -ForegroundColor $color_info

    # flag that there was an error with the arguments
    $args_bad=$true
}

# if there weren't *any* other errors with -exercise or -check argument values,
# then check to see if this is a valid EXERCISE_LABEL and CHECK_TYPE
# combination
if (! $args_bad) {

    # Allow a precheck if any of cleanup, cleanup, or postcheck, are defined.
    # This is because any exercise that has a cleanup or postcheck function
    # should inherently support a precheck that at *least* executes any
    # postcheck and then cleanup actions.
    if ( -not ( `
           ($check -ceq 'precheck' -and ($x_hash[$exercise].cleanup -or $x_hash[$exercise].postcheck -or $x_hash[$exercise].precheck)) `
           -or ($check -ceq 'cleanup' -and $x_hash[$exercise].cleanup) `
           -or ($check -ceq 'postcheck' -and $x_hash[$exercise].postcheck) `
         ) `
       ) {

        Write-Host "Invalid combination of '-exercise' and '-check' argument values." -ForegroundColor $color_error

        # flag that there was an error with the arguments
        $args_bad=$true
    }
}

# if there weren't *any* other errors with -exercise or -check argument values,
# then check to see if $sub is valid
# combination
if (! $args_bad) {
    # error out if:
    #
    #  - -sub was used when there aren't -sub options defined for this
    #    EXERCISE_LABEL
    #
    #  - an invalid -sub argument was used for this EXERCISE_LABEL
    #
    #  - -sub wasn't used and there are -sub options defined for this
    #    EXERCISE_LABEL
    if (($sub -ne '' -and ($x_hash[$exercise]['subs'] -eq $null -or $x_hash[$exercise]['subs'][$sub] -eq $null)) -or ($sub -eq '' -and $x_hash[$exercise]['subs'] -ne $null)) {
        Write-Host "Invalid combination of '-exercise' and '-sub' argument values." -ForegroundColor $color_error

        # flag that there was an error with the arguments
        $args_bad=$true
    }
}

# check for unkown arguments; anything left in $args after param() processing?
if ($args) {

    # add a blank line after a previous error message
    if ($args_bad) { Write-Host }

    Write-Host "Unknown arguments: $args" -ForegroundColor $color_error

    # flag that there was an error with the arguments
    $args_bad=$true
}

# exit if there were any argument errors
if ($args_bad) {
    # Display warning about -lab being deprecated.  We're displaying this
    # message only if there is some other error, because (a) we don't want the
    # script output to be different than the 'your output should look like x'
    # text in    # the exercise instructions, where those instructions use
    # '-lab'; and (b) we don't want to confuse the students by putting up an
    # error or warning message that doesn't keep them from moving forward.
    if ($lab -ne '') {
        Write-Host "`nNote: '-lab' is supported for backwards-compatibility but is deprecated in favor of '-exercise'." -ForegroundColor $color_error
    }

    Write-Host "`nUse '-h' for detailed help." -ForegroundColor $color_info
    Exit
}

# Now we can finally run the commands associated with the requested exercise
# and check type.
#
# This is all wrapped in a try/catch.
#
#  - If everything is successful, then display a 'successfully completed'
#    message.
#
#  - If an error is thrown, then display a 'please contact your instructor'
#    message.  This message will only be seen if the various called functions do
#    *not* use 'exit' to terminate on an error (because that exits the entire
#    script, not just the enclosing block or function).
try {
    # Perform any actions that should *always* be taken when running this
    # script, for every exercise label and check type, *before* running the
    # exercise-specific actions.
    Universal-Actions-Before

    # Part of setting up the environment for an exercise (i.e., precheck) is
    # making sure that the# standard environment has been restored (i.e.,
    # postcheck) and that remnants of previous executions of this exercise have
    # been removed (i.e., cleanup).
    #
    # So if a precheck was requested, then we need to first process actions for
    # a postcheck, and then process actions for a cleanup.
    if ($check -ceq 'precheck') {
        # just because a precheck was requested doesn't necessarily mean that
        # there's a postcheck function; double-check
        if ($x_hash[$exercise].Keys -ccontains 'postcheck') {
            if ($v) { Write-Host "Calling: _Exercise-$x-postcheck" }

            & ('_Exercise-' + $exercise + '-postcheck')
        }

        # just because a precheck was requested doesn't necessarily mean that
        # there's a cleanup function; double-check
        if ($x_hash[$exercise].Keys -ccontains 'cleanup') {
            if ($v) { Write-Host "Calling: _Exercise-$exercise-cleanup" }

            & ('_Exercise-' + $exercise + '-cleanup')
        }
    }

    # process actions for the requested check type
    #
    # If this is a precheck and there is a postcheck or cleanup function, then
    # check for the existence of the precheck function before calling it.  This
    # is necessary because requesting a precheck is allowed if there's no
    # precheck function but there is a postcheck or cleanup function.
    #
    # But if this is any other type of check, or is a precheck and there isn't a
    # postcheck or cleanup function, then don't check for the existence of the
    # function before calling it.  This way if there's a problem with the script
    # logic or the $x_hash values, then we'll catch it.
    if (-not ($check -ceq 'precheck' -and ($x_hash[$exercise].Keys -ccontains 'postcheck' -or $x_hash[$exercise].Keys -ccontains 'cleanup')) -or $x_hash[$exercise].Keys -ccontains 'precheck') {
        if ($v) { Write-Host "Calling: _Exercise-$x-$check" }

        & ('_Exercise-' + $exercise + '-' + $check)
    }

    # Perform any actions that should *always* be taken when running this
    # script, for every exercise label and check type, *after* running the
    # exercise-specific actions.
    Universal-Actions-After

    # if there were no errors (and if there were, then we'd never get to this
    # line), then display a 'success' message
    if ($check -eq 'precheck') {
        Write-Host "`nYou may proceed with the exercise." -ForegroundColor $color_info

    } elseif ($check -eq 'postcheck') {
        Write-Host "`nPostcheck complete." -ForegroundColor $color_info

    } elseif ($check -eq 'cleanup') {
        Write-Host "`nCleanup complete." -ForegroundColor $color_info
    }

# This is the catch for the commands associated with the requested exercise and
# and check type, including the Universal-* functions.
#
# Note that errors thrown in called functions will - in the absence of error
# handling in those functions - get caught here.
} catch {
    # All 'throw' messages that we generate programmatically will start with the
    # string '[throw]' (because we'll make sure to start them that way).  If
    # this is an error that we threw, then display the message (but without the
    # leading '[throw]').
    if ($Error[0].FullyQualifiedErrorId.StartsWith('[throw]')) {
        Write-Host "`n$($Error[0].FullyQualifiedErrorId.Substring(7))" -ForegroundColor $color_error
    }

    # If this is not an error that we threw, then display the error as normal.
    else {
        $Error[0]
    }

    # display an additional 'ask for help' message
    Write-Host "`nPlease contact your instructor for help." -ForegroundColor $color_error
}

