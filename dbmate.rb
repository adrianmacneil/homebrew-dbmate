class Dbmate < Formula
  desc "Lightweight, framework-agnostic database migration tool."
  homepage "https://github.com/amacneil/dbmate"
  head "https://github.com/amacneil/dbmate.git"
  url "https://github.com/amacneil/dbmate/archive/v1.4.0.tar.gz"
  sha256 "a070c016e13182b2d7c2303cb0648201fb18fa168e94a556b89a69c6a321518e"

  bottle do
    cellar :any
    root_url "https://github.com/amacneil/dbmate/releases/download/v1.4.0"
    sha256 "8ecba4e9a6f779f050df094fe46c7cbad468ca1b2fce78fc932fb947f6a317f5" => :high_sierra
  end

  depends_on "go" => :build
  depends_on "dep" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/amacneil/dbmate").install buildpath.children

    cd "src/github.com/amacneil/dbmate" do
      system "dep", "ensure", "-vendor-only"
      system "go", "build", "-ldflags", "-s", "-o", bin/"dbmate", "."
    end
  end

  test do
    system bin/"dbmate", "-v"
  end
end
