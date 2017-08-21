<#
.Synopsis
   DSC Configuration Template for DSC Resource Integration tests.
.DESCRIPTION
   To Use:
     1. Copy to \Tests\Integration\ folder and rename <ResourceName>.config.ps1 (e.g. MSFT_xFirewall.config.ps1)
     2. Customize TODO sections.

.NOTES
#>


# Integration Test Config Template Version: 1.0.0
configuration MSFT_AccessControlEntry_config {
    # TODO: Modify ModuleName (e.g. xNetworking)
    Import-DscResource -ModuleName 'AccessControlDsc'
    node localhost {

        AccessControlEntry Integration_Test {
            # TODO: Fill Configuration Code Here
        }
    }
}

# TODO: (Optional): Add More Configuration Templates
