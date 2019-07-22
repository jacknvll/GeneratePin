<#
.Synopsis
   Used for hard drive encryption. Creates a code of integers.
.DESCRIPTION
   Generate one or more random PIN codes. 
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
        [Parameter(Mandatory=$true)] 
        [int]
        $Char,

        # Define number of Pins to generate. Could use a Do/While statement
        [Parameter(Mandatory=$false)]
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

<#
    WORKINGS
    Original Switch statement:
    switch ($Char){
            6 {$Result += Get-Random -Minimum 100000 -Maximum 999999} #[1]*1[0]*5 -> [9]*6
            7 {$Result += Get-Random -Minimum 1000000 -Maximum 9999999}
            8 {$Result += Get-Random -Minimum 10000000 -Maximum 99999999}
            9 {$Result += Get-Random -Minimum 100000000 -Maximum 999999999}
            10 {$Result += Get-Random -Minimum 1000000000 -Maximum 9999999999} #[1]*1[0]*9 -> [9]*10
        }

    Formula Notes:
    For $Char = 6
    Range = 10^5 -> (10^6)-1
          = 10^(6-1) -> (10^6)-1
          = 10^(n-1) -> (10^n)-1
    Here, $Char = n    
    [int]$Minimum = 10^(n-1)
    [int]$Maximum = (10^n)-1

    $Result += Get-Random -Minimum $Minimum -Maximum $Maximum 

#>