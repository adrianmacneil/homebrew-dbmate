class Dbmate < Formula
  desc "Lightweight, framework-agnostic database migration tool."
  homepage "https://github.com/amacneil/dbmate"
  url "https://github.com/amacneil/dbmate/archive/v1.2.1.tar.gz"
  sha256 "046b20ff292dd80e5c9832ade01f67fb3631cccc2eeb372de51f32d375b16377"

  head "https://github.com/amacneil/dbmate.git"

  bottle do
    root_url "https://github.com/amacneil/dbmate/releases/download/v1.2.1"
    cellar :any
    sha256 "b0757628001e0002548320dc8aac128710bef3becc04f94c583ed5afe71a4c97" => :el_capitan
  end

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/amacneil/dbmate").install buildpath.children

    cd "src/github.com/amacneil/dbmate" do
      system "go", "build", "-o", bin/"dbmate"
    end
  end

  test do
    system bin/"dbmate", "-v"
  end
end
