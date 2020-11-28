class Ep < Formula
  desc "⛏ A CLI Emoji Picker"
  homepage "https://github.com/bcongdon/ep"
  url "https://github.com/bcongdon/ep/archive/0.2.0.tar.gz"
  sha256 "efdf5b4085e1df71d850b59886cebf04b9768a52c37540c4ee1420411ef3cdf0"

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
