﻿Write-FormatView -Action {
    Write-FormatViewExpression -If { -not $script:DisplayingMember  } -ScriptBlock { [Environment]::NewLine }
    
    Write-FormatViewExpression -ScriptBlock { '  *' }
    
    Write-FormatViewExpression -If { $_.IsStatic } -ScriptBlock { ' static ' }
    
    Write-FormatViewExpression -If {$_.IsConstructor } -ScriptBlock { $_.DeclaringType } -ControlName TypeNameControl -Style 'Foreground.Cyan','Bold'
    Write-FormatViewExpression -If { -not $_.IsConstructor -and $_.ReturnType } -ScriptBlock { $_.ReturnType } -ControlName TypeNameControl -Style 'Foreground.Cyan','Bold'
    
    Write-FormatViewExpression -ScriptBlock {
        @(if (-not $_.IsConstructor) {
            ' '
            if ($_.IsPublic) {
                if ($PSStyle) {
                    $PSStyle.Formatting.Warning
                }
            }
            elseif ($_.IsPrivate) {
                if ($PSStyle) {
                    $PSStyle.Formatting.Error
                }
            }
            else {
                if ($PSStyle) {
                    $PSStyle.Formatting.Warning
                }
            }
            
            $_.Name
            if ($PSStyle) {
                $PSStyle.Reset
            }
        }) -join ''
    }

    Write-FormatViewExpression -ScriptBlock { ' (' }
    Write-FormatViewExpression -ScriptBlock {
        $MethodParameters = @($_.GetParameters())
        foreach ($n in 0..($MethodParameters.Count - 1)) {
            if (-not $MethodParameters[$n]) { continue }
            $o =[PSObject]::new($MethodParameters[$n])
            $o.psobject.properties.add([PSNoteProperty]::new('N', $N))
            $o
        }
    } -ControlName TypeMethodParameterControl -Enumerate
    Write-FormatViewExpression -ScriptBlock { ')' }

} -TypeName TypeMethodControl -Name TypeMethodControl -AsControl