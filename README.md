# envs - Simple .env Files Manager

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

`envs` is a lightweight bash script that helps developers manage `.env` files across projects.

## Installation

For quick installation, run:

```bash
curl -sSf https://raw.githubusercontent.com/longdog/envs/main/install.sh | bash
```

If you prefer manual installation:

1. Download the script:

```bash
curl -sSfLo ~/.local/bin/envs https://raw.githubusercontent.com/longdog/envs/main/envs
```
2. Make it executable:

```bash
chmod +x ~/.local/bin/envs
```

3. Ensure `~/.local/bin` is in your `PATH`

## Usage

Simply run envs in any Git repository directory:

```bash
cd your/project/directory
envs
```

This will:

- Detect your Git repository's origin URL
- Create a properly organized backup location in ~/.config/envs
- Create or preserve your existing .env file
- Set up a symlink from your project to the centralized storage

## Why Use This?

- Security: Keep all your sensitive .env files in one secure location
- Consistency: Ensure the same environment variables across all your development machines
- Backup: Easily back up all your environment configurations at once
- Sync: Synchronize your .env files across machines using your preferred cloud storage

## Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you'd like to change.

## License

[LICENSE](LICENSE)
