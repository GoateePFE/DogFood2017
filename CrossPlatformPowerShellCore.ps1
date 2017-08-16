
break

# Notice PSEdition, OS, Platform
$PSVersionTable

# Built-in variables for OS detection
Get-Variable Is*

# Which commands do I have here?
Get-Command

# Case sensitivity
cat /etc/ssh/sshd_config
cat /ETC/SSH/sshd_config
Get-Item /etc/ssh/sshd_config
Get-Item /ETC/SSH/sshd_config

# Slashes
Get-Item \ETC\SSH\sshd_config  # Eeewwwww! Slash and case confusion! It works!get
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

Get-Help dir
man ls

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

top
Get-Process | Sort-Object CPU -Descending | Select-Object -First 5

ps aux
ps aux | grep code
ps aux | Select-String -Pattern "code"
Get-Process *code*

tail -f /etc/aliases    # CTRL C
Get-Content -Path /etc/aliases -Tail 10 -Wait

ps aux | wc
ps aux | Measure-Object -Line -Word -Character
Get-Process | Measure-Object -Line -Word -Character
Get-Process | Measure-Object

break

Get-Module

Get-Module -ListAvailable

break

[math]::PI

[math]::Pow(2,8)

[datetime]'12/25/17'

$d = Get-Date
$d | Get-Member
$d.Year
$d.AddDays(-14)

break

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
            Start-Sleep -Seconds 1
            (' '*(($host.ui.rawui.windowsize.width/2)-($_.Length/2)))+$_
        }
}

Start-StarWarsScroll -Movie 1


break

((Invoke-WebRequest -Uri "https://swapi.co/api/films/").Content | ConvertFrom-Json).results |
    Sort-Object episode_id |
    Select-Object title, release_date, director, producer

(Invoke-WebRequest -Uri "https://swapi.co/api/films/?format=wookiee").Content

((Invoke-WebRequest -Uri "https://swapi.co/api").Content | ConvertFrom-Json)

break


Enter-PSSession -HostName 10.211.55.4 -UserName parallels -SSHTransport

Enter-PSSession -HostName 10.211.55.3 -UserName Goatee10\testadmin -SSHTransport


# In VS Code the password prompt hangs until you press ENTER once
$s1 = New-PSSession -HostName 10.211.55.4 -UserName parallels -SSHTransport
Enter-PSSession $s1

Exit

# Permission denied
$s2 = New-PSSession -HostName 10.211.55.3 -UserName Goatee10\testadmin -SSHTransport
Enter-PSSession $s2

Exit

Get-PSSession

Get-PSSession | Remove-PSSession

break

