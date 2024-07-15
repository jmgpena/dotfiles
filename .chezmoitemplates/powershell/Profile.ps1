# yazi file manager
function yy {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath $cwd
    }
    Remove-Item -Path $tmp
}

# PSReadline
Set-PSReadlineOption -EditMode Emacs

# prompt
Invoke-Expression (&starship init powershell)

# exa alias and functions
function exals {
  eza --color=always --group-directories-first --icons
}
Set-Alias -Name ls -Value Exals -Option AllScope
function ll {
  eza -la --icons --octal-permissions --group-directories-first
}
function l {
  eza -bGF --header --git --color=always --group-directories-first --icons
}
function llm {
  eza -lbGd --header --git --sort=modified --color=always --group-directories-first --icons
}
function la {
  eza --long --all --group --group-directories-first
}
function lx {
  eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale --color=always --group-directories-first --icons
}
#function lS {
#  eza -1 --color=always --group-directories-first --icons
#}
function lt {
  eza --tree --level=2 --color=always --group-directories-first --icons
}
#function l. {
#  eza -a | grep -E '^\.'
#}

