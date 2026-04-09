<p align="center"><code>npm i -g @openai/codex</code><br />or <code>brew install --cask codex</code></p>
<p align="center"><strong>Codex CLI</strong> is a coding agent from OpenAI that runs locally on your computer.
<p align="center">
  <img src="https://github.com/openai/codex/blob/main/.github/codex-cli-splash.png" alt="Codex CLI splash" width="80%" />
</p>
</br>
If you want Codex in your code editor (VS Code, Cursor, Windsurf), <a href="https://developers.openai.com/codex/ide">install in your IDE.</a>
</br>If you want the desktop app experience, run <code>codex app</code> or visit <a href="https://chatgpt.com/codex?app-landing-page=true">the Codex App page</a>.
</br>If you are looking for the <em>cloud-based agent</em> from OpenAI, <strong>Codex Web</strong>, go to <a href="https://chatgpt.com/codex">chatgpt.com/codex</a>.</p>

---

## Quickstart

### Installing and running Codex CLI

Install globally with your preferred package manager:

```shell
# Install using npm
npm install -g @openai/codex
```

```shell
# Install using Homebrew
brew install --cask codex
```

Then simply run `codex` to get started.

<details>
<summary>You can also go to the <a href="https://github.com/openai/codex/releases/latest">latest GitHub Release</a> and download the appropriate binary for your platform.</summary>

Each GitHub Release contains many executables, but in practice, you likely want one of these:

- macOS
  - Apple Silicon/arm64: `codex-aarch64-apple-darwin.tar.gz`
  - x86_64 (older Mac hardware): `codex-x86_64-apple-darwin.tar.gz`
- Linux
  - x86_64: `codex-x86_64-unknown-linux-musl.tar.gz`
  - arm64: `codex-aarch64-unknown-linux-musl.tar.gz`

Each archive contains a single entry with the platform baked into the name (e.g., `codex-x86_64-unknown-linux-musl`), so you likely want to rename it to `codex` after extracting it.

</details>

### Using Codex with your ChatGPT plan

Run `codex` and select **Sign in with ChatGPT**. We recommend signing into your ChatGPT account to use Codex as part of your Plus, Pro, Business, Edu, or Enterprise plan. [Learn more about what's included in your ChatGPT plan](https://help.openai.com/en/articles/11369540-codex-in-chatgpt).

You can also use Codex with an API key, but this requires [additional setup](https://developers.openai.com/codex/auth#sign-in-with-an-api-key).

### Using an OpenAI-compatible company gateway

This fork also supports enterprise OpenAI-compatible deployments directly from
environment variables. It can read:

- API key from `CODEX_API_KEY`, `OPENAI_API_KEY`, or `API_KEY`
- Base URL from `OPENAI_BASE_URL` or `BASE_URL`
- Custom CA bundle from `CODEX_CA_CERTIFICATE`, `CA_CERT_PATH`,
  `OFFICETOOL_CA_CERT_PATH`, `OFFCIATOOL_CA_CERT_PATH`, or `SSL_CERT_FILE`

Example:

```shell
export API_KEY="sk-your-company-token"
export BASE_URL="https://your-company-gateway.example.com/v1"
export CA_CERT_PATH="/path/to/company-root-ca.pem"
codex
```

### Native Windows install from this fork

This fork can also be used on native Windows without WSL2, but it still runs as
a local CLI application rather than a browser app.

1. In GitHub Actions, run the `fork-windows-release` workflow with a version
   such as `0.1.0-company.1`.
2. On the Windows machine, download `install.ps1` from that release or from this
   repository, then point the installer at this fork:

```powershell
$env:CODEX_INSTALL_REPO = "jonhncatt/codexnetfix"
iwr https://raw.githubusercontent.com/jonhncatt/codexnetfix/main/scripts/install/install.ps1 -OutFile install.ps1
.\install.ps1 0.1.0-company.1
```

If you do not want an installer at all, use the release asset
`codex-windows-x64-portable-<version>.zip`, unzip it anywhere, and run
`run.cmd` or `run.ps1`.

The portable zip does not need administrator rights and does not add anything to
system `PATH`. It keeps `CODEX_HOME` inside the unzip directory and prepends the
zip directory to `PATH` for the current process so bundled `rg.exe` works.

For portable use, copy `company-env.cmd.example` to `company-env.cmd` or copy
`company-env.ps1.example` to `company-env.ps1`, then edit your company values
locally next to the executable.

Example company environment on Windows:

```powershell
[Environment]::SetEnvironmentVariable("API_KEY", "your-company-token", "User")
[Environment]::SetEnvironmentVariable("BASE_URL", "https://your-company-gateway.example.com/v1", "User")
[Environment]::SetEnvironmentVariable("CA_CERT_PATH", "C:\\Users\\you\\certs\\company-root-ca.pem", "User")
```

## Docs

- [**Codex Documentation**](https://developers.openai.com/codex)
- [**Contributing**](./docs/contributing.md)
- [**Installing & building**](./docs/install.md)
- [**Open source fund**](./docs/open-source-fund.md)

This repository is licensed under the [Apache-2.0 License](LICENSE).
