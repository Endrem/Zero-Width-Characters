# ZeroWidth file containing the content that will be converted to plaintext.
# This file should be placed within the same folder as the script.
$InputFile = Get-Content -Path ($PSScriptRoot + "\ToZeroWidth.txt")

# Replace the zero-width characters with binary ones.
# 8203 (0x200B) = Zero-Width Space       = " "
# 8204 (0x200C) = Zero-Width Non-Joiner  = "0"
# 8205 (0x200D) = Zero-Width Joiner      = "1"
# Trim the double quotation marks on the start and end of the string.
# These were placed from the Zero-Width-Writer script for easier identification.
$InputZeroWidth = ($InputFile).Replace([char]8203," ").Replace([char]8204,"0").Replace([char]8205,"1").Replace('"',"")

# Convert the binary bytes into decimal.
$InputDecimal = $InputZeroWidth -split " " | ForEach-Object{[System.Convert]::ToInt32($_,2)}

# Convert the decimal to text.
$InputString = [System.Text.Encoding]::Default.GetString($InputDecimal)

# Save the plaintext contents to our output file.
Set-Content -Path ($PSScriptRoot + "\FromZeroWidth.txt") -Value $InputString
