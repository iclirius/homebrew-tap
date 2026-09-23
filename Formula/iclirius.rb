class Iclirius < Formula
  desc "Local-first Iclirius agent runtime and terminal interface"
  homepage "https://github.com/iclirius/iclirius-distribution"
  url "https://github.com/iclirius/iclirius-distribution/releases/download/v1.0.0-rc.16/iclirius_openclaw-1.0.0rc16-py3-none-any.whl"
  sha256 "c50cd88e10ea88e44a9f792c2a2de4a7caa3e1bad90dfb5d2fc2ebf378e14c56"
  license "MIT"

  depends_on "python@3.14"
  depends_on "ffmpeg" => :optional

  def install
    venv = libexec/"venv"
    system formula_opt_bin("python@3.14")/"python3.14", "-m", "venv", venv
    system venv/"bin/pip", "install", "--upgrade", "pip"
    wheel = buildpath/"iclirius_openclaw-1.0.0rc16-py3-none-any.whl"
    cp cached_download, wheel
    system venv/"bin/pip", "install", wheel
    bin.install_symlink venv/"bin/iclirius"
  end

  test do
    assert_match "1.0.0-rc.16", shell_output("#{bin}/iclirius --version")
    system bin/"iclirius", "node", "status", "--json"
  end
end
