class Koncrete < Formula
  desc "Koncrete CLI tool"
  homepage "https://github.com/yourusername/Koncrete"
  version "0.0.38"

  case RUBY_PLATFORM
  when /darwin/
    if Hardware::CPU.intel?
      url "https://github.com/yourusername/Koncrete/releases/download/v#{version}/koncrete_#{version}_osx-x64-Koncrete-binary.tar.gz"
      sha256 "126eef9ebe9865476128abb810d714dbc2575e9ac46dd27d4cb47219a9c7df60"
    else
      url "https://github.com/yourusername/Koncrete/releases/download/v#{version}/koncrete_#{version}_osx-arm64-Koncrete-binary.tar.gz"
      sha256 "40e682ee0a9564dbebbfac4cdc629a540b6c806e63f6f127e902ae562982ea31"
    end
  when /linux/
    if Hardware::CPU.intel?
      url "https://github.com/yourusername/Koncrete/releases/download/v#{version}/koncrete_#{version}_linux-x64-Koncrete-binary.tar.gz"
      sha256 "2cc2012c6cb8d012b5e3c02614076314d81e9816be3a80dbdfffe7cce8ceae3e"
    else
      url "https://github.com/yourusername/Koncrete/releases/download/v#{version}/koncrete_#{version}_linux-arm64-Koncrete-binary.tar.gz"
      sha256 "<linux-arm64-sha256>"
    end
  else
    odie "Unsupported platform"
  end

  def install
    # Adjust binary name if needed
    bin.install "Koncrete-binary" => "koncrete"
  end

  test do
    system "#{bin}/koncrete", "--version"
  end
end
