$wallpaperPath = "C:\Users\Public\Pictures\wallpaper.jpg"
$url = "https://raw.githubusercontent.com/Tianodont/imghost/82e305df330d00c5dab85a9ffae555eb12a1bf08/98d1f355d65952c1c506021a8ab57832cd4cb39d.jpg"

# Скачиваем обои
curl $url -o $wallpaperPath

# Применяем через ActiveDesktop COM
$ad = New-Object -ComObject "Shell.Application"
$desktop = $ad.Namespace(0).Self
$desktopDesktop = New-Object -ComObject "Microsoft.ActiveDesktop"
$desktopDesktop.SetWallpaper($wallpaperPath, 0)
$desktopDesktop.ApplyChanges(0x2)  # AD_APPLY_FORCE
