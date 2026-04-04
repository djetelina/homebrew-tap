brew := "/home/linuxbrew/.linuxbrew/bin/brew"

# ── Release process ──────────────────────────────────────────────
# 1. Run: just update <package>
# 2. Create a branch, commit, push, open a PR
# 3. CI (brew test-bot) builds bottles on macOS ARM, Intel, and Linux (~30 min)
# 4. Once checks pass, add the 'pr-pull' label to the PR
# 5. Publish workflow uploads bottles to GitHub Releases,
#    commits the bottle block to the formula, and pushes to main
# 6. PR is closed automatically (not merged via GitHub UI)
#
# Notes:
# - Formulas using uv-build need: depends_on "rust" => :build
# - Dependency order must be alphabetical (brew style enforces)
# - If publish fails with "already_exists", delete the stale
#   GitHub releases and re-label the PR
# ─────────────────────────────────────────────────────────────────

# Bump formula to latest PyPI version and update Python resources
# Usage: just update tofuref
update package:
    #!/usr/bin/env bash
    version=$(curl -s https://pypi.org/pypi/{{package}}/json | python3 -c "import sys,json; print(json.load(sys.stdin)['info']['version'])")
    echo "Updating {{package}} to ${version}"
    {{brew}} bump-formula-pr --write-only --no-audit --version "${version}" djetelina/tap/{{package}}
    {{brew}} update-python-resources djetelina/tap/{{package}}
