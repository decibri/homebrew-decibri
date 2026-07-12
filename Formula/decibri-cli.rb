class DecibriCli < Formula
  desc "Small, fast, scriptable command-line tool for audio capture, playback, and device listing"
  homepage "https://decibri.com/docs/apis/cli"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/decibri/decibri-cli/releases/download/v0.3.0/decibri-universal2-apple-darwin.tar.gz"
    sha256 "9cc4544cde8501b8cd37a10b7f95b6db850117a0574c056d011efa9ff5c4da57"
  end

  on_linux do
    on_intel do
      url "https://github.com/decibri/decibri-cli/releases/download/v0.3.0/decibri-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "640e0a07e84bbfe24a23488dacfcee5b9ea6c631f684f458fd77a9461ad073eb"
    end
    on_arm do
      url "https://github.com/decibri/decibri-cli/releases/download/v0.3.0/decibri-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a7b135d5167e2cc5de4577cbae5682624f2d1a532638b038dd98992d2932f580"
    end
  end

  def install
    bin.install "decibri"
  end

  def caveats
    on_linux do
      <<~EOS
        decibri needs the ALSA runtime library (libasound.so.2), which Homebrew
        does not provide. Install it with your distribution's package manager:
          Debian/Ubuntu: sudo apt install libasound2
          Fedora:        sudo dnf install alsa-lib
          Arch:          sudo pacman -S alsa-lib
      EOS
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/decibri --version")
  end
end
