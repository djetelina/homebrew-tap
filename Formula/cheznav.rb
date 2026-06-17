class Cheznav < Formula
  include Language::Python::Virtualenv

  desc "TUI for chezmoi"
  homepage "https://github.com/DJetelina/cheznav"
  url "https://files.pythonhosted.org/packages/32/f0/df44f4cc1db5b9412c72d9c824b7a924d49c8762e3095d45bb9346b42181/cheznav-0.3.0.tar.gz"
  sha256 "2c09aeca9719367d7fb8ac8e320dd2dde4e359631a6a63574a2fc8deedfe5362"
  license "MIT"

  bottle do
    root_url "https://github.com/djetelina/homebrew-tap/releases/download/cheznav-0.3.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e381ae8933b1b706e285353153836d92c90785407b046ad6c3e95079a50c7228"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "dd97d7235e9a32a8fc2b595f1595b17c2cf1312204a0df8f4a153e9f6b431b9a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "51fa16c35630ccdde75da6fb336b0174c4c34f73d0b89952b1ecbe65554d245f"
  end

  depends_on "rust" => :build
  depends_on "python@3.14"

  resource "linkify-it-py" do
    url "https://files.pythonhosted.org/packages/2e/c9/06ea13676ef354f0af6169587ae292d3e2406e212876a413bf9eece4eb23/linkify_it_py-2.1.0.tar.gz"
    sha256 "43360231720999c10e9328dc3691160e27a718e280673d444c38d7d3aaa3b98b"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/06/ff/7841249c247aa650a76b9ee4bbaeae59370dc8bfd2f6c01f3630c35eb134/markdown_it_py-4.2.0.tar.gz"
    sha256 "04a21681d6fbb623de53f6f364d352309d4094dd4194040a10fd51833e418d49"
  end

  resource "mdit-py-plugins" do
    url "https://files.pythonhosted.org/packages/59/fc/f8d0863f8862f25602c0404d75568e89fb6b4109804645e5cdfb1be5cf56/mdit_py_plugins-0.6.1.tar.gz"
    sha256 "a2bca0f039f39dbd35fb74ae1b5f998608c437463371f0ff7f49a19a17a114d0"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "platformdirs" do
    url "https://files.pythonhosted.org/packages/d7/47/e4501f49c178ae1d9f4a75073fda4204f52647993f075a9db4d14930e0c5/platformdirs-4.10.0.tar.gz"
    sha256 "31e761a6a0ca04faf7353ea759bdba55652be214725111e5aac52dfa29d4bef7"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/c3/b2/bc9c9196916376152d655522fdcebac55e66de6603a76a02bca1b6414f6c/pygments-2.20.0.tar.gz"
    sha256 "6757cd03768053ff99f3039c1a36d6c0aa0b263438fcab17520b30a303a82b5f"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/c0/8f/0722ca900cc807c13a6a0c696dacf35430f72e0ec571c4275d2371fca3e9/rich-15.0.0.tar.gz"
    sha256 "edd07a4824c6b40189fb7ac9bc4c52536e9780fbbfbddf6f1e2502c31b068c36"
  end

  resource "textual" do
    url "https://files.pythonhosted.org/packages/9b/7a/c519db0aba5024f86e71e9631810bfdd6866ed2c8695bd7fa34b90e7ef59/textual-8.2.7.tar.gz"
    sha256 "658f568ff81e30ed43890c3e07520390e5cf1b4763822006e060656b0a88f105"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/72/94/1a15dd82efb362ac84269196e94cf00f187f7ed21c242792a923cdb1c61f/typing_extensions-4.15.0.tar.gz"
    sha256 "0cea48d173cc12fa28ecabc3b837ea3cf6f38c6d1136f85cbaaf598984861466"
  end

  resource "uc-micro-py" do
    url "https://files.pythonhosted.org/packages/78/67/9a363818028526e2d4579334460df777115bdec1bb77c08f9db88f6389f2/uc_micro_py-2.0.0.tar.gz"
    sha256 "c53691e495c8db60e16ffc4861a35469b0ba0821fe409a8a7a0a71864d33a811"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    version_output = shell_output("#{libexec}/bin/python -c 'import cheznav; print(cheznav.__version__)'").strip
    assert_equal version.to_s, version_output
  end
end
