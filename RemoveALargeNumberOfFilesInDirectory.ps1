$limit = (Get-Date).AddDays(-7)
$path = "<DirectoryWhereFilesNeedToBeDeleted>"
Get-ChildItem -Path $path -Recurse -Force | Where-Object { !$_.PSIsContainer -and $_.CreationTime -lt $limit } | Remove-Item -Force -WhatIf




# -7 Means delete files older than 7 days. 
# $path is the path of the directory where you'd like to delete the files
# -Recurse can be removed in order to not recurse in directories
# -WhatIf Means that you are only testing the deletion. To check for any errors. Remove this option to actually delete the files

# The advantage is that deleting over 100.000 files in a directory using the Windows Explorer, is terribly slow!

Shorter version in a oneliner: 
# Get-ChildItem -path <DirectoryWhereFilesNeedToBeDeleted> | where {$_.Lastwritetime -lt (date).adddays(-7)} | remove-item