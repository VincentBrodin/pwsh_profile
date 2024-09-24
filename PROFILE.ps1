oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/amro.omp.json' | Invoke-Expression

clear
# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}


function Build-C($Name, $File){
  echo "Starting build on $File"
  gcc -o $Name $File
  if ($LASTEXITCODE -eq 0) 
  { 
    echo "Build done"
    echo "Running $Name.exe"
    & "./$Name" 
  }
  else{
    echo "Build failed :("
  }
}

function projects($Path){
    cd D:\Projects\$Path
}

function unzip($Path){
    Expand-Archive -Path $Path -DestinationPath (Get-Location)
}

function unziprm($Path){
    unzip($Path)
    rm $Path
}

function grab {
    param (
        [string]$url
    )
    $filename = [System.IO.Path]::GetFileName($url)
    $outputPath = Join-Path -Path (Get-Location) -ChildPath $filename
    invoke-webrequest -uri $url -outfile $outputPath
}

function goto(){
    start-process explorer.exe (Get-Location)
}

function home($Path){
    cd ~\$Path
}
