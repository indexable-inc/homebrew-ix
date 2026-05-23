# TODO: Needs to install dynamically generated manpages
# That is awkward to do in a cask without explicit `manpage` directives or clobbering state
# Explicit manpage directives are untennable with as many subcommands as ix has
# Switching to a formula would fix this
cask "ix" do
  os macos: "darwin", linux: "linux"
  arch arm: "arm64", intel: "x86_64"

  version :latest
  sha256 :no_check

  url "https://ix.dev/cli/#{os}-#{arch}/ix"
  name "ix"
  desc "The official ix.dev command-line client"
  homepage "https://ix.dev/"

  binary "ix"

  generate_completions_from_executable "ix", "system", "completions"

  # Documentation: https://docs.brew.sh/Cask-Cookbook#stanza-zap
  zap trash: [
    "~/.config/ix",
    # not present as of 2026-05-23, but plan to use soon
    "~/.cache/ix",
  ]
end
