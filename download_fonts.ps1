# Free Fonts Downloader - Simplified
$ErrorActionPreference = "Continue"
$ProgressPreference = "SilentlyContinue"
$B = "E:\claude\202605\free-commercial-fonts\fonts"
New-Item -ItemType Directory -Force -Path "$B\chinese\github", "$B\chinese\brand", "$B\chinese\designer", "$B\chinese\foundry", "$B\english\sans", "$B\english\serif", "$B\english\mono", "$B\english\handwriting", "$B\japanese", "$B\korean" | Out-Null

function DL { param($U, $O, $N)
    if (Test-Path $O) { Write-Host "SKIP: $N" -F Yellow; return }
    try {
        $D = Split-Path $O -Parent
        if (-not (Test-Path $D)) { New-Item -ItemType Directory -Force -Path $D | Out-Null }
        Invoke-WebRequest -Uri $U -OutFile $O -TimeoutSec 180 -UseBasicParsing
        $S = (Get-Item $O).Length
        if ($S -gt 100) { Write-Host "OK: $N ($S bytes)" -F Green } else { Write-Host "WARN: $N too small ($S)" -F DarkYellow; Remove-Item $O }
    } catch { Write-Host "FAIL: $N - $_" -F Red }
}

function GF { param($F, $O)
    try {
        $C = Invoke-RestMethod -Uri "https://fonts.google.com/download/list?family=$F" -TimeoutSec 30 -UseBasicParsing
        Write-Host "GF-OK: $F" -F DarkCyan
    } catch { Write-Host "GF-FAIL: $F" -F Red }
    Start-Sleep -Milliseconds 500
}

Write-Host "===== 1. CHINESE GITHUB FONTS =====" -F Magenta

# Source Han Sans/Serif OTF subsets
DL "https://github.com/adobe-fonts/source-han-sans/raw/release/SubsetOTF/CN/SourceHanSansSC.zip" "$B\chinese\github\SourceHanSans\SourceHanSansSC.zip" "SourceHanSansSC"
DL "https://github.com/adobe-fonts/source-han-serif/raw/release/SubsetOTF/CN/SourceHanSerifSC.zip" "$B\chinese\github\SourceHanSerif\SourceHanSerifSC.zip" "SourceHanSerifSC"
DL "https://github.com/adobe-fonts/source-han-mono/releases/download/1.002R/SourceHanMono.ttc" "$B\chinese\github\SourceHanMono\SourceHanMono.ttc" "SourceHanMono"

# LXGW Wenkai - use latest known releases
$WK = "https://github.com/lxgw/LxgwWenKai/releases/download/v1.330"
DL "$WK/LXGWWenKai-Regular.ttf" "$B\chinese\github\LXGWWenKai\LXGWWenKai-Regular.ttf" "WenKai-Regular"
DL "$WK/LXGWWenKai-Light.ttf" "$B\chinese\github\LXGWWenKai\LXGWWenKai-Light.ttf" "WenKai-Light"
DL "$WK/LXGWWenKai-Medium.ttf" "$B\chinese\github\LXGWWenKai\LXGWWenKai-Medium.ttf" "WenKai-Medium"
DL "$WK/LXGWWenKaiMono-Regular.ttf" "$B\chinese\github\LXGWWenKai\LXGWWenKaiMono-Regular.ttf" "WenKai-Mono"

DL "https://github.com/lxgw/LxgwWenKaiGB/releases/download/v1.010/LXGWWenKaiGB-Regular.ttf" "$B\chinese\github\LXGWWenKaiGB\LXGWWenKaiGB-Regular.ttf" "WenKaiGB"
DL "https://github.com/lxgw/LxgwWenKaiTC/releases/download/v1.010/LXGWWenKaiTC-Regular.ttf" "$B\chinese\github\LXGWWenKaiTC\LXGWWenKaiTC-Regular.ttf" "WenKaiTC"
DL "https://github.com/lxgw/LxgwWenKai-Lite/releases/download/v1.010/LXGWWenKaiLite-Regular.ttf" "$B\chinese\github\LXGWWenKaiLite\LXGWWenKaiLite-Regular.ttf" "WenKaiLite"
DL "https://github.com/lxgw/LxgwWenKai-Screen/releases/download/v1.010/LXGWWenKaiScreen.ttf" "$B\chinese\github\LXGWWenKaiScreen\LXGWWenKaiScreen.ttf" "WenKaiScreen"

