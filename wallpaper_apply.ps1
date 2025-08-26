# Путь к обоям
$wallpaperPath = "$env:USERPROFILE\Pictures\wallpaper.jpg"

# Создаём папку для обоев
$dir = Split-Path $wallpaperPath
if (-not (Test-Path $dir)) { New-Item -Path $dir -ItemType Directory | Out-Null }

# Скачиваем обои (curl)
$url = 'https://raw.githubusercontent.com/Tianodont/imghost/82e305df330d00c5dab85a9ffae555eb12a1bf08/98d1f355d65952c1c506021a8ab57832cd4cb39d.jpg'
curl $url -o $wallpaperPath

# Обновляем реестр для стиля обоев
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name WallpaperStyle -Value "10"    # Заполнение
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name TileWallpaper -Value "0"      # Не плитка

# Функция применения обоев через API
Add-Type @"
using System.Runtime.InteropServices;
public class Wallpaper {
    [DllImport("user32.dll", SetLastError = true)]
    public static extern bool SystemParametersInfo(int uAction,int uParam,string lpvParam,int fuWinIni);
}
"@

[Wallpaper]::SystemParametersInfo(20, 0, $wallpaperPath, 3)
