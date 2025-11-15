# Homebrew Formula for Crankfire

This directory contains the Homebrew formula for installing crankfire.

## For Users

### Installation

Install crankfire using Homebrew:

```bash
# Recommended: Use tap
brew tap torosent/crankfire
brew install crankfire

# Alternative: Install directly from URL
brew install https://raw.githubusercontent.com/torosent/crankfire/main/Formula/crankfire.rb
```

### Upgrade

```bash
brew update
brew upgrade crankfire
```

### Uninstall

```bash
brew uninstall crankfire
```

## For Maintainers

### Formula Structure

The formula (`crankfire.rb`) contains:
- Project description and homepage
- Download URL for source tarball
- SHA256 checksum for verification
- Build dependencies
- Build and installation instructions
- Test commands

### Updating the Formula

The formula is automatically updated by the GitHub Actions release workflow when a new version is tagged. The workflow:

1. Downloads the release tarball
2. Calculates the SHA256 checksum
3. Updates the formula with the new version and checksum
4. Commits and pushes the changes

To manually update:

```bash
# Set the version
VERSION="0.1.0"

# Download the tarball
curl -LO "https://github.com/torosent/crankfire/archive/refs/tags/v${VERSION}.tar.gz"

# Calculate SHA256
SHA256=$(shasum -a 256 "v${VERSION}.tar.gz" | awk '{print $1}')

# Update the formula
sed -i '' "s|url \".*\"|url \"https://github.com/torosent/crankfire/archive/refs/tags/v${VERSION}.tar.gz\"|" Formula/crankfire.rb
sed -i '' "s|sha256 \".*\"|sha256 \"${SHA256}\"|" Formula/crankfire.rb

# Test the formula
brew install --build-from-source Formula/crankfire.rb
brew test crankfire

# Commit and push
git add Formula/crankfire.rb
git commit -m "Update formula to v${VERSION}"
git push
```

### Testing the Formula

Before releasing:

```bash
# Audit the formula
brew audit --strict Formula/crankfire.rb

# Build from source
brew install --build-from-source Formula/crankfire.rb

# Run formula tests
brew test crankfire

# Verify installation
crankfire --help
```

### Creating an Official Tap

For wider distribution, you can create an official Homebrew tap:

1. Create a new repository: `homebrew-crankfire`
2. Copy the formula to the repository root:
   ```bash
   cp Formula/crankfire.rb /path/to/homebrew-crankfire/crankfire.rb
   ```
3. Push to GitHub
4. Users can then:
   ```bash
   brew tap torosent/crankfire
   brew install crankfire
   ```

## Troubleshooting

### Build Errors

If the formula fails to build:

1. Check Go version compatibility in `go.mod`
2. Verify all dependencies are available
3. Test build manually:
   ```bash
   go build ./cmd/crankfire
   ```

### Checksum Mismatch

If users report checksum errors:

1. Verify the tarball URL is correct
2. Recalculate the SHA256:
   ```bash
   curl -L <tarball-url> | shasum -a 256
   ```
3. Update the formula with the correct checksum

### Installation Fails

Common issues:

- **Go not found**: Formula declares Go as build dependency, should auto-install
- **Permission denied**: Check Homebrew installation permissions
- **Command not found**: Ensure `/usr/local/bin` or `/opt/homebrew/bin` is in PATH

## Formula Best Practices

- Always use stable release tarballs, not `main` branch
- Include SHA256 checksum for security
- Declare all build dependencies
- Include meaningful test commands
- Keep the formula simple and maintainable
- Follow Homebrew's [Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)

## Resources

- [Homebrew Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)
- [Homebrew Acceptable Formulae](https://docs.brew.sh/Acceptable-Formulae)
- [Creating Taps](https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap)