# Other LXGW fonts
DL "https://github.com/lxgw/LxgwZhenKai/releases/download/v1.000/LXGWZhenKai-Regular.ttf" "$B\chinese\github\LXGWZhenKai\LXGWZhenKai-Regular.ttf" "ZhenKai"
DL "https://github.com/lxgw/LxgwMarkerGothic/releases/download/v1.000/LXGWMarkerGothic.ttf" "$B\chinese\github\LXGWMarkerGothic\LXGWMarkerGothic.ttf" "MarkerGothic"
DL "https://github.com/lxgw/LxgwNewClearGothic/releases/download/v1.000/LXGWNewClearGothic-Regular.ttf" "$B\chinese\github\LXGWNewClearGothic\LXGWNewClearGothic-Regular.ttf" "NewClearGothic"
DL "https://github.com/lxgw/LxgwBright/releases/download/v1.000/LXGWBright-Regular.ttf" "$B\chinese\github\LXGWBright\LXGWBright-Regular.ttf" "LXGWBright"
DL "https://github.com/lxgw/yozai-font/releases/download/v1.011/Yozai-Regular.ttf" "$B\chinese\github\Yozai\Yozai-Regular.ttf" "Yozai"
DL "https://github.com/lxgw/kose-font/releases/download/v1.100/XiaolaiSC-Regular.ttf" "$B\chinese\github\Xiaolai\XiaolaiSC-Regular.ttf" "XiaolaiSC"

# Smiley Sans
$SS = "https://github.com/atelier-anchor/smiley-sans/releases/download/v2.0.1"
DL "$SS/SmileySans-Oblique.otf" "$B\chinese\github\SmileySans\SmileySans-Oblique.otf" "SmileySans-OTF"
DL "$SS/SmileySans-Oblique.ttf" "$B\chinese\github\SmileySans\SmileySans-Oblique.ttf" "SmileySans-TTF"
DL "$SS/SmileySans-Oblique.woff2" "$B\chinese\github\SmileySans\SmileySans-Oblique.woff2" "SmileySans-WOFF"

# Douyin
DL "https://github.com/bytedance/fonts/raw/main/DouyinSansBold/DouyinSansBold.ttf" "$B\chinese\github\DouyinSans\DouyinSansBold.ttf" "DouyinSans"

# Qiji Font
DL "https://raw.githubusercontent.com/LingDong-/qiji-font/master/fonts/Qiji-Fallback.ttf" "$B\chinese\github\QijiFont\Qiji-Fallback.ttf" "Qiji-Fallback"
DL "https://raw.githubusercontent.com/LingDong-/qiji-font/master/fonts/Qiji-Combo.ttf" "$B\chinese\github\QijiFont\Qiji-Combo.ttf" "Qiji-Combo"

# ButTaiwan series
DL "https://github.com/ButTaiwan/genyog-font/releases/download/v1.501/GenYoGothicTW-Normal.ttf" "$B\chinese\github\GenYoGothic\GenYoGothicTW-Normal.ttf" "GenYoGothic"
DL "https://github.com/ButTaiwan/genyo-font/releases/download/v1.502/GenYoMinchoTW-Regular.ttf" "$B\chinese\github\GenYoMincho\GenYoMinchoTW-Regular.ttf" "GenYoMincho"
DL "https://github.com/ButTaiwan/genryu-font/releases/download/v1.501/GenRyuMinchoTW-Regular.ttf" "$B\chinese\github\GenRyuMincho\GenRyuMinchoTW-Regular.ttf" "GenRyuMincho"
DL "https://github.com/ButTaiwan/genwan-font/releases/download/v1.501/GenWanMinchoTW-Regular.ttf" "$B\chinese\github\GenWanMincho\GenWanMinchoTW-Regular.ttf" "GenWanMincho"
DL "https://github.com/ButTaiwan/gensen-font/releases/download/v1.502/GenSenRoundedTW-Regular.ttf" "$B\chinese\github\GenSenRounded\GenSenRoundedTW-Regular.ttf" "GenSenRounded"

