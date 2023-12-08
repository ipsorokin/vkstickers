$path = Read-Host "The path to save"
$dirZipFolder="$path\StickerPack\Zip"
$dirUnpackFolder="$path\StickerPack\Unzip"
if(!(Test-Path $dirZipFolder)){New-Item -Path $dirZipFolder -ItemType "directory"}
if(!(Test-Path $dirUnpackFolder)){New-Item -Path $dirUnpackFolder -ItemType "directory"}
for($i=1;$i -lt 1000; $i++)
 {
    $url="http://vk.com/images/store/stickers/$i/content.zip"
    $targetPath="$dirZipFolder\sticker_$i.zip"
    $unpackPath="$dirUnpackFolder\sticker_$i"
    $client = new-object System.Net.WebClient
    $client.DownloadFile($url,$targetPath)
    if(Test-Path $targetPath)
    {
        Expand-Archive -Path $targetPath -DestinationPath $unpackPath
        Remove-Item -Path "$unpackPath\*64b.png"
        Remove-Item -Path "$unpackPath\*128b.png"
        Remove-Item -Path "$unpackPath\backgr*.png"
        Remove-Item -Path "$unpackPath\thumb*.png"
    }
 }
Remove-Item -Path $dirZipFolder -Recurse
