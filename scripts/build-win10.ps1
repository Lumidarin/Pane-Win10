param([string]$Version='0.2.1')
$ErrorActionPreference='Stop'
$repo=Split-Path $PSScriptRoot -Parent
$hash=& git -C $repo rev-parse --short HEAD
& dotnet publish "$repo/src/Pane.App/Pane.App.csproj" -c Release -r win-x64 -p:PublishAot=true "-p:Version=$Version" "-p:InformationalVersion=$Version-win10+$hash" -p:IncludeSourceRevisionInInformationalVersion=false -o "$repo/src/Pane.App/bin/aot"
if($LASTEXITCODE -ne 0){throw 'Win10 应用构建失败'}
& "$PSScriptRoot/package.ps1" -NoBuild -PolicyPath "$PSScriptRoot/win10-package-policy.md"
if($LASTEXITCODE -ne 0){throw 'Win10 安装包构建失败'}