# open-huninn
DL "https://github.com/justfont/open-huninn/releases/download/v2.0/jf-openhuninn-2.0.ttf" "$B\chinese\github\OpenHuninn\jf-openhuninn-2.0.ttf" "OpenHuninn"

# Others from GitHub
DL "https://raw.githubusercontent.com/wixette/dotted-chinese-fonts/main/fonts/DottedSongtiSquare-Regular.otf" "$B\chinese\github\DottedSongti\DottedSongtiSquare-Regular.otf" "DottedSongti"
DL "https://github.com/takushun-wu/WenJinMincho/releases/download/v1.00/WenJinMincho-Regular.ttf" "$B\chinese\github\WenJinMincho\WenJinMincho-Regular.ttf" "WenJinMincho"
DL "https://github.com/Buernia/Zhudou-Sans/releases/download/v1.000/ZhudouSans-Regular.ttf" "$B\chinese\github\ZhudouSans\ZhudouSans-Regular.ttf" "ZhudouSans"
DL "https://raw.githubusercontent.com/Skr-ZERO/MaokenAssortedSans/master/fonts/ttf/MaokenAssortedSans-Regular.ttf" "$B\chinese\github\MaokenAssortedSans\MaokenAssortedSans-Regular.ttf" "MaokenAssortedSans"
DL "https://raw.githubusercontent.com/AiChiKung/TaipeiSansTC/master/font/TaipeiSansTCBeta-Regular.ttf" "$B\chinese\github\TaipeiSansTC\TaipeiSansTCBeta-Regular.ttf" "TaipeiSansTC"
DL "https://raw.githubusercontent.com/max32002/NaniFont/master/fonts/ttf/NaniFont-Regular.ttf" "$B\chinese\designer\NaniFont\NaniFont-Regular.ttf" "NaniFont"

# JasonHandwriting 1-8
foreach ($i in 1..8) {
    DL "https://raw.githubusercontent.com/jasonhandwriting/JasonHandwriting/master/fonts/ttf/JasonHandwriting$i-Regular.ttf" "$B\chinese\github\JasonHandwriting\JasonHandwriting$i-Regular.ttf" "JasonHW$i"
}

Write-Host "`n===== 2. BRAND / DESIGNER CHINESE FONTS =====" -F Magenta

DL "https://static01.coloros.com/www/public/img/topic7/font-opposans.zip" "$B\chinese\brand\OPPOSans\opposans.zip" "OPPOSans"

Write-Host "`n===== 3. ENGLISH FONTS =====" -F Magenta

