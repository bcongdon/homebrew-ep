class Ep < Formula
  desc "⛏ A CLI Emoji Picker"
  homepage "https://github.com/bcongdon/ep"
  url "https://github.com/bcongdon/ep/archive/0.1.0.tar.gz"
  sha256 "90d9b14ec07861a3479333480af0e474aaa8d6c32ae9fff7453e38f37bc2034c"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = HOMEBREW_CACHE/"go_cache"
    (buildpath/"src/github.com/bcongdon/ep").install buildpath.children

    cd "src/github.com/bcongdon/ep" do
      system "go", "build", "-o", bin/"ep"

      prefix.install_metafiles
    end
  end
end
