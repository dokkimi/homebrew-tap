class Dokkimi < Formula
  desc "CLI for managing isolated Kubernetes sandboxes for microservice testing"
  homepage "https://dokkimi.com"
  url "https://registry.npmjs.org/dokkimi/-/dokkimi-0.3.5.tgz"
  sha256 "823624fc9fae9848ad80d21d3966caba4e734ff2f689853b3db4903944c568fe"
  license "Elastic-2.0"

  depends_on "node"

  def install
    # ignore_scripts: false — dokkimi's postinstall symlinks internal @dokkimi/*
    # packages into node_modules and runs `prisma generate`. Homebrew defaults
    # to --ignore-scripts; we opt in.
    system "npm", "install", *std_npm_args(ignore_scripts: false)
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/dokkimi --version")
  end
end
