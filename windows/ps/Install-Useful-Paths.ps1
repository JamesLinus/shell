#
# Permanently set the environment variable path for the User, adding 
# some program for which installers fail to modify path appropriately.
#
# The change is permanent!!


$program_paths = "C:\Program Files\" , "C:\Program Files (x86)\"

$tool_paths    = "Emacs\bin","Putty","Python2.7"

$mypath =""

foreach ($p in $program_paths) { 
    foreach ($t in $tool_paths) { 
        $elem=$p+$t; 
        if((test-path $elem -pathtype container)) { 
            $mypath += ";"+$elem
            }
        } 
    }

[System.Environment]::SetEnvironmentVariable("PATH", $Env:Path + $mypath, "User")