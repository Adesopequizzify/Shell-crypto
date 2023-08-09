#!/bin/bash

# Encryption function
encrypt_file() {
    read -sp "Enter encryption passphrase: " passphrase
    echo
    gpg --cipher-algo AES256 --passphrase "$passphrase" --output "$1.gpg" --symmetric "$1"
    echo "File encrypted as $1.gpg"
}

# Decryption function
decrypt_file() {
    read -sp "Enter decryption passphrase: " passphrase
    echo
    gpg --passphrase "$passphrase" --output "${1%.gpg}" --decrypt "$1"
    echo "File decrypted as ${1%.gpg}"
}

# Main menu
echo "File Encryption and Decryption"
echo "1. Encrypt File"
echo "2. Decrypt File"
read -p "Select an option (1/2): " choice

case $choice in
    1)
        read -p "Enter the file to encrypt: " file_to_encrypt
        encrypt_file "$file_to_encrypt"
        ;;
    2)
        read -p "Enter the file to decrypt: " file_to_decrypt
        decrypt_file "$file_to_decrypt"
        ;;
    *)
        echo "Invalid choice. Exiting..."
        ;;
esac