#!/usr/bin/env bash
# Bootstraps a new project from this template: clone, reset git, add vcpkg, rename, then self-delete.
# Usage: curl -fsSL https://raw.githubusercontent.com/maorgershman/cpp-template/main/init.sh | bash -s -- <project-name> [target-dir]
set -euo pipefail

REPO_URL="https://github.com/maorgershman/cpp-template"
VCPKG_URL="https://github.com/microsoft/vcpkg"
OLD_SNAKE="my_project"
OLD_KEBAB="my-project"

usage() {
    echo "Usage: curl -fsSL https://raw.githubusercontent.com/maorgershman/cpp-template/main/init.sh | bash -s -- <project-name> [target-dir]" >&2
    exit 1
}

name="${1:-}"
dir="${2:-$name}"

[[ -z "$name" ]] && usage

if [[ ! "$name" =~ ^[a-z][a-z0-9_-]*$ ]]; then
    echo "Error: project name must start with a lowercase letter and contain only lowercase letters, digits, '-' and '_'." >&2
    exit 1
fi

if [[ -e "$dir" ]]; then
    echo "Error: '$dir' already exists." >&2
    exit 1
fi

snake_name="${name//-/_}"
kebab_name="${name//_/-}"

git clone --depth 1 "$REPO_URL" "$dir"
cd "$dir"

rm -rf .git .gitmodules vcpkg LICENSE init.sh
git init -q
git submodule add --depth 1 "$VCPKG_URL" vcpkg

mapfile -t files < <(grep -rl -e "$OLD_SNAKE" -e "$OLD_KEBAB" --exclude-dir=.git --exclude-dir=vcpkg .)
for f in "${files[@]}"; do
    sed -i "s/${OLD_SNAKE}/${snake_name}/g; s/${OLD_KEBAB}/${kebab_name}/g" "$f"
done

if [[ -d "include/${OLD_SNAKE}" ]]; then
    mv "include/${OLD_SNAKE}" "include/${snake_name}"
fi

git add -A
git commit -q -m "Initial commit from cpp-template"

echo "Project '${name}' is ready in ./${dir}"
