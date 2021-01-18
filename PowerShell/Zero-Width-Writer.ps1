# Plaintext file containing the content that will be converted to zero-width.
# This file should be placed within the same folder as the script.
$InputFile = Get-Content -Path ($PSScriptRoot + "\Plaintext.txt")

# Read the InputFile and convert the text to binary.
$InputBinary = [System.Text.Encoding]::Default.GetBytes($InputFile) | ForEach-Object{[System.Convert]::ToString($_,2).PadLeft(8,'0')}

# Replace the binary characters with zero-width ones.
# 8203 (0x200B) = Zero-Width Space       = " "
# 8204 (0x200C) = Zero-Width Non-Joiner  = "0"
# 8205 (0x200D) = Zero-Width Joiner      = "1"
# Add double quotation marks on the start and end of the string.
# These are placed in the script for easier identification.
$InputZeroWidth = ('"'+$InputBinary+'"').Replace(" ", [char]8203).Replace("0", [char]8204).Replace("1", [char]8205)

# Save the zero-width contents to our output file.
Set-Content -Path ($PSScriptRoot + "\ToZeroWidth.txt") -Value $InputZeroWidth
