require "spec_helper"

describe MarkdownToWord do
  it "converts the file" do
    content = subject.convert("# Test").contents
    Tempfile.open("MarkdownToWord") do |file|
      File.write(file, content)
      expect(WordToMarkdown.new(file).to_s).to eql("# Test")
    end
  end

  it "returns the default template" do
    template_dir = MarkdownToWord.default_templates_path
    expect(template_dir).to eql(File.expand_path("../lib/markdown_to_word", File.dirname(__FILE__)))
    template = File.expand_path("default.docx", template_dir)
    expect(File.exists?(template)).to eql(true)
  end
end
