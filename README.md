This lightweight Bash script monitors a directory (and all its subdirectories) for new PNG files and converts them to JPG format using GraphicsMagick / ImageMagick. It is designed for users who want their GNOME screenshots in JPG format without relying on external screenshot tools.  

## Features

- Automatic recursive monitoring of a folder and its subfolders  
- Immediate conversion of PNG to JPG with configurable quality  
- Optionally keep the original PNG files  
- Runs as a normal user, no root required  
- Checks and installs required dependencies (`graphicsmagick-imagemagick-compat` and `inotify-tools`)  
- Fully configurable via command-line options: quality, watch directory, keep PNG files  
- Help/usage dialog (`-h`) included  

## Installation

1. Clone the repository:  A lightweight Bash script that automatically monitors a directory (and its subdirectories) for PNG files and converts them to JPG format using GraphicsMagick / ImageMagick. Designed for GNOME users who want their screenshots in JPG instead of PNG, without using any external screenshot tools.
Features

    Automatic monitoring of a folder and all subdirectories for new PNG files.

    Immediate conversion of PNG files to JPG with configurable quality.

    Optionally keep the original PNG files.

    Recursive directory support, works with nested folders.

    Runs as a normal user, not requiring root privileges.

    Dependency checks for graphicsmagick-imagemagick-compat and inotify-tools, with automatic install prompt if missing.

    Fully configurable via command-line options: quality, watch directory, keep PNG files.

    Help/usage dialog included (-h).

Installation

    Clone the repository:

git clone https://github.com/speefak/png2jpg_watch.sh.git
cd png2jpg-watcher

    Make the script executable:

chmod +x png2jpg_watch.sh

    (Optional) Move it to a system-wide bin folder:

sudo mv png2jpg_watch.sh /usr/local/bin/png2jpg.sh

    Run the script:

./png2jpg_watch.sh

Usage

./png2jpg_watch.sh [OPTIONS]

Options:

    -q 1-100 → Set JPEG quality (default: 90)

    -p /path/folder → Set watch directory (default: ~/Pictures/unsorted_photos)

    -k → Keep PNG files (default: delete)

    -h → Show help/usage

Example:

./png2jpg_watch.sh -p /home/user/Pictures/screenshots -q 80 -k

Autostart

To start automatically on GNOME login:

    Create a .desktop file in ~/.config/autostart/:

[Desktop Entry]
Type=Application
Name=PNG2JPG Watcher
Exec=/usr/local/bin/png2jpg.sh -k
X-GNOME-Autostart-enabled=true
Comment=Automatically convert PNG screenshots to JPG at login

    Make sure the script is executable.

Dependencies

    graphicsmagick-imagemagick-compat (for convert)

    inotify-tools (for monitoring file system events)

The script automatically checks for these packages and can install them if missing.

```bash
git clone https://github.com/yourusername/png2jpg-watcher.git
cd png2jpg-watcher
````

2. Make the script executable:

```bash
chmod +x png2jpg_watch.sh
```

3. (Optional) Move it to a system-wide bin folder:

```bash
sudo mv png2jpg_watch.sh /usr/local/bin/png2jpg.sh
```

4. Run the script:

```bash
./png2jpg_watch.sh
```

---

## Usage

```bash
./png2jpg_watch.sh [OPTIONS]
```

**Options:**

* `-q 1-100` → Set JPEG quality (default: 90)
* `-p /path/folder` → Set watch directory (default: `~/Pictures/unsorted_photos`)
* `-k` → Keep PNG files (default: delete)
* `-h` → Show help/usage

**Example:**

```bash
./png2jpg_watch.sh -p /home/user/Pictures/screenshots -q 80 -k
```

---

## Autostart

To start automatically on GNOME login:

1. Create a `.desktop` file in `~/.config/autostart/`:

```ini
[Desktop Entry]
Type=Application
Name=PNG2JPG Watcher
Exec=/usr/local/bin/png2jpg_watch.sh -k
X-GNOME-Autostart-enabled=true
Comment=Automatically convert PNG screenshots to JPG at login
```

2. Make sure the script is executable.

---

## Dependencies

* `graphicsmagick-imagemagick-compat` (for `convert`)
* `inotify-tools` (for monitoring file system events)

The script automatically checks for these packages and can install them if missing.

---

## License

MIT License – see [LICENSE](LICENSE)

