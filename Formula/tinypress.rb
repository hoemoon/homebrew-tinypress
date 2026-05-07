class Tinypress < Formula
  desc "Tiny static site generator"
  homepage "https://github.com/hoemoon/tiny-press"
  url "https://github.com/hoemoon/tiny-press/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "1d8abeb31b3a892928d90d6a7bfad3a6527be3b15bfc66e2befaefca3611de00"
  license "MIT"
  head "https://github.com/hoemoon/tiny-press.git", branch: "main"

  # Package.swift pins macOS 26 / iOS 26 — keep this in lockstep.
  depends_on xcode: ["26.0", :build]
  depends_on macos: :tahoe

  def install
    cd "core" do
      system "swift", "build",
             "--configuration", "release",
             "--disable-sandbox",
             "-Xswiftc", "-Osize"
      # SPM's `resource_bundle_accessor.swift` resolves the resource bundle
      # via `Bundle.main.bundleURL`, which follows the launch path — through
      # a `bin/` symlink it would look in `bin/` instead of `libexec/` and
      # miss the bundle. A tiny wrapper exec's the real binary so
      # `_NSGetExecutablePath` reports the libexec path.
      libexec.install ".build/release/tinypress"
      libexec.install ".build/release/TinyPress_TinyPressKit.bundle"
      (bin/"tinypress").write <<~SH
        #!/bin/bash
        exec "#{libexec}/tinypress" "$@"
      SH
    end
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/tinypress --version")

    site = testpath/"site"
    system bin/"tinypress", "init", site.to_s, "--title", "Smoke"
    assert_path_exists site/"tinypress.yml"
    assert_path_exists site/"content/posts/hello.md"

    output_dir = testpath/"out"
    system bin/"tinypress", "build", "-s", site.to_s, "-o", output_dir.to_s
    assert_path_exists output_dir/"index.html"
  end
end
