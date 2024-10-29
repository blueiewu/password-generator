# Secure Password Generator with ASCII Art

A bash script that generates strong random passwords and displays them with ASCII art. The tool includes a beautiful ASCII banner and supports clipboard integration for easy password copying.

## Features

- 🎨 Custom ASCII art banner
- 🔐 Secure random password generation
- 💪 Configurable password length
- ✨ ASCII art password display
- 📋 Automatic clipboard integration
- ✅ Ensures password complexity with:
  - Lowercase letters
  - Uppercase letters
  - Numbers
  - Special characters

## Prerequisites

The script requires the following dependencies:
- `figlet` - for ASCII art generation
- `xclip` (Linux) or `pbcopy` (macOS) - for clipboard functionality

### Installing Dependencies

**On Debian/Ubuntu:**
```bash
sudo apt-get update
sudo apt-get install figlet xclip
```

**On macOS:**
```bash
brew install figlet
```

## Installation

1. Clone the repository:
```bash
git clone https://github.com/your-username/password-generator.git
cd password-generator
```

2. Make the script executable:
```bash
chmod +x password-gen.sh
```

## Usage

Run the script:
```bash
./password-gen.sh
```

Follow the prompts:
1. Enter desired password length (minimum 8 characters)
2. Your password will be:
   - Displayed in ASCII art
   - Shown in plain text
   - Automatically copied to clipboard (if supported)

### Example Output
```
 ____                                     _ 
|  _ \ __ _ ___ _____      _____  _ __ __| |
| |_) / _` / __/ __\ \ /\ / / _ \| `__/ _` |
|  __/ (_| \__ \__ \\ V  V / (_) | | | (_| |
|_|   \__,_|___/___/ \_/\_/ \___/|_|  \__,_|

Enter desired password length (minimum 8, default 12):
12

Your generated password is:
[ASCII ART PASSWORD]

Plain text version: Kj#9mP2$vL&n
Password length: 12 characters
Password copied to clipboard!
```

## Security Features

- Guaranteed inclusion of all character types
- Random character selection
- Password shuffling for additional randomness
- Minimum length enforcement
- No password storage or logging

## File Structure
```
password-generator/
├── password-gen.sh
├── README.md
└── LICENSE
```

## Contributing

1. Fork the repository
2. Create a new branch: `git checkout -b feature-name`
3. Make your changes
4. Push to the branch: `git push origin feature-name`
5. Submit a pull request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

Your Name - [your-email@example.com](mailto:your-email@example.com)

## Acknowledgments

- ASCII art generated using `figlet`
- Inspired by the need for secure password generation
- Thanks to all contributors

