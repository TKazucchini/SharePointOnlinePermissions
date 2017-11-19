<#######################################################################
SharePoint Online Permission List Exporter Ver. 0.01
Author: kazutak
Created on: 2017/11/20
Last Modified on: 2017/11/20
Note: This cmdlet requires "SharePoint Online Management Shell"
https://www.microsoft.com/ja-jp/download/confirmation.aspx?id=35588
########################################################################>

$Domain = "https://<Domain>-admin.sharepoint.com"
$Username = "<SharePointAdminName>@<Domain>"
$OutputPath = "C:\<Wherever>\permissions.csv"

Connect-SPOService -Credential $Username -Url $Domain
$CustomObject = @()
$x = Get-SPOSite
foreach ($y in $x)
    {
        $z = Get-SPOSiteGroup -Site $y.Url
        foreach ($a in $z)
            {
                $b = Get-SPOSiteGroup -Site $y.Url -Group $a.Title
                $Data = New-Object PSObject | Select-Object Site, Admin, SpGroup, Users
                $Data.Site =  $y.Url
                $spousers = Get-SPOUser -Site $y.Url
                $u = $spousers | Select LoginName, IsSiteAdmin | Where-Object {$_.IsSiteAdmin -eq $true}
                $Data.Admin = (($u | Select-Object -ExpandProperty LoginName) -join ' | ')
                $Data.SpGroup = $b.Title
                $Data.Users = (($b | Select-Object -ExpandProperty Users) -join ' | ')
                Write-Host "Please Wait..."
                $CustomObject += $Data
            }
    }
$CustomObject | Export-CsV -Path $OutputPath -Encoding UTF8 -NoTypeInformation