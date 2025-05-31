# `myproxy`: Lightweight Terminal Proxy Toggle Script for Linux

This is a simple Bash script that allows you to toggle your Linux terminal's proxy settings **on and off** with a single command: `myproxy on` or `myproxy off`.

It's useful for developers who work behind HTTP/SOCKS proxies, especially when some tools (like `kubectl` or `minikube`) must bypass the proxy.

---

## 🔧 Features

- ✅ Toggle HTTP, HTTPS, FTP, and SOCKS5 proxies in your terminal
- ✅ Automatically excludes Kubernetes-related traffic
- ✅ Easily add custom IPs/domains to bypass proxy (`NO_PROXY`)
- ✅ Simple and clean interface
- ✅ Lightweight and shell-native — no dependencies

---

## 📜 Usage

### Enable proxy:
```bash
myproxy on
```

### Disable proxy:
```bash
myproxy off
```

---

## 📁 Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/myproxy.git
   ```

2. Move the script to your home directory (optional):
   ```bash
   cp myproxy.sh ~/.myproxy.sh
   ```

3. Make it executable:
   ```bash
   chmod +x ~/.myproxy.sh
   ```

4. Add an alias to your shell config (`.bashrc`, `.zshrc`, etc.):
   ```bash
   echo 'alias myproxy="source ~/.myproxy.sh"' >> ~/.bashrc
   source ~/.bashrc  # or `source ~/.zshrc`
   ```

Now `myproxy` is a globally available command in your terminal.

---

## ⚙️ Configuration

Inside the script, you'll find these variables:

```bash
PROXY_HTTP="http://127.0.0.1:2081"
PROXY_SOCKS="socks5://127.0.0.1:2080"
```

Update them to match your actual proxy configuration.

---

## 🚫 Custom NO_PROXY Entries

To prevent traffic to specific IPs or domains from going through the proxy, add them to this list in the script:

```bash
CUSTOM_NO_PROXY=(
  "localhost"
  "127.0.0.1"
  "kubernetes.default.svc"
  "kubernetes"
  "192.168.49.0/24"     # Minikube subnet
  "10.96.0.0/12"         # Kubernetes service CIDR
  "your.internal.api"
  "192.168.1.100"
)
```

These will be passed to the `no_proxy` environment variable when the proxy is enabled.

---

## 🔁 What Happens on Reboot?

The proxy is only active per terminal session. You must run `myproxy on` again after restarting your computer or opening a new terminal. This is intentional to avoid breaking system-wide networking.


## 🧼 Uninstallation

To remove:

```bash
rm ~/.myproxy.sh
# Then remove the alias from your .bashrc or .zshrc
```
