[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://choosealicense.com/licenses/mit/)
![PowerShell](https://img.shields.io/badge/powershell-7-blue.svg)
![Python](https://img.shields.io/badge/python-v3.9-blue.svg)
[![Donate](https://img.shields.io/badge/donate-PayPal-yellow.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=XH8R7VFJQE3YQ&currency_code=USD)

# Zero-Width-Characters
Scripts for zero-width unicode steganography. (Written in PowerShell and Python)

## Description
Zero-width unicode characters are characters that are zero pixels wide and which allow for different steganographic uses.  Concerns about the misuse of these characters include: journalists inadvertently exposing their sources, covert information leakage, and inattentive admins executing hidden malicious code.

The concerns these characters introduce, in both OPSEC and enterprise security, are intriguing.  One of the more interesting enterprise concerns is that an administrator may see a single line of code and unknowingly execute hundreds.

### How It Works
First off, there are different ways to achieve this since there are at least ten different zero-width characters.  These scripts currently use three: 0x200B (Space), 0x200C (Non-Joiner), and 0x200D (Joiner).  The plaintext that an actor wants to convert is first turned into binary.  The "0"s are replaced with 0x200C, "1"s are replaced with 0x200D, and spaces between bytes are replaced with 0x200B.  And that's it!  The message is now zero pixels wide and can be copied into documents or programs that support unicode.

Converting back is straight-forward - first converting the zero-width characters back into binary followed by converting the binary into plaintext.

## Usage
### Plaintext To Zero-Width
Add the desired content into "Plaintext.txt" and execute the script.  Run the "Zero-Width-Writer" (PowerShell or Python) script.  The output ("ToZeroWidth.txt") will contain the zero-width unicode characters, wrapped in double quotes.

### Zero-Width To Plaintext
Place the text containing zero-width unicode characters into the "ToZeroWidth.txt" file.  Run the "Zero-Width-Reader" (PowerShell or Python) script.  The output ("FromZeroWidth.txt") will contain the plaintext.

### Obfuscated/Stealthy Script (PowerShell)
After using the "Zero-Width-Writer" PowerShell script, place the entire output (including double quotes) at the beginning of the "Zero-Width-Obfuscated" script.  The script utilizes "Invoke-Expression" to execute the hidden code.

It only takes overlooking a **single** line such as this to inadvertently execute malicious code.  **Hundreds** of lines of malicious code can be hidden within a script like this.

## Roadmap
- [x] Add Python-equivalent scripts.
- [x] Add obfuscated PowerShell example script.
- [ ] Remove either 0x200B or the byte's padding since the opposite can be utilized during reconstruction.

## Author
The contents of this repository were created by [Cole Chapman](https://github.com/Endrem/).

## License
"Zero-Width-Characters" scripts are made available under the [MIT License](https://choosealicense.com/licenses/mit/).