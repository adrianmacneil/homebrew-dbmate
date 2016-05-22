class Dbmate < Formula
  desc "Lightweight, framework-agnostic database migration tool."
  homepage "https://github.com/amacneil/dbmate"
  url "https://github.com/amacneil/dbmate/archive/v1.0.1.tar.gz"
  sha256 "1eb41d3d3f1b7d273ec199dcac5cc5d023ac5d87481faad7c652b63bc9d12aed"

  head "https://github.com/amacneil/dbmate.git"

  bottle do
    root_url "https://github.com/amacneil/dbmate/releases/download/v1.0.1"
    cellar :any
    sha256 "db0960070131ca18bc0488e8be126861bcfb167df8653ee4a191b3c17c78579f" => :el_capitan
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
