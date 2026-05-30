# todoApp

A simple, lightweight desktop ToDo application built using Ruby, GTK+ 3, and Glade. It saves your tasks locally as individual JSON files for persistent offline storage.

## Features

- **Task Management:** Create, edit, and delete todo items.
- **Expandable Details:** View multi-line descriptions and details using an interactive reveal panel.
- **Priority Levels:** Assign task importance (`high`, `medium`, `normal`, `low`) via dropdown selections.
- **Local JSON Storage:** Tasks persist inside `~/.gtk-todo/` as structured JSON files.

## Prerequisites

Ensure you have Ruby and the required GTK+ 3 system libraries installed on your machine.

### Ubuntu / Debian
```bash
sudo apt update
sudo apt install ruby-full build-essential libgtk-3-dev glib-2.0-utils
