class Dbmate < Formula
  desc "A lightweight, framework-agnostic database migration tool."
  homepage "https://github.com/amacneil/dbmate"
  url "https://github.com/amacneil/dbmate/archive/v0.1.tar.gz"
  version "0.1"
  sha256 "bba83b4feee69ac5a93c4d64d4f44d9361240cbcfc13ef3c27ceb81ef7860c11"

  head "https://github.com/amacneil/dbmate.git"

  bottle do
    root_url "https://github.com/amacneil/dbmate/releases/download/v0.1"
    cellar :any
    sha256 "44e8da6c940a66bc20fa6f244840833f74abbff0483814356b5bb9615a279060" => :el_capitan
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
