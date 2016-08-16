class Dbmate < Formula
  desc "Lightweight, framework-agnostic database migration tool."
  homepage "https://github.com/amacneil/dbmate"
  url "https://github.com/amacneil/dbmate/archive/v1.2.0.tar.gz"
  sha256 "8f6a960ce58b99f57dfa1cf670b44cdccb26b680581aa65ffb95a02230372e57"

  head "https://github.com/amacneil/dbmate.git"

  bottle do
    root_url "https://github.com/amacneil/dbmate/releases/download/v1.2.0"
    cellar :any
    sha256 "12a2e54083cd402eac0f408a4c9f013add3bdbf17d4fc393119c092ad7e71bcf" => :el_capitan
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
