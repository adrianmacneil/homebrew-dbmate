class Dbmate < Formula
  desc "Lightweight, framework-agnostic database migration tool."
  homepage "https://github.com/amacneil/dbmate"
  url "https://github.com/amacneil/dbmate/archive/v1.1.0.tar.gz"
  sha256 "a7d57964da180ed54ea307c0dee38a8009f5df9f03689ec7ea0dbea8e8b62d99"

  head "https://github.com/amacneil/dbmate.git"

  bottle do
    root_url "https://github.com/amacneil/dbmate/releases/download/v1.0.1"
    cellar :any
    sha256 "e2158716ab2b9968e0317b941aef40d5ba493dd02784de550148ce3525f18fe3" => :el_capitan
  end

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    system "go", "get", "-d", "-v"
    system "go", "build", "-o", "dbmate"

    bin.install "dbmate"
  end

  test do
    system "#{bin}/dbmate", "-v"
  end
end
