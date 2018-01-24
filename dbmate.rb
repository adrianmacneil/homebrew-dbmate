class Dbmate < Formula
  desc "Lightweight, framework-agnostic database migration tool."
  homepage "https://github.com/amacneil/dbmate"
  url "https://github.com/amacneil/dbmate/archive/v1.3.0.tar.gz"
  sha256 "f449fd1529067f9dd8fc9993b51b450c14ea61ed628d7256f7c58bcaed77bf60"

  head "https://github.com/amacneil/dbmate.git"

  bottle do
    root_url "https://github.com/amacneil/dbmate/releases/download/v1.3.0"
    sha256 "11b21beb647193756b6027f946c124cad231eac50dc247f9bdf06ec66724582c" => :high_sierra
    cellar :any
  end

  depends_on "go" => :build
  depends_on "dep" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/amacneil/dbmate").install buildpath.children

    cd "src/github.com/amacneil/dbmate" do
      system "dep", "ensure", "-vendor-only"
      system "go", "build", "-ldflags", "-s", "-o", bin/"dbmate", "./cmd/dbmate"
    end
  end

  test do
    system bin/"dbmate", "-v"
  end
end
