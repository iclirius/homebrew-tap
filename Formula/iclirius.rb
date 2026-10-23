class Iclirius < Formula
  desc "Local-first agent runtime with unified cluster task TUI"
  homepage "https://github.com/iclirius/iclirius-distribution"
  url "https://github.com/iclirius/iclirius-distribution/releases/download/v1.0.0-rc.51/iclirius_openclaw-1.0.0rc51-py3-none-any.whl"
  sha256 "25d3ab6fad1e9bb480894b2b72f967ddb9f8fab409c1e02f72c03dcc41662f19"
  license "MIT"

  depends_on "python@3.14"
  depends_on "ffmpeg" => :optional

  def install
    venv = libexec/"venv"
    system formula_opt_bin("python@3.14")/"python3.14", "-m", "venv", venv
    system venv/"bin/pip", "install", "--upgrade", "pip"
    wheel = buildpath/"iclirius_openclaw-1.0.0rc51-py3-none-any.whl"
    cp cached_download, wheel
    system venv/"bin/pip", "install", wheel
    bin.install_symlink venv/"bin/iclirius"
    bin.install_symlink venv/"bin/iclirius-tui"
    bin.install_symlink venv/"bin/iclirius-tui-preview"
  end

  test do
    assert_match "1.0.0-rc.51", shell_output("#{bin}/iclirius --version")
    assert_path_exists bin/"iclirius-tui"
    assert_path_exists bin/"iclirius-tui-preview"
    system bin/"iclirius", "node", "status", "--json"
  end
end
