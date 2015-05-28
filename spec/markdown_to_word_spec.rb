require "spec_helper"

describe MarkdownToWord do
  it "converts the file" do
    content = subject.convert("# Test").contents
    Tempfile.open("MarkdownToWord") do |file|
      File.write(file, content)
      expect(WordToMarkdown.new(file).to_s).to eql("# Test")
    end
  end
end
