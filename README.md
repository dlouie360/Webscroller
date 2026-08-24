# Scrollbound

Scrollbound is a phone-first PDF to webnovel reader. It extracts selectable PDF text in the browser using PDF.js, stores converted books in `localStorage`, and presents each book as one continuous scroll.

## Run locally

PDF.js and the typefaces are loaded from CDNs, so the first run needs internet access. For phone access, run this PowerShell script on the computer:

```powershell
.\start-scrollbound.ps1
```

The script prints a Wi-Fi address such as `http://172.26.122.63:8080`. Open that address on your phone while both devices are on the same Wi-Fi. If Windows Firewall prompts, allow Python on private networks.

You can also open `index.html` directly for a desktop-only preview.

Scanned PDFs without a text layer will need OCR in a future backend or worker pass.

## Publish publicly with GitHub Pages

1. Create an empty public repository on GitHub.
2. From this folder, run:

```powershell
git init
git add .
git commit -m "Create Scrollbound reader"
git branch -M main
git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPOSITORY.git
git push -u origin main
```

3. In the repository, open **Settings > Pages**, choose **GitHub Actions** as the source, and save. This one-time setting is required because GitHub Actions cannot create the Pages site itself.
4. Open **Actions**, select `Deploy Scrollbound`, and choose **Run workflow** on `main` (or push another commit).

GitHub will show the public HTTPS address in the workflow's deployment environment. Since this is a browser-only app, uploaded books remain saved in each reader's own browser and are not uploaded to a server.