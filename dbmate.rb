class Dbmate < Formula
  desc "Lightweight, framework-agnostic database migration tool."
  homepage "https://github.com/amacneil/dbmate"
  head "https://github.com/amacneil/dbmate.git"
  url "https://github.com/amacneil/dbmate/archive/v1.4.1.tar.gz"
  sha256 "3ffb3909905a90cde16c08ff56cbbebccd71525560a1a1e0909aafbaf145729f"

  bottle do
    cellar :any
    root_url "https://github.com/amacneil/dbmate/releases/download/v1.4.1"
    sha256 "4dada7f59262e2badaf8abed84856466ffe01b366246160bf788113ea5c52438" => :high_sierra
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
