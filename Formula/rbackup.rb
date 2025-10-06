class Rbackup < Formula
  desc "Incremental backup tool in Rust (multi-platform)"
  homepage "https://github.com/umpire274/rBackup"
  license "MIT"
  version "0.5.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/umpire274/rBackup/releases/download/v#{version}/rbackup-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "02d09256ba4b92c54b5d721ce471e042965b3a502bcc682b453d6e5a93253116"
    elsif Hardware::CPU.arm?
      url "https://github.com/umpire274/rBackup/releases/download/v#{version}/rbackup-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "c0c83bf5ff4e104b7e73b47c6d255f4f8e2132bcf4c5b82da213fa0e0f033a9e"
    end
  end

  on_linux do
    url "https://github.com/umpire274/rBackup/releases/download/v#{version}/rbackup-#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7bd131b72e2b086763a11696894bb69d4063f97b981e9911d058814f25a1c5be"
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

