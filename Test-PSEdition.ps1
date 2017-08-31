<#
Create a function Get-CommandOS that returns a hash table of commands
for OS-specific things like ? create a new user, pkg mgmt, etc.
Then invoke the hash table parameterized command.
Could also have a formatter string with the necessary OS-specific placeholders.
#>

Function Test-PSEdition {

    "This is PowerShell $($PSVersionTable.PSEdition) edition on $($PSVersionTable.OS)."

    Switch ($PSVersionTable.PSEdition) {
        'Desktop' {
            'This is Desktop PowerShell on Windows'
        }
        'Core' {
            Switch ($null) {
                {$IsWindows} { 'This is Core PowerShell on Windows'; break }
                {$IsLinux}   { 'This is Core PowerShell on Linux'  ; break }
                {$IsOSX}     { 'This is Core PowerShell on MacOS' }
            }
        }
    }
}

$Host

$PSVersionTable

Test-PSEdition