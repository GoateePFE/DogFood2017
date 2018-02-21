
<#

Language Mode

CTRL ` for terminal

CTRL SPACE for Intellisense

F5 / F8

Debugger / F9 / F10 / F11

Paired punctuation

Search results and highlighting

#>

# Script analyzer
# Problems tab at bottom
# Lightbulbs in margin
gps
$UnusedVariable = 'foo'


#Go To Definition / Find All References
Function Get-Foo {
    'here is your foo'
}

Get-Foo


#region Expand me
If ($true) {
    #Expand braces
}
#endregion

Get-Foo


#Format Selection/Document
If ($true) {
'do this'
'do that'}

$MyHashTable = @{
Name = 'Benny'
Company='Octan'
FavoriteDay = 'Taco Tuesday'
HeightInCm=4
}

# Show README.md markdown preview in VSCode
