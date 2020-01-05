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
    [Alias()]
    [OutputType([int])]
    Param
    (
        # Define number of characters to spit out, could use a Switch statement for this one. ParameterSet as well? as it needs minimum 6 characters
        [Parameter(Mandatory=$true,Position=1)]
        [int]
        $Char,

        # Define number of Pins to generate. Could use a Do/While statement
        [Parameter(Mandatory=$false,Position=2)]
        [int]
        $Count
    )
    #Initial clearing of variables
    $Result = @()
    $Error.Clear()

    #Determine minimum and maximum of Characters, using the Math library
    $Minimum = [math]::Pow(10,$Char-1)
    $Maximum = [math]::Pow(10,$Char)-1

    if ($Count){ #If COUNT variable was provided, complete the FOR LOOP
        for ($i=1;$i -le $Count;$i++){
            $Random = Get-Random -Minimum $Minimum -Maximum $Maximum
            $Result += [math]::Round($Random)
        }
    } else { #If no COUNT variable was provided, complete the task ONCE.
       $Random = Get-Random -Minimum $Minimum -Maximum $Maximum
       $Result += [math]::Round($Random)
    }
    return $Result
}