DL "https://github.com/IBM/plex/releases/download/v6.4.0/TrueType.zip" "$B\english\sans\IBMPlex\IBMPlex.zip" "IBMPlex"
DL "https://github.com/rsms/inter/releases/download/v4.0/Inter-4.0.zip" "$B\english\sans\Inter\Inter-4.0.zip" "Inter"
DL "https://github.com/JetBrains/JetBrainsMono/releases/download/v2.304/JetBrainsMono-2.304.zip" "$B\english\mono\JetBrainsMono\JetBrainsMono.zip" "JetBrainsMono"
DL "https://github.com/microsoft/cascadia-code/releases/download/v2407.24/CascadiaCode-2407.24.zip" "$B\english\mono\CascadiaCode\CascadiaCode.zip" "CascadiaCode"
DL "https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip" "$B\english\mono\FiraCode\FiraCode.zip" "FiraCode"
DL "https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip" "$B\english\mono\Hack\Hack.zip" "Hack"
DL "https://github.com/be5invis/Iosevka/releases/download/v32.5.0/PkgTTF-Iosevka-32.5.0.zip" "$B\english\mono\Iosevka\Iosevka.zip" "Iosevka"
DL "https://github.com/intel/intel-one-mono/releases/download/V1.4.0/otf.zip" "$B\english\mono\IntelOneMono\IntelOneMono.zip" "IntelOneMono"
DL "https://github.com/vercel/geist-font/releases/download/1.4.01/Geist-1.4.01.zip" "$B\english\sans\Geist\Geist.zip" "Geist"
DL "https://github.com/eigilnikolajsen/commit-mono/releases/download/v1.145/CommitMono-1.145.zip" "$B\english\mono\CommitMono\CommitMono.zip" "CommitMono"
DL "https://github.com/arrowtype/recursive/releases/download/v1.085/ArrowType-Recursive-1.085.zip" "$B\english\sans\Recursive\Recursive.zip" "Recursive"
DL "https://github.com/rubjo/victor-mono/raw/master/public/VictorMonoAll.zip" "$B\english\mono\VictorMono\VictorMono.zip" "VictorMono"
DL "https://github.com/belluzj/fantasque-sans/releases/download/v1.8.0/FantasqueSansMono-Normal.zip" "$B\english\mono\FantasqueSansMono\FantasqueSansMono.zip" "FantasqueSans"
DL "https://github.com/evilmartians/mono/releases/download/v1.0.0/MartianMono-1.0.0-ttf.zip" "$B\english\mono\MartianMono\MartianMono.zip" "MartianMono"
DL "https://github.com/madmalik/mononoki/releases/download/1.6/mononoki.zip" "$B\english\mono\Mononoki\mononoki.zip" "Mononoki"
DL "https://github.com/adobe-fonts/source-code-pro/releases/download/2.042R-u%2F1.062R-i%2F1.026R-vf/TTF-source-code-pro-2.042R-u_1.062R-i.zip" "$B\english\mono\SourceCodePro\SourceCodePro.zip" "SourceCodePro"
DL "https://github.com/uswds/public-sans/releases/download/v2.001/public-sans-v2.001.zip" "$B\english\sans\PublicSans\PublicSans.zip" "PublicSans"
DL "https://github.com/mozilla/Fira/raw/master/otf/FiraSans-Regular.otf" "$B\english\sans\FiraSans\FiraSans-Regular.otf" "FiraSans-Regular"
DL "https://github.com/mozilla/Fira/raw/master/otf/FiraSans-Bold.otf" "$B\english\sans\FiraSans\FiraSans-Bold.otf" "FiraSans-Bold"
DL "https://brailleinstitute.org/wp-content/uploads/atkinson-hyperlegible/Atkinson-Hyperlegible-Font-Print-and-Web-2020-0514.zip" "$B\english\sans\AtkinsonHyperlegible\AtkinsonHyperlegible.zip" "AtkinsonHyperlegible"
DL "https://software.sil.org/downloads/r/gentium/GentiumPlus-6.200.zip" "$B\english\serif\Gentium\GentiumPlus.zip" "GentiumPlus"
DL "https://github.com/mozilla/zilla-slab/releases/download/v1.003/ZillaSlab-Fonts-v1.003.zip" "$B\english\serif\ZillaSlab\ZillaSlab.zip" "ZillaSlab"

Write-Host "`n===== 4. JAPANESE FONTS =====" -F Magenta

DL "https://github.com/fontworks-fonts/Klee/raw/master/fonts/ttf/KleeOne-Regular.ttf" "$B\japanese\Fontworks\KleeOne-Regular.ttf" "KleeOne"
DL "https://github.com/fontworks-fonts/Klee/raw/master/fonts/ttf/KleeOne-SemiBold.ttf" "$B\japanese\Fontworks\KleeOne-SemiBold.ttf" "KleeOneSB"
DL "https://github.com/fontworks-fonts/Stick/raw/master/fonts/ttf/Stick-Regular.ttf" "$B\japanese\Fontworks\Stick-Regular.ttf" "Stick"
DL "https://github.com/fontworks-fonts/RocknRoll/raw/master/fonts/ttf/RocknRollOne-Regular.ttf" "$B\japanese\Fontworks\RocknRollOne-Regular.ttf" "RocknRollOne"
DL "https://github.com/fontworks-fonts/DotGothic16/raw/master/fonts/ttf/DotGothic16-Regular.ttf" "$B\japanese\Fontworks\DotGothic16-Regular.ttf" "DotGothic16"
DL "https://github.com/fontworks-fonts/Reggae/raw/master/fonts/ttf/ReggaeOne-Regular.ttf" "$B\japanese\Fontworks\ReggaeOne-Regular.ttf" "ReggaeOne"
DL "https://github.com/fontworks-fonts/HachiMaruPop/raw/master/fonts/ttf/HachiMaruPop-Regular.ttf" "$B\japanese\Fontworks\HachiMaruPop-Regular.ttf" "HachiMaruPop"

