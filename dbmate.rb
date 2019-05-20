class Dbmate < Formula
  desc "Lightweight, framework-agnostic database migration tool"
  homepage "https://github.com/amacneil/dbmate"
  url "https://github.com/amacneil/dbmate/archive/v1.5.0.tar.gz"
  sha256 "ec9a19c74ce100094f729dec1877d34097856360c88a4371959a4a5bbb4d6429"
  head "https://github.com/amacneil/dbmate.git"

  bottle do
    cellar :any
    root_url "https://github.com/amacneil/dbmate/releases/download/v1.5.0"
    sha256 "1822d836d2d75dfec44d41e49d28e6c74f1ab2404b317b0561e20e03a44e881d" => :mojave
  end

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-s", "-o", bin/"dbmate", "."
  end

  test do
    system bin/"dbmate", "-v"
  end
end
