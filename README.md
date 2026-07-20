# Cyber-Rage Tunnel Panel

VLESS + Reality tunnel gateway with high-speed relay and cyberpunk dashboard.

## Features

- **VLESS + Reality** — Traffic disguised as normal HTTPS, bypasses DPI
- **XHTTP Transport** — packet-up and stream-up modes
- **WebSocket Transport** — Classic VLESS over WS
- **Admin Dashboard** — Cyberpunk-themed UI with Space Grotesk font
- **Config Management** — Create unlimited configs with traffic/speed/IP limits
- **Reality Auto-Generate** — Keys and Short IDs generated automatically
- **Subscription Groups** — Group configs and generate public pages
- **Traffic Monitoring** — Hourly charts and live connection tracking
- **Bandwidth Throttling** — Per-config speed limits (Mbps)
- **IP Limits** — Max concurrent IPs per config
- **Auto Expiry** — Config expiration by days
- **Persistent Storage** — State saved to disk

## Deploy on Railway

1. **Fork** this repository
2. Go to [Railway.app](https://railway.app/) → **New Project** → **Deploy from GitHub repo**
3. Select your forked repo
4. Go to **Settings** → **Networking** → **Generate Domain**
5. Add a **Volume** mounted at `/data` (required for persistence)

## Deploy on VPS

```bash
git clone <your-repo>
cd Cyber-Rage-Tunnel-Panel
pip install -r requirements.txt
python main.py
```

## Environment Variables

| Variable | Description | Default |
|---|---|---|
| `ADMIN_PASSWORD` | Panel login password | `CYBERRAGE` |
| `SECRET_KEY` | Secret for session hashing | Auto-generated |
| `DATA_DIR` | State storage path | `/data` |
| `PORT` | Server port | `8000` |
| `SERVER_HOST` | Server hostname | `localhost` |
| `RAILWAY_PUBLIC_DOMAIN` | Auto-set by Railway | `localhost` |

## Default Credentials

- **Password:** `CYBERRAGE`

## Reality Protocol

When you create a config with VLESS + Reality:

- **SNI (Server Name):** The website your traffic appears to visit (e.g., `www.microsoft.com`)
- **Public Key (pbk):** Your server's Reality public key (auto-filled)
- **Short ID (sid):** Authentication token (auto-filled)
- **Fingerprint:** Browser TLS fingerprint to mimic

Reality keys are generated automatically on first startup and saved to disk.

## API Endpoints

| Endpoint | Method | Description |
|---|---|---|
| `/login` | GET | Login page |
| `/dashboard` | GET | Admin dashboard |
| `/api/login` | POST | Authenticate |
| `/api/logout` | POST | Logout |
| `/api/links` | GET/POST | List/create configs |
| `/api/links/{uid}` | PATCH/DELETE | Update/delete config |
| `/api/subs` | GET/POST | List/create groups |
| `/api/subs/{id}` | PATCH/DELETE | Update/delete group |
| `/api/connections` | GET | Live connections |
| `/api/activity` | GET | Activity logs |
| `/stats` | GET | Dashboard stats |
| `/sub/{uuid}` | GET | Single config subscription |
| `/sub-group/{key}` | GET | Group subscription |
| `/p/{key}` | GET | Public group page |
| `/ws/{uuid}` | WS | WebSocket tunnel |
| `/xhttp-siz10/{mode}/{uuid}/{sid}` | GET | XHTTP downlink |
| `/proxy/{url}` | * | HTTP proxy |

## Tech Stack

- **Backend:** Python 3.11+ / FastAPI / Uvicorn
- **Protocol:** VLESS + Reality / XHTTP / WebSocket
- **Frontend:** Space Grotesk / JetBrains Mono / Phosphor Icons / Chart.js
- **Storage:** JSON file on disk
