# Terminal Session Management with tmux

## Overview
This guide provides essential commands and tips for effectively managing terminal sessions using `tmux`. 

## Getting Started

### Installation
Ensure that `tmux` is installed on your system. If not, you can install it using the package manager for your system.

#### On Ubuntu/Debian:
```bash
sudo apt-get install tmux
```
## Basic Commands
- `tmux`: Start a new tmux session.
- `tmux list-sessions`: List all available tmux sessions.
- `ctrl + b d`: Detach the current session.
- `tmux attach-session -t <session-number>`: Attach to a specific tmux session.

## Example Usage
1. Start a new tmux session: `tmux`

2. Run some commands or processes within the tmux session.

- Detach from the session: `ctrl + b d`
- List available sessions: `tmux list-sessions`
- Reattach to a specific session: `tmux attach-session -t <session-number>`
