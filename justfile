brew := "/home/linuxbrew/.linuxbrew/bin/brew"

# Bump formula to latest PyPI version and update Python resources
# Usage: just update tofuref
update package:
    #!/usr/bin/env bash
    version=$(curl -s https://pypi.org/pypi/{{package}}/json | python3 -c "import sys,json; print(json.load(sys.stdin)['info']['version'])")
    echo "Updating {{package}} to ${version}"
    {{brew}} bump-formula-pr --write-only --no-audit --version "${version}" djetelina/tap/{{package}}
    {{brew}} update-python-resources djetelina/tap/{{package}}
