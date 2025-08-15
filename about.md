---
layout: page
title: About
permalink: /about/
---

## What is this project?

**Jekyll Docker Starter** is a minimal, batteries‑included template for running Jekyll locally **inside Docker** with **live reload**.  
No Ruby on your host, reproducible builds, and quick onboarding for teammates and contributors.

---

## Why Docker for Jekyll?

- **Clean host** — no global Ruby/Gems. Everything lives in containers and a named volume.
- **Reproducible** — same Ruby & gems across macOS, Linux, and Windows.
- **Fast dev loop** — save → browser reloads automatically (LiveReload).

---

## How it works

- The container starts via an entrypoint that runs:

  1. `bundle check || bundle install` (first run only)  
  2. `bundle exec jekyll serve --host 0.0.0.0 --livereload`

- Dependencies are cached in a named volume: **`/usr/local/bundle`**.
- On Linux/mac you can match container UID/GID to your host (optional) to avoid root‑owned files.

---

## What’s inside (high level)

- `Dockerfile`, `docker-compose.yml`, `docker/entrypoint.sh`
- Jekyll basics: `_layouts/`, `_includes/`, `_sass/`, `assets/css/main.scss`
- GitHub Pages deploy workflow: `.github/workflows/pages.yml`
- Minimal pages & a simple blog stub

---

## Deploy to GitHub Pages

A ready‑to‑use GitHub Actions workflow (`pages.yml`) builds and publishes the site.  
Push to `main` (or your chosen branch), and Pages will update automatically.

---

## Compatibility

- **macOS / Linux**: arm64 & x86_64 are supported by the Ruby base image.
- **Windows**: Works via Docker Desktop. UID/GID matching is Linux/mac‑only (Windows uses NTFS semantics).

---

## License & Credits

- Built with **Jekyll** — see <https://jekyllrb.com/>.
- Maintained by **Yoichi** ([@Yoichi-z](https://github.com/Yoichi-z)). Contributions welcome — please open an issue or PR.
- Released under the **MIT License**.
