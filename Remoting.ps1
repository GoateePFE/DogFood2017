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

# Demo remoting from the Mac to the Windows and Linux machines

# Notice that -Session parameter can take an array of PowerShell Sessions
Get-Command Invoke-Command -Syntax

# Create an array of separately-authenticated SSH remoting sessions
$PSSessions = @(
    (New-PSSession -SSHTransport -HostName 10.211.55.3 -UserName testadmin -Name Windows10),
    (New-PSSession -SSHTransport -HostName 10.211.55.4 -UserName parallels -Name Ubuntu)
)

# Pass that array into a single, cross-platform Invoke-Command
Invoke-Command -Session $PSSessions -ScriptBlock {hostname}

Invoke-Command -Session $PSSessions -ScriptBlock {
    Get-Process | Sort-Object CPU -Desc | Select-Object -First 3} |
    Sort-Object PSComputerName, CPU

Invoke-Command -Session $PSSessions -ScriptBlock {dir variable:is*} |
    Sort-Object PSComputerName, Name

Get-PSSession | Remove-PSSession
