# Rover of Nova-X

> Sunlit retro botanical HTTP preview proxy for site migrations and DNS propagation testing.  
> Running on **[rover.novax.my.id](https://rover.novax.my.id)**

Rover of Nova-X allows you to test websites and server migrations directly against their destination server IP without modifying `/etc/hosts` or waiting for worldwide DNS propagation.

---

## Key Features

Rover connects directly to the destination server IP with the spoofed HTTP `Host:` header on your behalf:

* **Zero `/etc/hosts` Editing:** Preview staging and new server builds from any device or browser without administrative privileges.
* **On-The-Fly Link Rewriting:** Internal HTML links (`<a href>`, `<img src>`, `<link href>`, `<script src>`, inline styles, and form actions) are automatically rewritten to route through the proxy tunnel.
* **Interactive Preview Toast:** Injects a lightweight botanical status banner (`preview.html`) indicating the previewed host, target IP, rewritten link count, and execution time.
* **Cookie & Session Forwarding:** Supports cookies and session handling across requests.
* **HTTP Form Submissions:** POST requests and multipart file uploads are proxied to the target server.
* **RFC1918 Protection:** Built-in blacklist protects against accidental internal subnet bridging.

---

## Visual Design Reference

Designed according to **`DESIGN.md`** — *Sunlit Retro Botanical Almanac*:
* **Palette:** Sunlit Cream (`#f2ee98`), Forest Ink (`#10380b`), Marigold (`#fce519`), Sage Wash (`#dbe8ac`), Parchment (`#fefde6`), and Vivid Fern (`#30be60`).
* **Typography:** Oswald (National 2 Condensed display substitute) for compressed poster headlines and Rethink Sans (weights 600-800) for structural UI copy.
* **Neobrutalist Elevation:** Hard `8px 8px 0 0 #10380b` offset shadows with 40px rounded cards and 1440px pill buttons.

---

## Usage

1. Open `https://rover.novax.my.id`
2. Enter the destination URL (e.g. `example.com` or `https://staging.domain.com`)
3. Enter the target server IP address (e.g. `198.51.100.42`)
4. Click **Explore Site Preview** to browse the site through the tunnel:
   ```
   https://rover.novax.my.id/{IP}/{URL}
   ```

---

## Technical Notes & Limitations

* **Full Page Buffering:** The proxy buffers and parses the entire HTML DOM before rewriting URLs and flushing output.
* **Client-Side JavaScript:** URLs constructed dynamically in complex client scripts may bypass rewriting and hit the live production site.
* **Pre-Propagation Tool:** Rover of Nova-X is built as an exploration and migration testing utility, not as a high-traffic production reverse proxy or security boundary.
* **SSL/TLS:** Connects to remote targets via cURL with SSL verification disabled for self-signed or pre-migration certificates.

---

## License

Distributed under the terms of the **GNU Affero General Public License v3 (AGPL-3.0)**. See `LICENSE` for details.
