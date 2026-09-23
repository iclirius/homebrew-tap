class Iclirius < Formula
  desc "Local-first Iclirius agent runtime and terminal interface"
  homepage "https://github.com/iclirius/iclirius-distribution"
  url "https://github.com/iclirius/iclirius-distribution/releases/download/v1.0.0-rc.13/iclirius_openclaw-1.0.0rc13-py3-none-any.whl"
  sha256 "94d7d6b88afade278b2d7a4ae52824d9856aabe0e859852d1aeb9ed8cb4de1b4"
  license "MIT"

  depends_on "python@3.14"
  depends_on "ffmpeg" => :optional

  def install
    venv = libexec/"venv"
    system formula_opt_bin("python@3.14")/"python3.14", "-m", "venv", venv
    system venv/"bin/pip", "install", "--upgrade", "pip"
    wheel = buildpath/"iclirius_openclaw-1.0.0rc13-py3-none-any.whl"
    cp cached_download, wheel
    system venv/"bin/pip", "install", wheel
    bin.install_symlink venv/"bin/iclirius"
  end

  test do
    assert_match "1.0.0-rc.13", shell_output("#{bin}/iclirius --version")
    system bin/"iclirius", "node", "status", "--json"
  end
end
