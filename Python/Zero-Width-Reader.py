# ZeroWidth file containing the content that will be converted to plaintext.
# This file should be placed within the same folder as the script.
with open('ToZeroWidth.txt', 'r', encoding='utf-8') as InputFile:
    InputZeroWidth = InputFile.read()

# Replace the zero-width characters with binary ones.
# 8203 (0x200B) = Zero-Width Space       = " "
# 8204 (0x200C) = Zero-Width Non-Joiner  = "0"
# 8205 (0x200D) = Zero-Width Joiner      = "1"
# Trim the double quotation marks on the start and end of the string.
# These were placed from the Zero-Width-Writer script for easier identification.
InputBinary = InputZeroWidth.replace('\u200b', ' ').replace('\u200c', '0').replace('\u200d', '1').replace('"', '')

# Splits the binary string into bytes.  The byte string is converted into an integer and then a chr.
InputPlaintext = ''.join(chr(int(i, 2)) for i in InputBinary.split(' '))

# Save the plaintext contents to our output file.
with open('FromZeroWidth.txt', 'w', encoding='utf-8') as OutputFile:
    OutputFile.write(InputPlaintext)
