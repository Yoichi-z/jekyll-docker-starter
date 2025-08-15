# Jekyll Docker Starter

Minimal, batteries-included starter to run **Jekyll inside Docker** with **live reload**.  
No Ruby on your host. Same dev loop on macOS, Linux, and Windows.

> Live preview: run locally at `http://localhost:4000` • Deploy with GitHub Actions to GitHub Pages.

---

## Live Demo

View the site built from this repository on GitHub Pages:  
https://yoichi-z.github.io/jekyll-docker-starter/

---

## Quick Start (60 seconds)

```bash
git clone https://github.com/Yoichi-z/jekyll-docker-starter.git
cd jekyll-docker-starter
docker compose up -d --build
# → http://localhost:4000  (LiveReload on :35729)
```

Stop:
```bash
docker compose down
```

Rebuild from scratch (first run after config changes):
```bash
docker compose down -v
docker compose up -d --build
```

---

## Features

- **Zero host setup** — no global Ruby or gems
- **Live reload** — save → browser refreshes automatically
- **Reproducible** — Ruby+gems pinned inside the container
- **GitHub Pages ready** — Actions workflow included (`.github/workflows/pages.yml`)
- **Clean, minimal UI** — small set of layouts/includes/Sass

---

## Requirements

- Docker Engine and the Docker Compose plugin  
  - macOS/Windows: Docker Desktop  
  - Linux: Engine + `docker-compose-plugin`
- Port **4000** (Jekyll) and **35729** (LiveReload) available on your host

---

## Configuration

### Local development
For local builds, keep these empty (the theme uses relative URLs via Liquid filters):
```yml
# _config.yml
url: ""
baseurl: ""
```

### GitHub Pages (Project Pages)
Set these to your public site URL and repo path:
```yml
# _config.yml
url: "https://<your-username>.github.io"
baseurl: "/<your-repo>"        # NOTE: leading slash required
```
Common pitfall: `/blog/` 404. Ensure your `blog.html` has `permalink: /blog/` (or place it as `blog/index.html`).

---

## Linux / macOS: avoid root-owned files (optional)

Bind mounts can create root-owned files on host systems. You can run the container with your host UID/GID:

1. Add to `docker-compose.yml` (already present as an option in this starter):
   ```yaml
   services:
     jekyll:
       user: "${UID:-1000}:${GID:-1000}"
   ```

2. Provide your UID/GID (do **not** use `sudo`):
   - **Temporary (per shell):**
     ```bash
     env UID=$(id -u) GID=$(id -g) docker compose down -v
     env UID=$(id -u) GID=$(id -g) docker compose up -d --build
     ```
   - **Persistent (`.env` file at repo root):**
     ```dotenv
     UID=501    # macOS typical UID; Linux often 1000
     GID=20     # macOS typical GID; Linux often 1000
     ```
     Then run:
     ```bash
     docker compose down -v
     docker compose up -d --build
     ```

Windows users can skip this; NTFS doesn’t map UID/GID the same way.

---

## Deploy to GitHub Pages (via Actions)

This repo ships with a workflow that builds and publishes Pages.

1. In your GitHub repo: **Settings → Pages** → Source: **GitHub Actions**. 
2. Push to your default branch (`main`).  
3. The workflow `.github/workflows/pages.yml` will build your site and publish it.

> For Project Pages you typically use:  
> `url: "https://<username>.github.io"` and `baseurl: "/<repo>"`

---

## Project Structure

```
.
├─ .github/workflows/pages.yml       # GitHub Pages deploy pipeline
├─ Dockerfile                        # Ruby base + entrypoint
├─ docker-compose.yml                # Ports, volumes, env
├─ docker/entrypoint.sh              # bundle check/install + jekyll serve
├─ _config.yml                       # Jekyll config (see Configuration)
├─ _layouts/ _includes/ _sass/       # Minimal theme scaffolding
├─ assets/css/main.scss              # System-UI font & small design tokens
├─ index.html                        # Hero + Quick Start + features
├─ blog.html                         # Blog index (use permalink: /blog/)
├─ about.md                          # About page (starter copy)
└─ examples/                         # Optional learning material (excluded from build)
```

---

## Collections (optional)

The starter ships **without collections enabled** to stay minimal. If you want an `authors` collection and a simple Staff page:

1. Uncomment the `collections:` block in `_config.yml` (see comments there).
2. Move files from `examples/collections/` into your site root as instructed in `examples/collections/README.md`.
3. Restart the dev server.

If you don’t need collections, simply ignore `examples/` (it’s excluded from the build).

---

## Troubleshooting

- **LiveReload doesn’t trigger on Linux**  
  The server runs with `--watch` (and polling on Windows/WSL). On Linux, polling isn’t needed; if you turned it off and still see issues, ensure your editor writes to disk (not via temp files).

- **Permission errors after switching to UID/GID mode**  
  Clear the bundle volume once: `docker compose down -v` then `up -d --build`.

- **Windows path sharing**  
  In Docker Desktop, ensure your project folder is allowed under Settings → Resources → File Sharing.

---

## Contributing

Issues and PRs are welcome. Keep the “starter” scope in mind: small, readable, and easy to extend.

---

## License & Credits

- Built with **Jekyll** — see <https://jekyllrb.com/>.
- Maintained by **Yoichi** ([@Yoichi-z](https://github.com/Yoichi-z)). Contributions welcome — please open an issue or PR.
- Released under the **MIT License**.

---

With gratitude to the **Jekyll** maintainers and contributors. This project is independent and not affiliated with the Jekyll team.
