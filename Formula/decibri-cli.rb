class DecibriCli < Formula
  desc "Small, fast, scriptable command-line tool for audio capture, playback, and device listing"
  homepage "https://decibri.com/docs/apis/cli"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/decibri/decibri-cli/releases/download/v0.4.0/decibri-universal2-apple-darwin.tar.gz"
    sha256 "6064dbd574b508a4d6773d7ef24ac5d8a555d5e304e4d7091dc4343f1c1288b9"
  end

  on_linux do
    on_intel do
      url "https://github.com/decibri/decibri-cli/releases/download/v0.4.0/decibri-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3120db93611f0e219f62957645f1ca9ff14ec433cadeef40b56e368c771bc714"
    end
    on_arm do
      url "https://github.com/decibri/decibri-cli/releases/download/v0.4.0/decibri-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "76f6f926abf05816566bfcc6b5968d36f07279aadc2bfa3b2dfbb7ee1fc8bcec"
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
