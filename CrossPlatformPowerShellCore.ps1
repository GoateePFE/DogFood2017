
Get-Process | Sort-Object CPU -Descending | Select-Object -First 5


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

