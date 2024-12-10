# Rail Fence Cipher Bash Tool

## Overview

The **Rail Fence Cipher** is a simple transposition cipher that encrypts or decrypts a message by writing the message in a zigzag pattern across multiple "rails" (rows), then reading the message off by rows to produce the ciphertext or plaintext.

This Bash-based tool allows users to easily **encrypt** and **decrypt** messages using the Rail Fence Cipher, with the added flexibility of adjusting the number of rails and offset value. This program features an interactive CLI and ensures the correctness of decryption by allowing users to confirm or retry with different rail and offset values.

## Features

- **Encryption & Decryption**: Supports both encryption and decryption of messages.
- **Customizable Rails and Offset**: Choose the number of rails and offset for encryption and decryption.
- **Interactive User Interface**: Easy-to-use CLI to input messages and control the encryption/decryption process.
- **Correctness Validation**: During decryption, the tool confirms if the decrypted text is correct, enabling the user to retry with different configurations if necessary.

## Prerequisites

- **Bash**: This script is designed for Linux and macOS systems that support Bash.
- **No external dependencies**: The tool runs solely within the native Bash environment.

## Installation

To use this tool, follow these steps:

1. **Clone or download** the repository to your local machine.
2. Navigate to the directory containing the `rail-fence.sh` script.
3. **Make the script executable** by running the following command:

   ```bash
   chmod +x rail-fence.sh

4.	The script is now ready to use!

Usage:

Running the Script
To run the tool, execute the script from your terminal:

./rail-fence.sh

Upon running the script, you will be presented with the following options:
Choose an option:
1. Encrypt
2. Decrypt
3. Exit
Enter your choice:


Encrypting a Message

To encrypt a message:
	1.	Select Option 1.
	2.	Enter the plaintext (message you want to encrypt).
	3.	Enter the number of rails (rows) for the zigzag pattern.
	4.	Enter the offset (starting row) for the encryption process.
	5.	The script will output the encrypted message.

Example: Encrypting the message “rohith” with 3 rails and offset 4

Enter the plaintext: rohith
Enter the number of rails: 3
Enter the offset: 4
Encrypted Text: irhtoh


Decrypting a Message

To decrypt a message:
	1.	Select Option 2.
	2.	Enter the ciphertext (the encrypted message).
	3.	Enter the number of rails and offset used for encryption.
	4.	The script will attempt to decrypt the message.
	5.	It will ask if the decrypted text is correct. If the result is not correct, you can retry by changing the number of rails or the offset.

Example: Decrypting the ciphertext “irhtoh” with 3 rails and offset 4

Enter the ciphertext: irhtoh
Enter the number of rails: 3
Enter the offset: 4
Decrypted Text: rohith
Is this correct? (y/n): y
Thanks for using the Rail Fence Cipher Tool!


If the decrypted text is incorrect, the tool will prompt you to try again:

Enter the ciphertext: irhtoh
Enter the number of rails: 4
Enter the offset: 4
Decrypted Text: irthoh
Is this correct? (y/n): n
Try again with a different number of rails or offset.

Exiting the Tool

To exit the program:
	1.	Select Option 3.
	2.	The script will display a goodbye message and exit:


    Goodbye! Created by Rohith with ♥


Code Structure

display_banner Function

This function displays a banner with the tool’s name and creator details.

encrypt Function

This function performs the encryption of a plaintext message using the Rail Fence Cipher algorithm. It takes:
	•	Plaintext: The message to be encrypted.
	•	Rails: The number of rails (rows) used for the zigzag pattern.
	•	Offset: The starting row for the encryption process.

decrypt Function

This function performs the decryption of a ciphertext message using the Rail Fence Cipher algorithm. It takes:
	•	Ciphertext: The message to be decrypted.
	•	Rails: The number of rails (rows) used for the zigzag pattern.
	•	Offset: The starting row for the decryption process.

Main Loop

The main loop provides the user with three options:
	1.	Encrypt: Encrypt a plaintext message.
	2.	Decrypt: Decrypt a ciphertext message.
	3.	Exit: Exit the program.


This `README.md` file provides a detailed explanation of the tool, its functionality, how to use it, and how it works, formatted professionally in Markdown for easy readability.