require "spec_helper"

describe MarkdownToWord::Document do

  subject do
    MarkdownToWord::Document.new("# Test")
  end

  it "stores the markdown" do
    expect(subject.markdown).to eql("# Test")
  end

  it "converts the html" do
    expect(subject.html).to eql("<h1>Test</h1>")
  end

  it "converts the file" do
    Tempfile.open("MarkdownToWord") do |file|
      File.write(file, subject.contents)
      expect(WordToMarkdown.new(file).to_s).to eql("# Test")
    end
  end
end
