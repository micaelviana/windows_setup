import subprocess
import os

def run_command(command: str) -> None:
    print(f"Running: {command}")
    try:
        # We use shell=True because some of these are shell commands or we need to invoke powershell
        subprocess.run(command, check=True, shell=True, text=True)
    except subprocess.CalledProcessError as e:
        print(f"Error occurred while running '{command}': {e}")
        # Depending on requirements, you might want to exit here
        # sys.exit(1)

def main():
    if os.name != 'nt':
        print("Warning: This script is intended to run on Windows.")

    # Set execution policy
    print("Setting ExecutionPolicy to RemoteSigned...")
    run_command("powershell -Command \"Set-ExecutionPolicy RemoteSigned -Scope CurrentUser\"")

    # Install Scoop
    print("Installing Scoop...")
    run_command("powershell -Command \"Invoke-RestMethod -Uri get.scoop.sh | Invoke-Expression\"")

if __name__ == "__main__":
    main()
