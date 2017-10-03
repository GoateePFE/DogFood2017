Function Get-LSUSB {
    lsusb | ForEach-Object {
        $_ -match '^Bus (?<Bus>\d{3}) Device (?<Device>\d{3}): ID (?<ID>[0-9a-f:]{9}) (?<Name>.+)$' | Out-Null
        $matches.Remove(0)
        [PSCustomObject]$matches | Select-Object Bus, Device, ID, Name
    }
}

lsusb

Get-LSUSB | Sort-Object Name
