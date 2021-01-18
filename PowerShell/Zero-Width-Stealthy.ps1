# This is a one visible line of code that can contain HUNDREDS of lines of hidden (zero pixels wide) code.
# The hidden code is placed within the double quotes at the beginning.
# The zero-width unicode characters are replaced with 0s and 1s.  The zero-width space is used for 'Split'ing into bytes.
# The bytes are converted to Int16 and then char.  Following this, the object array is converted via "Join-String".
# Lastly, the string is executed via "Invoke-Expression".
("‌‍‌‍‌‍‍‍​‌‍‍‍‌‌‍‌​‌‍‍‌‍‌‌‍​‌‍‍‍‌‍‌‌​‌‍‍‌‌‍‌‍​‌‌‍‌‍‍‌‍​‌‍‌‌‍‌‌‌​‌‍‍‌‍‍‍‍​‌‍‍‍‌‌‍‍​‌‍‍‍‌‍‌‌​‌‌‍‌‍‌‌‌​‌‌‍‌‌‌‍‌​‌‍‌‍‌‍‌‌​‌‍‍‌‍‌‌‌​‌‍‍‌‌‍‌‍​‌‌‍‌‌‌‌‌​‌‍‍‍‌‌‍‍​‌‍‍‍‌‍‌‌​‌‍‍‌‌‍‌‍​‌‍‍‌‌‌‌‍​‌‍‍‌‍‍‌‌​‌‍‍‍‌‍‌‌​‌‍‍‌‍‌‌‌​‌‍‍‍‍‌‌‍​‌‌‍‌‌‌‌‌​‌‍‍‍‌‌‍‍​‌‍‍‌‌‌‍‍​‌‍‍‍‌‌‍‌​‌‍‍‌‍‌‌‍​‌‍‍‍‌‌‌‌​‌‍‍‍‌‍‌‌​‌‌‍‌‌‌‌‌​‌‍‍‍‌‍‍‍​‌‍‍‌‍‍‍‍​‌‍‍‍‌‌‍‌​‌‍‍‌‍‌‍‍​‌‍‍‍‌‌‍‍​‌‌‍‌‍‍‍‌​‌‌‍‌‌‌‍‌​‌‌‍‌‍‌‌‍").Replace([char]8204,"0").Replace([char]8205,"1").Split([char]8203)|%{[char][System.Convert]::ToInt16($_,2)}|Join-String|Invoke-Expression
# The hidden unicode currently within this script converts to the following: Write-Host("The stealthy script works.")