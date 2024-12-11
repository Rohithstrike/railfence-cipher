#!/bin/bash

# Function to display the banner
display_banner() {
    echo "===================================="
    echo "   ██████╗  █████╗ ██╗██╗     ███████╗"
    echo "  ██╔════╝ ██╔══██╗██║██║     ██╔════╝"
    echo "  ██║  ███╗███████║██║██║     █████╗  "
    echo "  ██║   ██║██╔══██║██║██║     ██╔══╝  "
    echo "  ╚██████╔╝██║  ██║██║███████╗███████╗"
    echo "   ╚═════╝ ╚═╝  ╚═╝╚═╝╚══════╝╚══════╝"
    echo "   Created by Rohith with ♥          "
    echo "===================================="
}

# Function to encrypt using Rail Fence Cipher with offset
encrypt() {
    local plaintext=$1
    local rails=$2
    local offset=$3
    local length=${#plaintext}
    local cipher=""
    local rail=()

    # Initialize rails
    for ((i = 0; i < rails; i++)); do
        rail[$i]=""
    done

    # Adjust offset to a valid range
    offset=$((offset % (rails * 2 - 2)))

    # Apply offset to the starting position
    local current_offset=$offset
    for ((i = 0; i < current_offset; i++)); do
        plaintext=" ${plaintext}"
    done

    length=${#plaintext}

    # Populate rails with characters based on zig-zag traversal
    local row=0
    local dir_down=1
    for ((i = 0; i < length; i++)); do
        rail[$row]+="${plaintext:i:1}"

        if ((row == 0)); then
            dir_down=1
        elif ((row == rails - 1)); then
            dir_down=0
        fi

        if ((dir_down == 1)); then
            ((row++))
        else
            ((row--))
        fi
    done

    # Concatenate all rails to form the encrypted text
    for ((i = 0; i < rails; i++)); do
        cipher+=${rail[$i]}
    done

    echo "${cipher// /}"
}

# Function to decrypt using Rail Fence Cipher with offset
decrypt() {
    local cipher=$1
    local rails=$2
    local offset=$3
    local length=${#cipher}
    local plaintext=""
    local rail=()
    local mark=()
    local pos=0

    # Initialize rails
    for ((i = 0; i < rails; i++)); do
        rail[$i]=""
    done

    # Adjust offset to a valid range
    offset=$((offset % (rails * 2 - 2)))

    # Mark the positions based on zig-zag pattern
    local row=$offset
    local dir_down=1
    for ((i = 0; i < length; i++)); do
        mark[$i]=$row

        if ((row == 0)); then
            dir_down=1
        elif ((row == rails - 1)); then
            dir_down=0
        fi

        if ((dir_down == 1)); then
            ((row++))
        else
            ((row--))
        fi
    done

    # Fill the rails with characters from the cipher text
    for ((i = 0; i < rails; i++)); do
        for ((j = 0; j < length; j++)); do
            if ((mark[j] == i)); then
                rail[$i]+="${cipher:pos:1}"
                ((pos++))
            fi
        done
    done

    # Read characters back from the rails in zig-zag order
    row=0
    dir_down=1
    for ((i = 0; i < length; i++)); do
        plaintext+=${rail[$row]:0:1}
        rail[$row]=${rail[$row]:1}

        if ((row == 0)); then
            dir_down=1
        elif ((row == rails - 1)); then
            dir_down=0
        fi

        if ((dir_down == 1)); then
            ((row++))
        else
            ((row--))
        fi
    done

    echo "${plaintext// /}"
}

# Main script starts here
display_banner

while true; do
    echo "Choose an option:"
    echo "1. Encrypt"
    echo "2. Decrypt"
    echo "3. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            read -p "Enter the plaintext: " plaintext
            read -p "Enter the number of rails: " rails
            read -p "Enter the offset: " offset
            encrypted_text=$(encrypt "$plaintext" "$rails" "$offset")
            echo "Encrypted Text: $encrypted_text"
            ;;
        2)
            read -p "Enter the ciphertext: " cipher
            while true; do
                read -p "Enter the number of rails: " rails
                read -p "Enter the offset: " offset
                decrypted_text=$(decrypt "$cipher" "$rails" "$offset")
                echo "Decrypted Text: $decrypted_text"
                read -p "Is this correct? (y/n): " confirm
                if [[ $confirm == "y" ]]; then
                    echo "Thank you!"
                    exit 0
                else
                    echo "Try again with a different number of rails or offset."
                fi
            done
            ;;
        3)
            echo "Goodbye! Created by Rohith with ♥"
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
done