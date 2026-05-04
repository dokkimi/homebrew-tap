class Dokkimi < Formula
  desc "CLI for managing isolated Kubernetes sandboxes for microservice testing"
  homepage "https://dokkimi.com"
  url "https://registry.npmjs.org/dokkimi/-/dokkimi-0.2.5.tgz"
  sha256 "a4f6cc74ab92ff6b7c32a05052ce2dd5941c2732cec135f776a76199be6dc019"
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
