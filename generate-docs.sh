#!/bin/bash

echo "# Project Documentation" > PROJECT_DOCUMENTATION.md

echo "" >> PROJECT_DOCUMENTATION.md
echo "## Project Information" >> PROJECT_DOCUMENTATION.md
echo "" >> PROJECT_DOCUMENTATION.md
echo "- Repository: DevOps-Documentation" >> PROJECT_DOCUMENTATION.md
echo "- Current Branch: $(git branch --show-current)" >> PROJECT_DOCUMENTATION.md
echo "- Generated On: $(date)" >> PROJECT_DOCUMENTATION.md

echo "" >> PROJECT_DOCUMENTATION.md
echo "## Commit History" >> PROJECT_DOCUMENTATION.md
echo "" >> PROJECT_DOCUMENTATION.md
git log --pretty=format:"- %h - %s - %an - %ad" --date=short >> PROJECT_DOCUMENTATION.md

echo "" >> PROJECT_DOCUMENTATION.md
echo "" >> PROJECT_DOCUMENTATION.md
echo "## Contributors" >> PROJECT_DOCUMENTATION.md
echo "" >> PROJECT_DOCUMENTATION.md
git log --format='%an' | sort | uniq | sed 's/^/- /' >> PROJECT_DOCUMENTATION.md

echo "" >> PROJECT_DOCUMENTATION.md
echo "## Repository Statistics" >> PROJECT_DOCUMENTATION.md
echo "" >> PROJECT_DOCUMENTATION.md
echo "- Total Commits: $(git rev-list --count HEAD)" >> PROJECT_DOCUMENTATION.md
echo "- Total Contributors: $(git log --format='%an' | sort -u | wc -l | tr -d ' ')" >> PROJECT_DOCUMENTATION.md

echo "" >> PROJECT_DOCUMENTATION.md
echo "## Latest Commit" >> PROJECT_DOCUMENTATION.md
echo "" >> PROJECT_DOCUMENTATION.md
git log -1 --pretty=format:"- %h - %s - %an - %ad" --date=short >> PROJECT_DOCUMENTATION.md

echo "" >> PROJECT_DOCUMENTATION.md
echo "" >> PROJECT_DOCUMENTATION.md
echo "## Workflow Summary" >> PROJECT_DOCUMENTATION.md
echo "" >> PROJECT_DOCUMENTATION.md
echo "Documentation is automatically generated from Git history using GitHub Actions." >> PROJECT_DOCUMENTATION.md
