# rmpass
A small zsh script to remove passwords from pdf files on macOS

## Usage

1. Create a directory called "encrypted" in the same location where you have the rmpass.zsh script
2. Place all your password protected pdfs in the "encrypted" directory
3. In the same directory where you have the rmpass.zsh script create a file called password.txt and add the password for the pdf files. Note : all pdf files must have the same password
4. make sure the script is executable, chmod +x rmpass.zsh
5. Run the script - ./rmpass.zsh
6. The script will create a new directory called "decrypted" where all your pdf files without the password protection will be placed

## Requirements

The script uses the `qpdf` utility to strip the passwords from pdf files. If `qpdf` is not installed, the script will install it using homebrew. If homebrew is not installed, the script will install homebrew first, then qpdf.

The script should run on any mac, regardless if it's Intel or Apple Silicon. Tested on M1 Macbook Air with macOS 13.2.1.
