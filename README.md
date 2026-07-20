# Cyber-Rage Fast Panel

High-speed VLESS Gateway with WebSocket and XHTTP transport. Maximum performance optimized.

## Features

- **VLESS over WebSocket** — Classic WS transport
- **XHTTP Transport** — packet-up and stream-up modes
- **Maximum Speed** — 16MB buffers, 64MB sockets, uvloop, batch processing
- **Admin Dashboard** — Cyberpunk-themed UI with Space Grotesk font
- **Config Management** — Create unlimited configs with traffic/speed/IP limits
- **Subscription Groups** — Group configs and generate public pages
- **Traffic Monitoring** — Hourly charts and live connection tracking
- **Bandwidth Throttling** — Per-config speed limits (Mbps)
- **IP Limits** — Max concurrent IPs per config
- **Auto Expiry** — Config expiration by days
- **Persistent Storage** — State saved to disk

## Speed Optimizations

| Parameter | Value |
|---|---|
| Relay Buffer | 16 MB |
| Socket Buffer | 64 MB |
| XHTTP Buffer | 16 MB |
| Quota Batch | 32 MB |
| Flow High Water | 512 MB |
| Downlink Queue | 8192 |
| Batch Threshold | 500 chunks |
| Event Loop | uvloop |

## Deploy on Railway

1. **Fork** this repository
2. Go to [Railway.app](https://railway.app/) → **New Project** → **Deploy from GitHub repo**
3. Select your forked repo
4. Go to **Settings** → **Networking** → **Generate Domain**
5. Add a **Volume** mounted at `/data` for persistent storage

## Deploy on VPS

```bash
git clone <your-repo>
cd Cyber-Rage-Fast-Panel
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

- **Backend:** Python 3.11+ / FastAPI / Uvicorn / uvloop
- **Frontend:** Space Grotesk / JetBrains Mono / Phosphor Icons / Chart.js
- **Transport:** VLESS over WebSocket & XHTTP
- **Storage:** JSON file on disk
