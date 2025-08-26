$wallpaperPath = "C:\Windows\Web\Wallpaper\wallpaper.jpg"
$url = "https://raw.githubusercontent.com/Tianodont/imghost/82e305df330d00c5dab85a9ffae555eb12a1bf08/98d1f355d65952c1c506021a8ab57832cd4cb39d.jpg"

# Скачиваем обои
curl $url -o $wallpaperPath

# Обновляем реестр
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name Wallpaper -Value $wallpaperPath
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name WallpaperStyle -Value 10
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name TileWallpaper -Value 0

# Перезапускаем Explorer для применения
Stop-Process -Name explorer -Force
Start-Process explorer
