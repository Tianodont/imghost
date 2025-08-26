# Путь к обоям
$wallpaperPath = "$env:USERPROFILE\Pictures\wallpaper.jpg"

# Создаём папку для обоев
$dir = Split-Path $wallpaperPath
if (-not (Test-Path $dir)) {
    New-Item -Path $dir -ItemType Directory | Out-Null
}

# Ссылка на обои
$url = 'https://raw.githubusercontent.com/Tianodont/imghost/82e305df330d00c5dab85a9ffae555eb12a1bf08/98d1f355d65952c1c506021a8ab57832cd4cb39d.jpg'

# Скачиваем картинку
curl $url -o $wallpaperPath

# Функция установки обоев
function Set-Wallpaper {
    Add-Type @"
using System.Runtime.InteropServices;
public class Wallpaper {
    [DllImport("user32.dll", SetLastError = true)]
    public static extern bool SystemParametersInfo(int uAction,int uParam,string lpvParam,int fuWinIni);
}
"@
    [Wallpaper]::SystemParametersInfo(20, 0, $wallpaperPath, 3)
}

# Применяем обои сразу
Set-Wallpaper
