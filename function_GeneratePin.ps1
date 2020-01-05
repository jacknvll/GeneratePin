<#
.Synopsis
   Creates a PIN code of integers.
.DESCRIPTION
   Generate one or more random PIN codes, by specifying the number of characters, and the count required. 
.EXAMPLE
   Generate-Pin -Char 8
.EXAMPLE
   Generate-Pin -Char 7 -Count 5
#>
function Generate-Pin
{
    [CmdletBinding()]
    [Alias('gpin')]
    [OutputType([int])]
    Param
    (
        # Define number of characters to spit out. Default = 8
        [Parameter(Position=1)]
        [int]
        $Char=8,

        # Define number of Pins to generate. Default number is 1
        [Parameter(Position=2)]
        [int]
        $Count=1
    )
    #Initial clearing of variables
    $Result = @()
    $Error.Clear()

    #Determine minimum and maximum of Characters, using the Math library
    $Minimum = [math]::Pow(10,$Char-1)
    $Maximum = [math]::Pow(10,$Char)-1

    for ($i=1;$i -le $Count;$i++){
    $Random = Get-Random -Minimum $Minimum -Maximum $Maximum
    $Result += [math]::Round($Random)
    }

    return $Result
}

