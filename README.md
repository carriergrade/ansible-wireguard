# ansible-wireguard
![CI](https://github.com/carriergrade/ansible-wireguard/actions/workflows/ci.yml/badge.svg)

A simple interactive script that sets up a Wireguard VPN server with Adguard, Unbound and DNSCrypt-Proxy on your VPS of choice, and lets you manage the config files using a simple WebUI protected by two-factor-authentication.

**Have a question or an issue? Read the [FAQ](FAQ.md) first!**

## Usage

```
wget https://raw.githubusercontent.com/carriergrade/ansible-wireguard/main/bootstrap.sh -O bootstrap.sh && bash bootstrap.sh
```

## Features
* Wireguard WebUI (via wg-easy)
* Two-factor authentication for the WebUI (Authelia)
* Hardened web server (Bunkerweb)
* Encrypted DNS resolution with optional ad-blocking functionality (Adguard Home, DNSCrypt and Unbound)
* IPTables firewall with sane defaults and Fail2Ban
* Automated and unattended upgrades
* SSH hardening and public key pair generation (optional, you can also use your own keys)
* E-mail notifications (using an external SMTP server)

## Requirements
* A KVM-based VPS (or an AWS EC2 instance) with a dedicated IPv4 address
* Debian or RedHat based distros