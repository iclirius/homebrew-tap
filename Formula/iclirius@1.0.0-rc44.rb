class IcliriusAT100Rc44 < Formula
  desc "Local-first Iclirius agent runtime and terminal interface (Candidate V1)"
  homepage "https://github.com/iclirius/iclirius-distribution"
  url "https://github.com/iclirius/iclirius-distribution/releases/download/v1.0.0-rc.44/iclirius_openclaw-1.0.0rc44-py3-none-any.whl"
  sha256 "e1f9240290424854e9aa2ee45cee8140134c2022a2da02b8a139221a20208268"
  license "MIT"

  keg_only :versioned_formula

  depends_on "python@3.14"
  depends_on "ffmpeg" => :optional

  def install
    venv = libexec/"venv"
    system formula_opt_bin("python@3.14")/"python3.14", "-m", "venv", venv
    system venv/"bin/pip", "install", "--upgrade", "pip"
    wheel = buildpath/"iclirius_openclaw-1.0.0rc44-py3-none-any.whl"
    cp cached_download, wheel
    system venv/"bin/pip", "install", wheel
    bin.install_symlink venv/"bin/iclirius"
  end

  test do
    assert_match "1.0.0-rc.44", shell_output("#{bin}/iclirius --version")
    system bin/"iclirius", "node", "status", "--json"
  end
end
