class Iclirius < Formula
  desc "Local-first Iclirius agent runtime and terminal interface"
  homepage "https://github.com/iclirius/iclirius-distribution"
  url "https://github.com/iclirius/iclirius-distribution/releases/download/v1.0.0-rc.32/iclirius_openclaw-1.0.0rc32-py3-none-any.whl"
  sha256 "8d2d8f0f83fb3f522811adb75ab6c2ca9ac8d914c1a91dc94b3492b3ba6bc137"
  license "MIT"

  depends_on "python@3.14"
  depends_on "ffmpeg" => :optional

  def install
    venv = libexec/"venv"
    system formula_opt_bin("python@3.14")/"python3.14", "-m", "venv", venv
    system venv/"bin/pip", "install", "--upgrade", "pip"
    wheel = buildpath/"iclirius_openclaw-1.0.0rc32-py3-none-any.whl"
    cp cached_download, wheel
    system venv/"bin/pip", "install", wheel
    bin.install_symlink venv/"bin/iclirius"
  end

  test do
    assert_match "1.0.0-rc.32", shell_output("#{bin}/iclirius --version")
    system bin/"iclirius", "node", "status", "--json"
  end
end
