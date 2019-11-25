  
If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
$arguments = "& '" + $myinvocation.mycommand.definition + "'"
Start-Process powershell -Verb runAs -ArgumentList $arguments
Break
}

Write-Host ""
Write-Host "       __      __  _____ __         "
Write-Host "  ____/ /___  / /_/ __(_) /__  _____"
Write-Host " / __  / __ \/ __/ /_/ / / _ \/ ___/"
Write-Host "/ /_/ / /_/ / /_/ __/ / /  __(__  ) "
Write-Host "\__,_/\____/\__/_/ /_/_/\___/____/  "
Write-Host ""
Write-Host "Windows 10" -ForegroundColor Magenta

# $confirmation = Read-Host "Start Install on Windows? [y/n]"

$TOPDIR = Split-Path -Parent $MyInvocation.MyCommand.Definition

$CASESENSITIVE_TOPDIR = Join-Path $TOPDIR 'linux-3.10'
fsutil.exe file SetCaseSensitiveInfo $CASESENSITIVE_TOPDIR enable

$CASESENSITIVE_TOPDIR = Join-Path $TOPDIR 'linux-3.10/net/netfilter'
fsutil.exe file SetCaseSensitiveInfo $CASESENSITIVE_TOPDIR enable

$CASESENSITIVE_TOPDIR = Join-Path $TOPDIR 'linux-3.10/include/linux/netfilter'
fsutil.exe file SetCaseSensitiveInfo $CASESENSITIVE_TOPDIR enable

$CASESENSITIVE_TOPDIR = Join-Path $TOPDIR 'linux-3.10/include/linux/netfilter_ipv4'
fsutil.exe file SetCaseSensitiveInfo $CASESENSITIVE_TOPDIR enable

$CASESENSITIVE_TOPDIR = Join-Path $TOPDIR 'linux-3.10/include/linux/netfilter_ipv6'
fsutil.exe file SetCaseSensitiveInfo $CASESENSITIVE_TOPDIR enable

$CASESENSITIVE_TOPDIR = Join-Path $TOPDIR 'linux-3.10/include/uapi/linux/netfilter'
fsutil.exe file SetCaseSensitiveInfo $CASESENSITIVE_TOPDIR enable

$CASESENSITIVE_TOPDIR = Join-Path $TOPDIR 'linux-3.10/include/uapi/linux/netfilter_ipv4'
fsutil.exe file SetCaseSensitiveInfo $CASESENSITIVE_TOPDIR enable

$CASESENSITIVE_TOPDIR = Join-Path $TOPDIR 'linux-3.10/include/uapi/linux/netfilter_ipv6'
fsutil.exe file SetCaseSensitiveInfo $CASESENSITIVE_TOPDIR enable

pause
