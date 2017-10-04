
break

# Notice PSEdition, OS, Platform
$PSVersionTable

# Built-in variables for OS detection
Get-Variable Is*

# Which commands do I have here?
Get-Command

# Finally! A way to view a list of native commands...
Get-Command -CommandType Application
Get-Command -CommandType Application | Format-Wide Name -AutoSize

# Case sensitivity
cat /etc/ssh/sshd_config
cat /ETC/SSH/sshd_config
Get-Item /etc/ssh/sshd_config
Get-Item /ETC/SSH/sshd_config

# Slashes
# Eeewwwww! Slash and case confusion! It works!
Get-Item \ETC\SSH\sshd_config
dir ~
dir $HOME
dir ~/Documents
dir ~\Documents
dir /etc/
ls /etc/
cat /etc/networks
Get-Content \etc\networks

# Aliases
Get-Alias
Get-ChildItem
dir
ls
ls -l

Get-Help dir
#man ls

cd /
cd ~
cd \
cd $HOME

break

cat /etc/passwd
Get-Content /etc/passwd

cat /etc/passwd |
    ConvertFrom-Csv -Delimiter ':' -Header Name,Passwd,UID,GID,Description,Home,Shell |
    Sort-Object Name | Format-Table

top  # CTRL+C to exit in VSCode
Get-Process | Sort-Object CPU -Descending | Select-Object -First 5

ps aux
cls
ps aux | grep code
cls
ps aux | Select-String -Pattern "code"
cls
Get-Process *code*

tail -f /etc/aliases    # CTRL+C twice
Get-Content -Path /etc/aliases -Tail 10 -Wait

ps aux | wc
ps aux | Measure-Object -Line -Word -Character
Get-Process | Measure-Object -Line -Word -Character
Get-Process | Measure-Object

break

# Mix PowerShell and Python inline

python -c "print('Hello from Python')"

(python -c "print('Hello from Python')").ToUpper()

python -c "print('Username,EmployeeNum,Company\nBenny,123,Octan')" | ConvertFrom-Csv

break

Get-Module

Get-Module -ListAvailable

break

# .NET type accelerators available, since we are running .NET Standard (Core)

[math]::PI

[math]::Pow(2,8)

[datetime]'12/25/17'

$d = Get-Date
$d | Get-Member
$d.Year
$d.AddDays(-14)

break

# Unix/Linux background jobs with the appended ampersand (&)
# Integrates with PowerShell jobs

Get-Command -Noun Job
Start-Job -ScriptBlock {Get-Process}
Get-ChildItem -Recurse&
cat /etc/passwd&
Get-Job
Receive-Job 1
Get-Job
Remove-Job 1
Get-Job
Stop-Job 3
Get-Job
Receive-Job 3 -Keep
Get-Job
Get-Job | Remove-Job

break

((Invoke-WebRequest -Uri 'http://jsonplaceholder.typicode.com/posts?userid=1' -Method Get).Content |
    ConvertFrom-Json) | 
    Where-Object title -like "*magni*"

break

Function Start-StarWarsScroll {
param(
    [ValidateRange(1,7)]
    [int]$Movie = 1
)
    cls
    ((Invoke-WebRequest -Uri "https://swapi.co/api/films/$Movie/").Content | `
        ConvertFrom-Json).opening_crawl.split("`n") |
        ForEach-Object {
            Start-Sleep -Milliseconds 500
            (' '*(($host.ui.rawui.windowsize.width/2)-($_.Length/2)))+$_
        }
}

Start-StarWarsScroll -Movie 1


break

((Invoke-WebRequest -Uri "https://swapi.co/api").Content | ConvertFrom-Json)

((Invoke-WebRequest -Uri "https://swapi.co/api/films/").Content | ConvertFrom-Json).results |
    Sort-Object episode_id |
    Select-Object title, release_date, director, producer

(Invoke-WebRequest -Uri "https://swapi.co/api/films/?format=wookiee").Content

break
# Do these from the terminal window
# If in then VSCode window you might need an
# extra ENTER keystroke to get the password prompt.

ssh parallels@10.211.55.4
Enter-PSSession -HostName 10.211.55.4 -UserName parallels -SSHTransport

ssh testadmin@10.211.55.3
Enter-PSSession -HostName 10.211.55.3 -UserName Goatee10\testadmin -SSHTransport

# In VS Code the password prompt hangs until you press ENTER once
$s1 = New-PSSession -HostName 10.211.55.4 -UserName parallels -SSHTransport
Get-PSSession
Enter-PSSession $s1
ifconfig
Exit

# Permission denied ?! sometimes
$s2 = New-PSSession -HostName 10.211.55.3 -UserName Goatee10\testadmin -SSHTransport
Get-PSSession
Enter-PSSession $s2
ipconfig
Get-Service
Exit

Get-PSSession

Get-PSSession | Remove-PSSession

break

# More demos available online:
# crontab
# SystemD
# Apache
# Azure
Start-Process https://github.com/PowerShell/PowerShell/tree/master/demos
open -a safari https://github.com/PowerShell/PowerShell/tree/master/demos
firefox https://github.com/PowerShell/PowerShell/tree/master/demos
