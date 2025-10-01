class Rbackup < Formula
  desc "Incremental backup tool in Rust (multi-platform)"
  homepage "https://github.com/umpire274/rBackup"
  license "MIT"
  version "0.5.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/umpire274/rBackup/releases/download/v#{version}/rbackup-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "REPLACE_WITH_SHA256_MAC_INTEL"
    elsif Hardware::CPU.arm?
      url "https://github.com/umpire274/rBackup/releases/download/v#{version}/rbackup-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "REPLACE_WITH_SHA256_MAC_ARM"
    end
  end

  on_linux do
    url "https://github.com/umpire274/rBackup/releases/download/v#{version}/rbackup-#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "REPLACE_WITH_SHA256_LINUX_X64"
  end

  # facoltativo, aiuta `brew livecheck`
  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install "rbackup"
    # se nel tarball includi questi file, li installi così:
    pkgshare.install "README.md" if File.exist?("README.md")
    pkgshare.install "CHANGELOG.md" if File.exist?("CHANGELOG.md")
    pkgshare.install "LICENSE" if File.exist?("LICENSE")
  end

  test do
    # verifica minima: stampa versione o help
    output = shell_output("#{bin}/rbackup --version")
    assert_match version.to_s, output
  end
end

