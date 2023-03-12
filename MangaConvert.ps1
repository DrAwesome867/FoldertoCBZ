$Env:PATH += "C:/Program Files/7-Zip;"
#Write-Output $Env:PATH
$MangaDir = Read-Host "Enter the main manga location with chapters in folders (no quotes)`n"
Write-Output $MangaDir
Get-Variable -Name "MangaDir"
$items = Get-ChildItem -Path $MangaDir
$MangaDir = $MangaDir.Insert(0,'"')
foreach ($item in $items) {
		if ($item.Attributes -eq "Directory") {
			Write-Host $item.Name
			$array=$item.Name
		}
		
		$FullPath = $MangaDir + "/" + $item
		$Length = $FullPath.Length
		$FullPath = $FullPath.Insert($Length,'"')
		Write-Output $FullPath
		$ZipName = $FullPath + ".cbz"
		$FullPath = $FullPath + "/*"
		7z a $ZipName $FullPath
		Remove-Variable FullPath
		Remove-Variable ZipName
}
	