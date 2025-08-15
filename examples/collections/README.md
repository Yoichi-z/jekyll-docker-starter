# Collections Example (Optional)

This starter keeps collections **disabled by default** to stay minimal.

If you want a simple `authors` collection and a staff page:

1. Uncomment the `collections:` and `defaults:` block in `_config.yml` (see comments there).
2. Copy the following from `examples/collections/` into your site root:
   - `examples/collections/_authors/` → `_authors/`
   - `examples/collections/_includes/staff_list.html` → `_includes/staff_list.html`
   - `examples/collections/staff.html` → `staff.html`
   - (optional) `examples/collections/_data/staff/people.yml` → `_data/staff/people.yml`
3. Start the dev server as usual: `docker compose up -d --build`.

You’ll then get:
- Author pages at `/authors/<name>/`
- A Staff listing page at `/staff/`
