# windows-set-static-ip

![Platform](https://img.shields.io/badge/platform-Windows-blue)
![Language](https://img.shields.io/badge/language-Batch%20Script-yellow)
![Tool](https://img.shields.io/badge/tool-netsh-orange)
![Protocol](https://img.shields.io/badge/protocol-IPv4-green)
![Mode](https://img.shields.io/badge/mode-Static%20%26%20DHCP-red)
![Runs In](https://img.shields.io/badge/runs%20in-CMD-purple)
![License](https://img.shields.io/github/license/fouad-salehi/windows-set-static-ip)

## About

**windows-set-static-ip** is a lightweight Windows command-line tool that lets you configure IPv4 settings without opening Control Panel.
The tool is built entirely with native Windows Batch Script and uses `netsh` to apply network changes directly, so no installation, dependencies, or backend are required.

> [!NOTE]
> **The tool provides three main actions:**
> - **View Current IP Configuration** — Display the current IPv4 settings of all adapters.
> - **Set Static IP Address** — Assign a static IPv4 address, subnet mask, and optional gateway.
> - **Set IP to DHCP** — Revert the adapter back to automatic (DHCP) mode.

The tool automatically requests administrator privileges on launch, so users can simply double-click and follow the menu.

## Screenshots

<img width="480" alt="windows-set-static-ip preview" src="https://github.com/user-attachments/assets/fb5a2c0e-73f2-42fe-a797-a6272a626e13" />

## Technologies

- Windows Batch Script (`.bat`)
- `netsh` command-line utility
- Windows UAC (User Account Control)
- GitHub

## Features

- Browser-free, install-free CLI tool
- Automatic administrator privilege request
- View current IP configuration
- Set static IPv4 address with subnet mask and gateway
- Revert to DHCP (automatic)
- Simple numbered menu
- Lightweight and portable (single `.bat` file)

## Installation

### Option 1 — Clone the repository

```bash
git clone https://github.com/fouad-salehi/windows-set-static-ip.git
cd windows-set-static-ip
```

Then double-click `SetStaticIP.bat`.

### Option 2 — Download directly

> [!TIP]
> **Direct download:**
> [SetStaticIP.bat](https://github.com/fouad-salehi/windows-set-static-ip/raw/main/SetStaticIP.bat)

Download the file and double-click it — no installation required.

## Usage

1. Run `SetStaticIP.bat` (it will automatically request administrator privileges).
2. Choose an option from the menu:
   - `[1]` View current IP configuration
   - `[2]` Set a static IPv4 address
   - `[3]` Revert to DHCP (automatic)
   - `[4]` Exit
3. Follow the on-screen prompts.

## Project

A small utility for IT administrators and everyday users who need to switch between static and DHCP IPv4 configurations quickly, without navigating through Windows Control Panel.

## Author

[**Fouad Salehi**](https://github.com/fouad-salehi)

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
