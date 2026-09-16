import subprocess
import os

def run_command(command: str) -> None:
    print(f"Running: {command}")
    try:
        subprocess.run(command, check=True, shell=True, text=True)
    except subprocess.CalledProcessError as e:
        print(f"Error occurred while running '{command}': {e}")

def main():
    if os.name != 'nt':
        print("Warning: This script is intended to run on Windows.")

    packages = [
        ["winget", "install", "--id", "9NKSQGP7F2NH", "-e"],
        ["winget", "install", "Microsoft.PowerShell", "--source", "winget"],
        ["winget", "install", "Microsoft.PowerToys", "--source", "winget"]
    ]

    for package in packages:
        print(f"Running: {' '.join(package)}")
        run_command(' '.join(package))

    print("Setup completed successfully!")

if __name__ == "__main__":
    main()