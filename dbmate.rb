class Dbmate < Formula
  desc "Lightweight, framework-agnostic database migration tool."
  homepage "https://github.com/amacneil/dbmate"
  url "https://github.com/amacneil/dbmate/archive/v1.0.0.tar.gz"
  sha256 "90ed8f0e4a09e97183bac0a35aeac7f6db2d441bdf99a081a01b5e75599a7ff3"

  head "https://github.com/amacneil/dbmate.git"

  bottle do
    root_url "https://github.com/amacneil/dbmate/releases/download/v1.0.0"
    cellar :any
    sha256 "b272b9c983f6340ea3081b33df48d0dc79ca440a4a3a5d51e1ead3d52063ef9c" => :el_capitan
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