# M+ from OSDN
DL "https://osdn.net/dl/mplus-fonts/mplus-TESTFLIGHT-063a.tar.xz" "$B\japanese\MPlus\mplus.tar.xz" "MPlus"

# IPA fonts
DL "https://moji.or.jp/wp-content/ipafont/IPAexfont/IPAexfont00401.zip" "$B\japanese\IPAFonts\IPAexfont.zip" "IPAex"
DL "https://moji.or.jp/wp-content/ipafont/IPAfont/IPAfont00303.zip" "$B\japanese\IPAFonts\IPAfont.zip" "IPAfont"

# Gen Shin / Jyuu Gothic
DL "https://osdn.net/dl/genshingothic/GenShinGothic-Normal.zip" "$B\japanese\GenShinGothic\GenShinGothic-Normal.zip" "GenShinGothic"
DL "https://osdn.net/dl/genjyuugothic/GenJyuuGothic-Normal.zip" "$B\japanese\GenJyuuGothic\GenJyuuGothic-Normal.zip" "GenJyuuGothic"

# Rounded Mgen+
DL "https://osdn.net/dl/rounded-mgenplus/rounded-mgenplus-20150602.zip" "$B\japanese\RoundedMgenPlus\rounded-mgenplus.zip" "RoundedMgen"

# Tanuki
DL "https://tanukifont.com/download/TanukiMagic/TanukiMagic-2.0.1.zip" "$B\japanese\TanukiFonts\TanukiMagic.zip" "TanukiMagic"

# Sawarabi
DL "https://osdn.net/dl/sawarabi-fonts/sawarabi-mincho-20220915.zip" "$B\japanese\SawarabiFonts\sawarabi-mincho.zip" "SawarabiMincho"
DL "https://osdn.net/dl/sawarabi-fonts/sawarabi-gothic-20220915.zip" "$B\japanese\SawarabiFonts\sawarabi-gothic.zip" "SawarabiGothic"

# Honoka
DL "https://www.freejapanesefont.com/wp-content/uploads/2020/04/honoka-antique-kaku.zip" "$B\japanese\Honoka\honoka-antique-kaku.zip" "HonokaAntique"

# 851 fonts
$N851 = @("tegaki_zatsu","chikarazuyoku","chikarayowaku","gochikakutto","makapoppu","tegakikakutto","retorogo")
for ($i = 0; $i -lt $N851.Count; $i++) {
    DL "http://pm85122.onamae.jp/851font/$($i+851)_$($N851[$i]).ttf" "$B\japanese\851Fonts\$($i+851)_$($N851[$i]).ttf" "851_$($N851[$i])"
}

# LINE Seed JP
DL "https://raw.githubusercontent.com/linepluscorp/seed-font/main/JP/LINE_Seed_JP.zip" "$B\japanese\LINESeedJP\LINE_Seed_JP.zip" "LINESeedJP"

Write-Host "`n===== 5. KOREAN FONTS =====" -F Magenta

DL "https://github.com/spoqa/spoqa-han-sans/releases/download/v2.1.0/SpoqaHanSansNeo_OTF_original.zip" "$B\korean\SpoqaHanSans\SpoqaHanSansNeo.zip" "SpoqaHanSans"
DL "https://raw.githubusercontent.com/linepluscorp/seed-font/main/KR/LINE_Seed_KR.zip" "$B\korean\LINESeedKR\LINE_Seed_KR.zip" "LINESeedKR"

Write-Host "`n===== ALL DONE =====" -F Green

# Summary
Write-Host "`nDownloaded fonts in: $B" -F Cyan
$T = Get-ChildItem -Recurse -File $B | Measure-Object
Write-Host "Total files: $($T.Count)" -F Cyan
$TS = [math]::Round((Get-ChildItem -Recurse -File $B | Measure-Object -Property Length -Sum).Sum / 1MB, 2)
Write-Host "Total size: $TS MB" -F Cyan
