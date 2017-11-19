# SharePoint Online Permission List Exporter
To Manage SharePoint Online Site Permissions

## Purpose
This cmdlet creates a list of SharePoint Online permissions in csv format, including "Site", "Admin", "spGroup", and "Users".

## Step to run
This cmdlet requires "SharePoint Online Management Shell" which you can download from 
https://www.microsoft.com/ja-jp/download/confirmation.aspx?id=35588

Change the following in the script:
+ $Domain = "https://\<Domain\>-admin.sharepoint.com"
+ $Username = "\<SharePointAdminName\>@\<Domain\>"
+ $OutputPath = "C:\\<Wherever\>\permissions.csv"

Copy the script and paste it on the PowerShell window.
The output will be created in $OutputPath.
