class Dokkimi < Formula
  desc "CLI for managing isolated Kubernetes sandboxes for microservice testing"
  homepage "https://www.npmjs.com/package/dokkimi"
  url "https://registry.npmjs.org/dokkimi/-/dokkimi-0.1.8.tgz"
  sha256 "7940af69cc3cd1f72c5629893df4fa630becd98b38dd2751b4cf90b9a8c29009"
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
