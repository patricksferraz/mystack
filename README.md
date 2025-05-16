# MyStack

A modular, script-based setup for a modern development environment tailored for Data Scientists. This repository automates the installation of essential tools and configurations to get you up and running quickly.

## Features

- **One-Command Setup**: Run `setup.sh` to install and configure your environment.
- **Modular Installation**: Choose what you need:
  - `basic`: Installs dependencies and Oh My Zsh
  - `conda`: Installs Miniconda with shell completions
  - `docker`: Installs Docker and configures user permissions
  - `utils`: Adds useful shell aliases for system maintenance
  - `all`: Installs everything
- **Modern Shell**: Configures Zsh with Oh My Zsh, plugins, and themes.
- **Data Science Tools**: Includes Miniconda for Python environments and Docker for containerization.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/patricksferraz/mystack.git
   cd mystack
   ```

2. Run the setup script:
   ```bash
   sudo ./setup.sh -i all
   ```

## Usage

- **Basic Setup**: `sudo ./setup.sh -i basic`
- **Install Miniconda**: `sudo ./setup.sh -i conda`
- **Install Docker**: `sudo ./setup.sh -i docker`
- **Install Utilities**: `sudo ./setup.sh -i utils`
- **Install Everything**: `sudo ./setup.sh -i all`

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

- **Patrick S. Ferraz** - [patricksferraz](https://github.com/patricksferraz)

## Acknowledgments

- [Oh My Zsh](https://ohmyz.sh/)
- [Miniconda](https://docs.conda.io/en/latest/miniconda.html)
- [Docker](https://www.docker.com/)
