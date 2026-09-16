import subprocess

def run_git_config(args: list[str]) -> None:
    cmd = ['git', 'config', '--global'] + args
    print(f"Running: {' '.join(cmd)}")
    try:
        # We can pass the list directly to subprocess.run, no shell=True needed for simple git commands
        subprocess.run(cmd, check=True, text=True)
    except subprocess.CalledProcessError as e:
        print(f"Error occurred while running '{' '.join(cmd)}': {e}")

def main():
    print("Configuring git settings...")
    
    configs = [
        ['user.name', 'Micael Viana'],
        ['user.email', 'micael.vianasilva@gmail.com'],
        ['core.editor', 'lvim'],
        ['credential.helper', 'cache'],
        ['credential.helper', 'cache --timeout=604800']
    ]
    
    for config in configs:
        run_git_config(config)
        
    print("Git setup completed successfully!")

if __name__ == "__main__":
    main()
