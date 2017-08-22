function Resolve-Identity
{
    <#
    .SYNOPSIS
        

    .DESCRIPTION
        

    .PARAMETER Identity
        Specifies the identity of the principal.
    #>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [String]
        $Identity
    )
    process
    {
        try
        {
            Write-Verbose -Message "Resolving identity for '$Identity'."

            if ($Identity -match '^S-\d-(\d+-){1,14}\d+$')
            {
                [System.Security.Principal.SecurityIdentifier]$Identity = $Identity
            }
            else
            {
                 [System.Security.Principal.NTAccount]$Identity = $Identity
            }

            $SID = $Identity.Translate([System.Security.Principal.SecurityIdentifier])
            $NTAccount = $SID.Translate([System.Security.Principal.NTAccount])

            $Principal = [PSCustomObject]@{
                Name = $NTAccount.Value
                SID = $SID.Value
            }

            return $Principal
        }
        catch
        {
            $ErrorMessage = "Could not resolve identity '{0}': '{1}'." -f $Identity, $_.Exception.Message
            Write-Error -Exception $_.Exception -Message $ErrorMessage
            return
        }
    }
}