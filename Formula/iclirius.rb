class Iclirius < Formula
  desc "Local-first Iclirius agent runtime and terminal interface"
  homepage "https://github.com/iclirius/iclirius-distribution"
  url "https://github.com/iclirius/iclirius-distribution/releases/download/v1.0.0-rc.8/iclirius-1.0.0-rc.8.tar.gz"
  sha256 "ef48cf1470bc7432b4334282fcbe1046fab9113a5aec457a22f18b59117ea640"
  license "MIT"

  depends_on "python@3.14"
  depends_on "ffmpeg" => :optional

  def install
    venv = libexec/"venv"
    system formula_opt_bin("python@3.14")/"python3.14", "-m", "venv", venv
    system venv/"bin/pip", "install", "--upgrade", "pip"
    system venv/"bin/pip", "install", "."
    bin.install_symlink venv/"bin/iclirius"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/iclirius --version")
    system bin/"iclirius", "node", "status", "--json"
  end
end
