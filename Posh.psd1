@{
    ModuleVersion = '0.1'
    FormatsToProcess = 'Posh.format.ps1xml'
    TypesToProcess   = 'Posh.types.ps1xml'
    RootModule = 'Posh.psm1'
    Description = 'PowerShell made Posh - Spice up Your Shell'
    Guid = 'd4d3a0b9-0c65-4474-bcfc-5b85b2670312'
    Author = 'James Brundage'
    CompanyName = 'Start-Automating'
    Copyright = '2023 Start-Automating'
    PrivateData = @{
        ProjectURI = 'https://github.com/StartAutomating/Posh'
        LicenseURI = 'https://github.com/StartAutomating/Posh/blob/main/LICENSE'
        Tags = 'Posh', '.ps1xml', 'Format','Output','Types', 'Colorized'
        ReleaseNotes = @'
## Posh 0.1:

* Initial Version of Posh, including:
  * Customizable prompts
  * Easier access to PowerShell Error history  
* Formatting:
  * Reflection formatter
  * Get-Member in Color
  * Colorized XML
  * Colorized File View (with Icons!) (no NerdFonts required)
  * Colorized Regex
  * Process HeatMap
'@
        FileTypes = @{
            "Posh.Prompt" = @{
                Pattern = '(?>^prompt|\.prompt\.ps1$)'
                Description = "A function that defines a prompt"
            }
            "Posh.Prompt.Widget" = @{
                Pattern = '(?>^prompt\.widget|\.prompt\.widget\.ps1$)'
                Description = "A function that defines a prompt widget"
            }
            "Posh.Preset" = @{
                Pattern = '\.(?>PowerShell|Posh)\.Preset\.(?>psd1|json|clixml)$'
                Description = "A data file that defines a PowerShell preset."
            }
            "Posh.Trivia" = @{
                Pattern = '\.(?>PowerShell|Posh)\.Trivia\.psd1$'
            }
        }

        ExtendedDescription = "
        

        Posh is a PowerShell module that improves the shell experience.
        
        It :
        
           * Helps you to customize the shell.
           * Improves built-in formatting
           * Extends built-in types
           * Helps you learn PowerShell
        "
    }

}
