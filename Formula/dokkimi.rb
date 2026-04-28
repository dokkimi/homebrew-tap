class Dokkimi < Formula
  desc "CLI for managing isolated Kubernetes sandboxes for microservice testing"
  homepage "https://dokkimi.com"
  url "https://registry.npmjs.org/dokkimi/-/dokkimi-0.2.0.tgz"
  sha256 "29e3a63a74f1efdb4b3d554f870057b8cf5e39fba2604c30d99f1050f4fafb44"
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
