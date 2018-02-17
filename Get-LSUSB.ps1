Function Get-LSUSB {
    If (Get-Command lsusb -ErrorAction SilentlyContinue) {
        lsusb | ForEach-Object {
            $_ -match '^Bus (?<Bus>\d{3}) Device (?<Device>\d{3}): ID (?<ID>[0-9a-f:]{9}) (?<Name>.+)$' | Out-Null
            $matches.Remove(0)
            [PSCustomObject]$matches | Select-Object Bus, Device, ID, Name
        }
    } Else {
        Write-Warning "The command lsusb is not available on this operating system."
    }
}

lsusb

Get-LSUSB

Get-LSUSB | Sort-Object Name

Get-LSUSB | Sort-Object Bus, Device
