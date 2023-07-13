# frozen_string_literal: true

# Adds the otc-auth project to homebrew
class OtcAuth < Formula
  desc "Open Source CLI for the Open Telekom Cloud written in go"
  homepage "https://github.com/iits-consulting/otc-auth"

  version "2.0.0"
  license "MIT"

  on_arm do
    on_macos do
      url "https://github.com/iits-consulting/otc-auth/releases/download/v#{version}/otc-auth_#{version}_darwin_arm64.tar.gz"
      sha256 "469717f3fe6f207154a00b8a2dfc18fe818e2abb0ab823e2d56f4d1f1268d5fc"
    end
    on_linux do
      url "https://github.com/iits-consulting/otc-auth/releases/download/v#{version}/otc-auth_#{version}_linux_arm64.tar.gz"
      sha256 "ebc860e9c1eb53cface7cb626e24e18e86f5415ce7069ec9a17289e3226f14a9"
    end
  end

  on_intel do
    if Hardware::CPU.is_64_bit?
      on_macos do
        url "https://github.com/iits-consulting/otc-auth/releases/download/v#{version}/otc-auth_#{version}_darwin_amd64.tar.gz"
        sha256 "66e9f621516452201b668773c0ca2195e740e53a7d5c7778daefae5da3e99b24"
      end
      on_linux do
        url "https://github.com/iits-consulting/otc-auth/releases/download/v#{version}/otc-auth_#{version}_linux_amd64.tar.gz"
        sha256 "23ba798e7b7da6d0c18fcb6092691255ac70541ec0133c1dd594096090faab48"
      end
      on_windows do
        url "https://github.com/iits-consulting/otc-auth/releases/download/v#{version}/otc-auth_#{version}_windows_amd64.tar.gz"
        sha256 "c24ed8b1fc7a789fa566072c85334d3f05d53cccfe2f7c5aa8c904eb8d948ba6"
      end
    else
      on_linux do
        url "https://github.com/iits-consulting/otc-auth/releases/download/v#{version}/otc-auth_#{version}_linux_386.tar.gz"
        sha256 "e845052892d3f540a9d0ebf59f36365c30f991e05496070071560afe989795c3"
      end
      on_windows do
        url "https://github.com/iits-consulting/otc-auth/releases/download/v#{version}/otc-auth_#{version}_windows_386.tar.gz"
        sha256 "aa7d3b22a546993dc342298155d36d91fc1d5cee5167b85c90b67c5394530f5a"
      end
    end
  end

  def install
    bin.install name.to_s # Install the binary to the "bin" directory
    system "#{bin}/otc-auth", "version"
  end

  test do
    system "#{bin}/otc-auth", "version"
  end
end
