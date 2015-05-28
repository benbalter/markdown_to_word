require "spec_helper"

describe MarkdownToWord do
  it "converts the file" do
    content = subject.convert("# Test").contents
    as_markdown(content) { |md| expect(md).to eql("# Test") }
  end

  it "returns the default template" do
    template_dir = MarkdownToWord.default_templates_path
    expect(template_dir).to eql(File.expand_path("../lib/markdown_to_word", File.dirname(__FILE__)))
    template = File.expand_path("default.docx", template_dir)
    expect(File.exists?(template)).to eql(true)
  end
end
