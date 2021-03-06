#Requires -RunAsAdministrator

# Install visual studio extensions
$vcmodules = @('ms-python.python',
    'ms-dotnettools.csharp',
    'ms-vscode.powershell',
    'ms-vscode.azure-account',
    'ms-vscode.azurecli',
    'vscode-icons-team.vscode-icons',
    'VisualStudioExptTeam.vscodeintellicode'
    'nobuhito.printcode',
    'esbenp.prettier-vscode',
    'ms-mssql.mssql',
    'ms-vscode-remote.remote-ssh-edit',
    'ms-edgedevtools.vscode-edge-devtools'
    'ms-vscode.hexeditor',
    'ms-vscode.vscode-node-azure-pack'
    'ms-vscode-remote.vscode-remote-extensionpack',
    'vsciot-vscode.azure-iot-tools'
    'zhuangtongfa.material-theme')

Write-Host -ForegroundColor Yellow "Installing Visual Studio Code Extensions:"
$instvcmodules = (code --list-extensions)
foreach ($vcmodule in $vcmodules) {
    if ($instvcmodules -match $vcmodule) {
        Write-Host -ForegroundColor White $vcmodule" preinstalled. Skipping..."
    }
    else {
        code --install-extension $vcmodule
    }
}

# Install Visual Studio Code settings
copy-item -path .\vscsettings.json $env:USERPROFILE\AppData\Roaming\Code\user\settings.json

# Install winget settings
$tmppath = (resolve-path "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_*\LocalState")
copy-item -path .\wtsettings.json $tmppath\settings.json

# Install vi$t$ppaehopy-Itemt'.\modules\awesome-vim-color$chpmes\colors\*.vim' -Despinaaeoh $tmppathy-Itemt'.\modules\awesome-vim-colormchpmes\colors\*.vim' -Despinaaeoh $tmppathy-Item '.\modules\awesome-vim-colorschemes\colors\*.vim' -Destination $tmppath
$tmppath = (resolve-path "c:\Program Files\vim\vim*\colors\")
copy-item .\vimrc.vim -Destination $env:USERPROFILE\.vimrc
Copy-Item '.\modules\awesome-vim-colorschemes\colors\*.vim' -Destination $tmppath

# Powershell Profile
if (Test-Path $profile) {
    while ($true) {
        $instpwshprofile = Read-Host -Prompt 'Powershell User profile exists. Overwrite  [yes]/no '
        if ([string]::IsNullOrWhiteSpace($instpwshprofile)) {
            $instpwshprofile = 'yes'
        }
        if ($instpwshprofile.ToLower() -eq 'yes') {
            Write-Host -ForegroundColor Yellow "Installing Powershell Profile"
            Copy-Item ./Microsoft.PowerShell_profile.ps1 $profile
            break;
        }
        elseif ($instpwshprofile.ToLower() -eq 'no') {
            break;
        }
    }
}
else {
    Write-Host -ForegroundColor Yellow "Installing Powershell Profile"
    Copy-Item ./Microsoft.PowerShell_profile.ps1 $profile
}

# Install visual studio extensions
$vcmodules = @('ms-python.python',
    'ms-dotnettools.csharp',
    'ms-vscode.powershell',
    'ms-vscode.azure-account',
    'ms-vscode.azurecli',
    'vscode-icons-team.vscode-icons',
    'VisualStudioExptTeam.vscodeintellicode'
    'nobuhito.printcode',
    'esbenp.prettier-vscode',
    'ms-mssql.mssql',
    'ms-vscode-remote.remote-ssh-edit',
    'ms-edgedevtools.vscode-edge-devtools'
    'ms-vscode.hexeditor',
    'ms-vscode.vscode-node-azure-pack'
    'ms-vscode-remote.vscode-remote-extensionpack',
    'vsciot-vscode.azure-iot-tools'
    'zhuangtongfa.material-theme')

Write-Host -ForegroundColor Yellow "Installing Visual Studio Code Extensions:"
$instvcmodules = (code --list-extensions)
foreach ($vcmodule in $vcmodules) {
    if ($instvcmodules -match $vcmodule) {
        Write-Host -ForegroundColor White $vcmodule" preinstalled. Skipping..."
    }
    else {
        code --install-extension $vcmodule
    }
}

# Install Visual Studio Code settings
copy-item -path .\vscsettings.json $env:USERPROFILE\AppData\Roaming\Code\user\settings.json

# Install winget settings
$tmppath = (resolve-path "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_*\LocalState")
copy-item -path .\wtsettings.json $tmppath\settings.json

# Install vim settings
$tmppath = (resolve-path "c:\Program Files\vim\vim*\colors\")
copy-item .\vimrc.vim -Destination $env:USERPROFILE\.vimrc
Copy-Item '.\modules\awesome-vim-colorschemes\colors\*.vim' -Destination $tmppath
$tmppath = (resolve-path "C:\Program Files\Git\usr\share\vim\vim*\colors")
Copy-Item '.\modules\awesome-vim-colorschemes\colors\*.vim' -Destination $tmppath