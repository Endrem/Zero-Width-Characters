# Plaintext file containing the content that will be converted to zero-width.
# This file should be placed within the same folder as the script.
with open('Plaintext.txt', 'r') as InputFile:
    InputPlaintext = InputFile.read()

# Read the InputFile and convert the text to binary.
InputBinary = ' '.join(format(ord(i), 'b') for i in InputPlaintext)

# Replace the binary characters with zero-width ones.
# 8203 (0x200B) = Zero-Width Space       = " "
# 8204 (0x200C) = Zero-Width Non-Joiner  = "0"
# 8205 (0x200D) = Zero-Width Joiner      = "1"
InputZeroWidth = InputBinary.replace(' ', '\u200b').replace('0', '\u200c').replace('1', '\u200d')

# Save the zero-width contents to our output file.
with open('ToZeroWidth.txt', 'w', encoding='utf-8') as OutputFile:
    # Add double quotation marks on the start and end of the string.
    # These are placed in the script for easier identification.
    OutputFile.write('"' + InputZeroWidth + '"')
