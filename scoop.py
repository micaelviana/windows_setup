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

    # Add the extras bucket
    print("You should restart your shell before execute this program, otherwise the scoop command will not going to be found")
    print("Adding 'extras' bucket to scoop...")
    run_command("powershell -Command \"scoop bucket add extras\"")

    # Install applications via scoop
    apps = ["aria2", "7zip", "git", "psfzf", "psreadline"]
    for app in apps:
        print(f"Installing {app}...")
        # Assuming scoop is in the PATH after installation.
        # Note: If it doesn't pick up the PATH change in the same session, 
        # you might need to use the full path or run it through powershell.
        run_command(f"powershell -Command \"scoop install {app}\"")

    print("Setup completed successfully!")

if __name__ == "__main__":
    main()
